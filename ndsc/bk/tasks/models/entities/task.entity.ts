import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('task')
export class Task {
  @PrimaryGeneratedColumn()
  task_id: number;

  @Column({ type: 'varchar', length: 255 })
  title: string;

  @Column({ type: 'varchar', length: 50 })
  task_key: string;

  @Column({ type: 'date' })
  start_date: Date;

  @Column({ type: 'date' })
  start_inspection_date: Date;

  @Column({ type: 'date', nullable: true })
  start_inspection_date_on_app: Date;

  @Column({ type: 'varchar', length: 50 })
  task_inspection_key: string;

  @Column({ type: 'int' })
  location: number;

  @Column({ type: 'int' })
  is_reoccuring: number;

  @Column({ type: 'int' })
  system_task: number;

  @Column({ type: 'varchar', length: 255 })
  system_email_users: string;

  @Column({ type: 'int' })
  assigned_to: number;

  @Column({ type: 'varchar', length: 10 })
  task_days_hours: string;

  @Column({ type: 'varchar', length: 50, nullable: true })
  last_days: string;

  @Column({ type: 'varchar', length: 50, nullable: true })
  next_days: string;

  @Column({ type: 'varchar', length: 50 })
  valid_days: string;

  @Column({ type: 'float' })
  remaining_days: number;

  @Column({ type: 'float', default: 0 })
  last_hours: number;

  @Column({ type: 'float', default: 0 })
  remaining_hours: number;

  @Column({ type: 'float', default: 0 })
  current_hours: number;

  @Column({ type: 'float', default: 0 })
  valid_hours: number;

  @Column({ type: 'text', nullable: true })
  comments: string;

  @Column({ type: 'int', default: 1 })
  status: number;

  @Column({ type: 'int', default: 1 })
  last_status_before_expiring: number;

  @Column({ type: 'int', default: 1 })
  task_status: number;

  @Column({ type: 'int' })
  overdue: number;

  @Column({ type: 'date', nullable: true })
  complete_date: Date;

  @Column({ type: 'float' })
  hours_on_completion: number;

  @Column({ type: 'float', default: 0 })
  next_completion_hrs: number;

  @Column({ type: 'int' })
  is_approved: number;

  @Column({ type: 'varchar', length: 255 })
  completed_by: string;

  @Column({ type: 'int' })
  all_cert_status: number;

  @Column({ type: 'int' })
  ex_workscope: number;

  @Column({ type: 'varchar', length: 50, nullable: true })
  exzone_workscope: string;

  @Column({ type: 'int' })
  drops_workscope: number;

  @Column({ type: 'int', default: 0 })
  tubular_workscope: number;

  @Column({ type: 'varchar', length: 50 })
  dropzone_workscope: string;

  @Column({ type: 'int', default: 1 })
  task_type: number;

  @Column({ type: 'int', default: 0 })
  critical: number;

  @Column({ type: 'int', default: 0 })
  task_end_flag: number;

  @Column({ type: 'int', default: 1 })
  inspection_type: number;

  @Column({ type: 'varchar', length: 150, nullable: true })
  PIC: string;

  @Column({ type: 'varchar', length: 150, nullable: true })
  PIC_no: string;

  @Column({ type: 'varchar', length: 250, nullable: true })
  PTW_number: string;

  @Column({ type: 'text', nullable: true })
  summary_inspection_comment: string;

  @Column({ type: 'varchar', length: 255, nullable: true })
  summary_inspector_signature: string;

  @Column({ type: 'varchar', length: 255, nullable: true })
  summary_inspector_name: string;

  @Column({ type: 'varchar', length: 255, nullable: true })
  summary_approval_name: string;

  @Column({ type: 'varchar', length: 255, nullable: true })
  summary_approval_signature: string;

  @Column({ type: 'varchar', length: 500, nullable: true })
  city_address: string;

  @Column({ type: 'varchar', length: 500, nullable: true })
  gps: string;

  @Column({ type: 'varchar', length: 500, nullable: true })
  standard_ref: string;

  @Column({ type: 'varchar', length: 25, default: 'serial' })
  default_workscope_sort: string;

  @Column({ type: 'int', default: 0 })
  is_hold: number;

  @Column({ type: 'int', default: 0 })
  workscope_is_available: number;

  @Column({ type: 'int', default: 0 })
  total_major_cert: number;

  @Column({ type: 'varchar', length: 50, nullable: true })
  template_id: string;

  @Column({ type: 'varchar', length: 500, nullable: true })
  template_positions: string;

  @Column({ type: 'int', default: 0 })
  total_intermediate_cert: number;

  @Column({ type: 'int', default: 0 })
  admin_will_task_out: number;

  @Column({ type: 'int', nullable: true })
  workscope_is_available_bk: number;

  @Column({ type: 'int' })
  created_by: number;

  @Column({ type: 'datetime', nullable: true })
  created_on: Date;

  @Column({ type: 'int' })
  updated_by: number;

  @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
  updated_on: Date;

  @Column({ type: 'datetime' })
  sync_date: Date;
}
