import { Module } from '@nestjs/common';
import { TasksService } from './tasks.service';
import { TasksController } from './tasks.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Task } from './models/entities/task.entity';
import { Task_inspection_type } from './models/entities/task-inspection-type.entity'; // Updated import
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

@Module({
  imports: [
    TypeOrmModule.forFeature([
      Task,
      Task_inspection_type,
      Task_equipment,
      Task_exipired_notification,
      Task_expiring_notification_send_dates,
      Task_notification,
      Task_summary_doc,
      Task_summary_img,
      Task_summary_status,
      Task_workscope_cert_indicator,
      Task_workscope_cert_indicator_log,
      Task_workscope_item,
      Task_workscope_item_indicator_image,
      Task_workscope_item_inspection,
      Task_workscope_item_inspection_log,
      Task_workscope_specific_equipment,
      Framework_organisation,
    ]),
  ], // Updated class name
  controllers: [TasksController],
  providers: [TasksService],
  exports: [TasksService],
})
export class TasksModule {}
