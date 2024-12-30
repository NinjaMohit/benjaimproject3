import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Task_inspection_type } from './models/entities/task-inspection-type.entity';
import { Repository, In } from 'typeorm';
import { Task } from './models/entities/task.entity';
import { Task_equipment } from './models/entities/task-equipment.entity';
import { Task_exipired_notification } from './models/entities/task-exipired-notification.entity';
import { Task_expiring_notification_send_dates } from './models/entities/task-expiring-notification-send-dates.entity';
import { Task_notification } from './models/entities/task-notification.entity';
import { Task_summary_doc } from './models/entities/task-summary-doc.entity';
import { Task_summary_img } from './models/entities/task-summary-img.entity';
import { Task_summary_status } from './models/entities/task-summary-status.entity';
import { Task_workscope_cert_indicator } from './models/entities/task-workscope-cert-indicator.entity';
import { Task_workscope_cert_indicator_log } from './models/entities/task-workscope-cert-indicator-log.entity';
import { Task_workscope_item } from './models/entities/task-workscope-item.entity';
import { Task_workscope_item_indicator_image } from './models/entities/task-workscope-item-indicator-image.entity';
import { Task_workscope_item_inspection } from './models/entities/task-workscope-item-inspection.entity';
import { Task_workscope_item_inspection_log } from './models/entities/task-workscope-item-inspection-log.entity';
import { Task_workscope_specific_equipment } from './models/entities/task-workscope-specific-equipment.entity';
import { Framework_organisation } from './models/entities/framework-organisation.entity';
import { Brackets } from 'typeorm';

@Injectable()
export class TasksService {
  constructor(
    @InjectRepository(Framework_organisation)
    private FrameworkOrganisationRepository: Repository<Framework_organisation>,

    @InjectRepository(Task)
    private taskRepository: Repository<Task>,

    @InjectRepository(Task_inspection_type)
    private taskInspectionTypeRepository: Repository<Task_inspection_type>,

    @InjectRepository(Task_equipment)
    private taskEquipmentRepository: Repository<Task_equipment>,

    @InjectRepository(Task_exipired_notification)
    private taskExipiredNotificationRepository: Repository<Task_exipired_notification>,

    @InjectRepository(Task_expiring_notification_send_dates)
    private taskExipiringNotificationSendDatesRepository: Repository<Task_expiring_notification_send_dates>,

    @InjectRepository(Task_notification)
    private taskNotificationRepository: Repository<Task_notification>,

    @InjectRepository(Task_summary_doc)
    private taskSummaryDocRepository: Repository<Task_summary_doc>,

    @InjectRepository(Task_summary_img)
    private taskSummaryImgRepository: Repository<Task_summary_img>,

    @InjectRepository(Task_summary_status)
    private taskSummaryStatusRepository: Repository<Task_summary_status>,

    @InjectRepository(Task_workscope_cert_indicator)
    private taskWorkscopeCertIndicatorRepository: Repository<Task_workscope_cert_indicator>,

    @InjectRepository(Task_workscope_cert_indicator_log)
    private taskWorkscopeCertIndicatorlogRepository: Repository<Task_workscope_cert_indicator_log>,

    @InjectRepository(Task_workscope_item)
    private taskWorkscopeItemRepository: Repository<Task_workscope_item>,

    @InjectRepository(Task_workscope_item_indicator_image)
    private taskWorkscopeItemIndicatorImageRepository: Repository<Task_workscope_item_indicator_image>,

    @InjectRepository(Task_workscope_item_inspection)
    private taskWorkscopeItemInspectionRepository: Repository<Task_workscope_item_inspection>,

    @InjectRepository(Task_workscope_item_inspection_log)
    private taskWorkscopeItemInspectionLogRepository: Repository<Task_workscope_item_inspection_log>,

    @InjectRepository(Task_workscope_specific_equipment)
    private taskWorkscopeSpecificEquipmentRepository: Repository<Task_workscope_specific_equipment>,
  ) {}

  async getLocationsByParentId(parentId: number): Promise<number[]> {
    const locations = await this.FrameworkOrganisationRepository.find({
      relations: ['children'], // Fetch child locations recursively
      where: { parent: { organisation_id: parentId } }, // Match locations by their parent ID
    });

    // Map to get an array of organisation_ids from the children
    const organisationIds = locations.flatMap((location) =>
      location.children.map((child) => child.organisation_id),
    );

    organisationIds.push(parentId);

    return organisationIds;
  }

  async getInspectionTypes(): Promise<any> {
    const inspectionTypes = await this.taskInspectionTypeRepository.find({
      where: {
        status: 1,
      },
    });

    return inspectionTypes;
  }

  async getTasks(location_id: number, user_id: number): Promise<Task[]> {
    const locationid = await this.getLocationsByParentId(location_id);

    const tasks = await this.taskRepository
      .createQueryBuilder('task')
      .where('task.location IN(:locationid)', { locationid })
      .andWhere(
        new Brackets((qb) => {
          qb.where('task.assigned_to = :user_id', { user_id }).orWhere(
            'FIND_IN_SET(:user_id, task.system_email_users)',
            { user_id },
          );
        }),
      )
      .getMany();
    return tasks;
  }

  async getTaskequipments(task_key: string): Promise<Task_equipment[]> {
    const task_equipment_filters = await this.taskEquipmentRepository
      .createQueryBuilder('task_equipment')
      .where('task_key = :task_key', { task_key })
      .getMany();

    return task_equipment_filters;
  }

  async getTaskequipment(task_equipment_key: string): Promise<Task_equipment> {
    const task_equipment_filter = await this.taskEquipmentRepository
      .createQueryBuilder('task_equipment')
      .where('task_equipment_key = :task_equipment_key', { task_equipment_key })
      .getOne();

    return task_equipment_filter;
  }

  async getTaskExpiredNotifications(
    location_id: number,
    user_id: number,
  ): Promise<Task_exipired_notification[]> {
    const tasks = await this.getTasks(location_id, user_id);
    const ids = [];

    for (var i = 0; i < tasks.length; i++) {
      var id = tasks[i]['task_id'];
      ids.push(id);
    }

    const task_expired_notifications =
      await this.taskExipiredNotificationRepository
        .createQueryBuilder('task_exipired_notification')
        .where('task_id IN(:ids)', { ids })
        .andWhere('expire_assigne_user_id = :user_id', { user_id })
        .andWhere('status = 1')
        .getMany();

    return task_expired_notifications;
  }

  async getTaskExpiringNotifications(
    location_id: number,
    user_id: number,
  ): Promise<Task_expiring_notification_send_dates[]> {
    const tasks = await this.getTasks(location_id, user_id);
    const ids = [];

    for (var i = 0; i < tasks.length; i++) {
      var id = tasks[i]['task_id'];
      ids.push(id);
    }

    const task_expiring_notifications =
      await this.taskExipiringNotificationSendDatesRepository
        .createQueryBuilder('task_expiring_notification_send_dates')
        .where('task_id IN(:ids)', { ids })
        .andWhere('status = 1')
        .getMany();

    return task_expiring_notifications;
  }

  async getTaskNotifications(): Promise<Task_notification[]> {
    const task_notifications = await this.taskNotificationRepository
      .createQueryBuilder('task_notification')
      .getMany();

    return task_notifications;
  }

  async getTaskNotification(task_key: string): Promise<Task_notification[]> {
    const task_notification = await this.taskNotificationRepository
      .createQueryBuilder('task_notification')
      .where('task_key = :task_key', { task_key })
      .getMany();

    return task_notification;
  }

  async getTaskSummaryDocs(
    task_summary_key: string,
  ): Promise<Task_summary_doc[]> {
    const taskSummaryDoc = await this.taskSummaryDocRepository
      .createQueryBuilder('task_summary_doc')
      .where('task_summary_key = :task_summary_key', { task_summary_key })
      .getMany();

    return taskSummaryDoc;
  }

  async getTaskSummaryImgs(
    task_summary_key: string,
  ): Promise<Task_summary_img[]> {
    const taskSummaryImg = await this.taskSummaryImgRepository
      .createQueryBuilder('task_summary_img')
      .where('task_summary_key = :task_summary_key', { task_summary_key })
      .getMany();

    return taskSummaryImg;
  }

  async getTaskSummarys(task_key: string): Promise<Task_summary_status[]> {
    const taskSummary = await this.taskSummaryStatusRepository
      .createQueryBuilder('Task_summary_status')
      .where('task_key = :task_key', { task_key })
      .getMany();

    return taskSummary;
  }

  async getTaskWorkscopeCertIndicator(
    task_workscope_key: string,
  ): Promise<Task_workscope_cert_indicator[]> {
    const taskIndicatos = await this.taskWorkscopeCertIndicatorRepository
      .createQueryBuilder('task_workscope_cert_indicator')
      .where('task_workscope_key = :task_workscope_key', { task_workscope_key })
      .getMany();

    return taskIndicatos;
  }

  async getTaskWorkscopeItems(
    location_id: number,
    user_id: number,
  ): Promise<Task_workscope_item[]> {
    const tasks = await this.getTasks(location_id, user_id);
    const ids = [];

    for (var i = 0; i < tasks.length; i++) {
      var id = tasks[i]['task_id'];
      ids.push(id);
    }

    const taskItems = await this.taskWorkscopeItemRepository
      .createQueryBuilder('task_workscope_item')
      .where('task_id IN(:ids)', { ids })
      .andWhere('is_deleted = 0')
      .getMany();

    return taskItems;
  }

  async getTaskWorkscopeItemInspections(
    location_id: number,
    user_id: number,
  ): Promise<Task_workscope_item_inspection[]> {
    const tasks = await this.getTaskWorkscopeItems(location_id, user_id);
    const ids = [];

    for (var i = 0; i < tasks.length; i++) {
      var id = tasks[i]['task_id'];
      ids.push(id);
    }

    const taskItems = await this.taskWorkscopeItemInspectionRepository
      .createQueryBuilder('task_workscope_item_inspection')
      .where('task_workscope_id IN(:ids)', { ids })
      .andWhere('is_deleted = 0')
      .getMany();

    return taskItems;
  }

  async getTaskWorkscopeSpecificEquipment(
    task_key: string,
  ): Promise<Task_workscope_specific_equipment[]> {
    const taskItems = await this.taskWorkscopeSpecificEquipmentRepository
      .createQueryBuilder('task_workscope_specific_equipment')
      .where('task_key = :task_key', { task_key })
      .getMany();

    return taskItems;
  }
}
