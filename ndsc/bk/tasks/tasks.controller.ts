import { Controller, Get, Param, UseGuards } from '@nestjs/common';
import { TasksService } from './tasks.service';
import { JwtAuthGuard } from 'src/auth/guards/jwt-auth.guard';
import { Task_inspection_type } from './models/entities/task-inspection-type.entity';
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

@Controller('tasks')
export class TasksController {
  constructor(private readonly tasksService: TasksService) {}

  @UseGuards(JwtAuthGuard)
  @Get('/getLocationsByParentId/:parentId')
  async getLocationsByParentId(@Param('parentId') parentId: number) {
    return (
      await this.tasksService.getLocationsByParentId(parentId)
    ).toString();
  }

  @UseGuards(JwtAuthGuard)
  @Get('/getInspectionTypes')
  getInspectionTypes(): Promise<Task_inspection_type> {
    return this.tasksService.getInspectionTypes();
  }

  @UseGuards(JwtAuthGuard)
  @Get('/getTasks/:location_id/:user_id')
  getTasks(
    @Param('location_id') location_id: number,
    @Param('user_id') user_id: number,
  ): Promise<Task[]> {
    return this.tasksService.getTasks(location_id, user_id);
  }

  @UseGuards(JwtAuthGuard)
  @Get('/getTaskequipments/:task_key')
  getTaskequipments(
    @Param('task_key') task_key: string,
  ): Promise<Task_equipment[]> {
    return this.tasksService.getTaskequipments(task_key);
  }

  @UseGuards(JwtAuthGuard)
  @Get('/getTaskequipment/:task_equipment_key')
  getTaskequipment(
    @Param('task_equipment_key') task_equipment_key: string,
  ): Promise<Task_equipment> {
    return this.tasksService.getTaskequipment(task_equipment_key);
  }

  @UseGuards(JwtAuthGuard)
  @Get('/getTaskExpiredNotifications/:location_id/:user_id')
  getTaskExpiredNotifications(
    @Param('location_id') location_id: number,
    @Param('user_id') user_id: number,
  ): Promise<Task_exipired_notification[]> {
    return this.tasksService.getTaskExpiredNotifications(location_id, user_id);
  }

  @UseGuards(JwtAuthGuard)
  @Get('/getTaskExpiringNotifications/:location_id/:user_id')
  getTaskExpiringNotifications(
    @Param('location_id') location_id: number,
    @Param('user_id') user_id: number,
  ): Promise<Task_expiring_notification_send_dates[]> {
    return this.tasksService.getTaskExpiringNotifications(location_id, user_id);
  }

  @UseGuards(JwtAuthGuard)
  @Get('/getTaskNotifications')
  getTaskNotifications(): Promise<Task_notification[]> {
    return this.tasksService.getTaskNotifications();
  }

  @UseGuards(JwtAuthGuard)
  @Get('/getTaskNotification/:task_key')
  getTaskNotification(
    @Param('task_key') task_key: string,
  ): Promise<Task_notification[]> {
    return this.tasksService.getTaskNotification(task_key);
  }

  @UseGuards(JwtAuthGuard)
  @Get('/getTaskSummaryDocs/:task_summary_key')
  getTaskSummaryDocs(
    @Param('task_summary_key') task_summary_key: string,
  ): Promise<Task_summary_doc[]> {
    return this.tasksService.getTaskSummaryDocs(task_summary_key);
  }

  @UseGuards(JwtAuthGuard)
  @Get('/getTaskSummaryImgs/:task_summary_key')
  getTaskSummaryImgs(
    @Param('task_summary_key') task_summary_key: string,
  ): Promise<Task_summary_img[]> {
    return this.tasksService.getTaskSummaryImgs(task_summary_key);
  }

  @UseGuards(JwtAuthGuard)
  @Get('/getTaskSummarys/:task_key')
  getTaskSummarys(
    @Param('task_key') task_key: string,
  ): Promise<Task_summary_status[]> {
    return this.tasksService.getTaskSummarys(task_key);
  }

  @UseGuards(JwtAuthGuard)
  @Get('/getTaskWorkscopeCertIndicator/:task_workscope_key')
  getTaskWorkscopeCertIndicator(
    @Param('task_workscope_key') task_workscope_key: string,
  ): Promise<Task_workscope_cert_indicator[]> {
    return this.tasksService.getTaskWorkscopeCertIndicator(task_workscope_key);
  }

  @UseGuards(JwtAuthGuard)
  @Get('/getTaskWorkscopeItems/:location_id/:user_id')
  getTaskWorkscopeItems(
    @Param('location_id') location_id: number,
    @Param('user_id') user_id: number,
  ): Promise<Task_workscope_item[]> {
    return this.tasksService.getTaskWorkscopeItems(location_id, user_id);
  }

  @UseGuards(JwtAuthGuard)
  @Get('/getTaskWorkscopeItemInspections/:location_id/:user_id')
  getTaskWorkscopeItemInspections(
    @Param('location_id') location_id: number,
    @Param('user_id') user_id: number,
  ): Promise<Task_workscope_item_inspection[]> {
    return this.tasksService.getTaskWorkscopeItemInspections(
      location_id,
      user_id,
    );
  }

  @Get('/getTaskWorkscopeSpecificEquipment/:task_key')
  getTaskWorkscopeSpecificEquipment(
    @Param('task_key') task_key: string,
  ): Promise<Task_workscope_specific_equipment[]> {
    return this.tasksService.getTaskWorkscopeSpecificEquipment(task_key);
  }
}
