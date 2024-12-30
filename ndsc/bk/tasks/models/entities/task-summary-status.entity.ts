import { BaseEntity, Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('task_summary_status')
export class Task_summary_status extends BaseEntity {
  @PrimaryGeneratedColumn()
  task_summary_id: number;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  task_summary_key: string;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'latin1',
    collation: 'latin1_swedish_ci',
  })
  task_inspection_key: string;

  @Column({ type: 'date' })
  complete_date: Date;

  @Column({
    type: 'varchar',
    length: 100,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  completed_by: string;

  @Column({ type: 'int', default: 0 })
  reported_user_signature: number;

  @Column({ type: 'int', default: 0 })
  user_no_of_signature: number;

  @Column({ type: 'date', nullable: true })
  next_days: Date;

  @Column({ type: 'date', nullable: true })
  last_days: Date;

  @Column({ type: 'int' })
  task_status: number;

  @Column({ type: 'int' })
  task_id: number;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  task_key: string;

  @Column({ type: 'int' })
  total_item: number;

  @Column({ type: 'int' })
  pass: number;

  @Column({ type: 'int' })
  fail: number;

  @Column({ type: 'int' })
  not_found: number;

  @Column({ type: 'int' })
  no_access: number;

  @Column({ type: 'int', default: 0 })
  corrective_action: number;

  @Column({ type: 'int', default: 0 })
  corrective: number;

  @Column({ type: 'int', default: 0 })
  assigned_to: number;

  @Column({ type: 'int', default: 0 })
  critical: number;

  @Column({ type: 'float', default: 0 })
  overdue_days: number;

  @Column({ type: 'float', default: 0 })
  overdue_hours: number;

  @Column({ type: 'int' })
  status: number;

  @Column({ type: 'int', default: 0 })
  valid_days: number;

  @Column({ type: 'datetime' })
  summary_date: Date;

  @Column({
    type: 'text',
    charset: 'latin1',
    collation: 'latin1_swedish_ci',
    nullable: true,
  })
  inspection_comment: string;

  @Column({
    type: 'varchar',
    length: 250,
    charset: 'latin1',
    collation: 'latin1_swedish_ci',
    nullable: true,
  })
  inspector_signature: string;

  @Column({
    type: 'varchar',
    length: 255,
    charset: 'latin1',
    collation: 'latin1_swedish_ci',
    nullable: true,
  })
  inspector_name: string;

  @Column({
    type: 'text',
    charset: 'latin1',
    collation: 'latin1_swedish_ci',
    nullable: true,
  })
  approval_name: string;

  @Column({
    type: 'varchar',
    length: 250,
    charset: 'latin1',
    collation: 'latin1_swedish_ci',
    nullable: true,
  })
  approval_signature: string;

  @Column({
    type: 'varchar',
    length: 250,
    charset: 'latin1',
    collation: 'latin1_swedish_ci',
    nullable: true,
  })
  PIC: string;

  @Column({
    type: 'varchar',
    length: 250,
    charset: 'latin1',
    collation: 'latin1_swedish_ci',
    nullable: true,
  })
  PIC_no: string;

  @Column({
    type: 'varchar',
    length: 250,
    charset: 'latin1',
    collation: 'latin1_swedish_ci',
    nullable: true,
  })
  PTW_number: string;

  @Column({ type: 'int', default: 1 })
  task_inspection_type: number;

  @Column({ type: 'float', default: 0 })
  hours_on_completion: number;

  @Column({ type: 'float', default: 0 })
  next_completion_hrs: number;

  @Column({ type: 'int', default: 0 })
  location: number;

  @Column({
    type: 'varchar',
    length: 255,
    charset: 'latin1',
    collation: 'latin1_swedish_ci',
    nullable: true,
  })
  standard_ref: string;

  @Column({ type: 'int', default: 3 })
  verification: number;

  @Column({ type: 'datetime', nullable: true })
  sync_date: Date;
}
