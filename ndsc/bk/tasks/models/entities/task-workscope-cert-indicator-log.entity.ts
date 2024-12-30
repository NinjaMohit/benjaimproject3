import { BaseEntity, Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('task_workscope_cert_indicator_log')
export class Task_workscope_cert_indicator_log extends BaseEntity {
  @PrimaryGeneratedColumn()
  task_workscope_cert_indicator_log_id: number;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  task_workscope_cert_indicator_log_key: string;

  @Column({ type: 'int' })
  task_workscope_cert_indicator_id: number;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  task_workscope_cert_indicator_key: string;

  @Column({ type: 'int' })
  task_workscope_id: number;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  task_workscope_key: string;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'latin1',
    collation: 'latin1_swedish_ci',
  })
  task_inspection_key: string;

  @Column({
    type: 'varchar',
    length: 50,
    nullable: true,
    charset: 'latin1',
    collation: 'latin1_swedish_ci',
  })
  task_summary_key: string;

  @Column({ type: 'int', default: 0 })
  task_summary_id: number;

  @Column({ type: 'int' })
  equipment_id: number;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  equipment_key: string;

  @Column({ type: 'int' })
  certificate_indicator_id: number;

  @Column({ type: 'float' })
  measure: number;

  @Column({
    type: 'varchar',
    length: 500,
    charset: 'latin1',
    collation: 'latin1_swedish_ci',
  })
  comment: string;

  @Column({ type: 'datetime', nullable: true })
  inspection_date: Date;

  @Column({ type: 'int' })
  indicator_status: number;

  @Column({
    type: 'varchar',
    length: 100,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  inspection_by: string;

  @Column({ type: 'int' })
  status: number;

  @Column({ type: 'int' })
  is_deleted: number;

  @Column({ type: 'datetime' })
  sync_date: Date;

  @Column({ type: 'int' })
  sync_flag: number;
}