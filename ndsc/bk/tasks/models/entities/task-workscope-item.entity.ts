import { BaseEntity, Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('task_workscope_item')
export class Task_workscope_item extends BaseEntity {
  @PrimaryGeneratedColumn()
  task_workscope_id: number;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  task_workscope_key: string;

  @Column({ type: 'int' })
  task_equipment_id: number;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  task_equipment_key: string;

  @Column({ type: 'int' })
  task_workscope_specific_id: number;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  task_workscope_specific_key: string;

  @Column({ type: 'int' })
  task_id: number;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'latin1',
    collation: 'latin1_swedish_ci',
  })
  task_key: string;

  @Column({ type: 'int' })
  frm_equipment_id: number;

  @Column({ type: 'int' })
  equipment_id: number;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'latin1',
    collation: 'latin1_swedish_ci',
  })
  equipment_key: string;

  @Column({ type: 'int' })
  cert_id: number;

  @Column({
    type: 'varchar',
    length: 32,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  equipment_cert_key: string;

  @Column({ type: 'datetime', nullable: true })
  work_start_date: Date;

  @Column({ type: 'datetime', nullable: true })
  work_end_date: Date;

  @Column({ type: 'int' })
  is_unexpirable: number;

  @Column({ type: 'int' })
  is_approved: number;

  @Column({ type: 'int' })
  approved_by: number;

  @Column({ type: 'tinyint', width: 4 })
  is_deleted: number;

  @Column({ type: 'int', default: 0 })
  cert_checkbox: number;

  @Column({ type: 'int', default: 0 })
  corrective_id: number;

  @Column({
    type: 'varchar',
    length: 50,
    nullable: true,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  corrective_key: string;

  @Column({ type: 'int' })
  created_by: number;

  @Column({ type: 'datetime' })
  created_on: Date;

  @Column({ type: 'int' })
  updated_by: number;

  @Column({ type: 'datetime' })
  updated_on: Date;

  @Column({ type: 'datetime' })
  sync_date: Date;
}
