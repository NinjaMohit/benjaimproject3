import { BaseEntity, Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('task_expiring_notification_send_dates')
export class Task_expiring_notification_send_dates extends BaseEntity {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  task_expiring_notification_send_dates_key: string;

  @Column({ type: 'int' })
  task_id: number;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'latin1',
    collation: 'latin1_swedish_ci',
  })
  task_key: string;

  @Column({ type: 'date' })
  notification_date: string;

  @Column({ type: 'date' })
  notification_enddate: string;

  @Column({ type: 'int' })
  expiring_notification_day_option: number;

  @Column({ type: 'int', default: 0, comment: '0 - Disable, 1 - Enable' })
  status: number;

  @Column({ type: 'datetime', nullable: true })
  sync_date: Date;
}
