import { BaseEntity, Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('task_workscope_item_inspection_log')
export class Task_workscope_item_inspection_log extends BaseEntity {
  @PrimaryGeneratedColumn()
  task_workscope_item_inspection_log_id: number;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  task_workscope_item_inspection_log_key: string;

  @Column({ type: 'int' })
  task_workscope_item_inspection_id: number;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  task_workscope_item_inspection_key: string;

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
    charset: 'utf8',
    collation: 'utf8_general_ci',
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

  @Column({ type: 'datetime', nullable: true })
  inspection_date: Date;

  @Column({ type: 'int' })
  inspection_status: number;

  @Column({
    type: 'int',
    default: 0,
    comment: '0 = Not found, 1 = Pending, 2 = Pass, 3 = Reject',
  })
  indicator_status: number;

  @Column({
    type: 'varchar',
    length: 1000,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  comment: string;

  @Column({
    type: 'varchar',
    length: 100,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  inspection_by: string;

  @Column({
    type: 'varchar',
    length: 100,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  inspectionar_signature: string;

  @Column({ type: 'int' })
  is_deleted: number;

  @Column({ type: 'int' })
  is_published: number;

  @Column({ type: 'datetime' })
  sync_date: Date;
}
