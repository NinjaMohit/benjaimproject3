import { BaseEntity, Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('corrective_action')
export class Corrective_action {
  @PrimaryGeneratedColumn()
  corrective_id: number;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  corrective_key: string;

  @Column({ type: 'int' })
  equipment_id: number;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  equipment_key: string;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  ca_type: string;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_general_ci',
    nullable: true,
  })
  ca_type_old: string;

  @Column({ type: 'text', charset: 'utf8', collation: 'utf8_general_ci' })
  ca_details: string;

  @Column({ type: 'date' })
  date_of_fail: string;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  found_by: string;

  @Column({ type: 'date' })
  close_out_by: string;

  @Column({ type: 'int', default: 1 })
  ca_status: number; // 1 = Open, 2 = Close, 3 = Overdue

  @Column({ type: 'int', default: 0 })
  ca_status_old: number;

  @Column({ type: 'int' })
  assigned_to: number;

  @Column({ type: 'date' })
  closed_out: string;

  @Column({
    type: 'varchar',
    length: 150,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  approved: string;

  @Column({
    type: 'varchar',
    length: 500,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  notes: string;

  @Column({ type: 'int', default: 0 })
  rel_task_workscope_id: number;

  @Column({ type: 'int' })
  created_by: number;

  @Column({ type: 'datetime' })
  created_on: Date;

  @Column({ type: 'int' })
  updated_by: number;

  @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
  updated_on: Date;

  @Column({ type: 'int', default: 1 })
  status: number;

  @Column({ type: 'int', default: 3 })
  verification: number;

  @Column({
    type: 'varchar',
    length: 200,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  stage: string;

  @Column({ type: 'datetime' })
  sync_date: Date;
}
