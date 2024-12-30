import { BaseEntity, Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('task_workscope_specific_equipment')
export class Task_workscope_specific_equipment extends BaseEntity {
  @PrimaryGeneratedColumn()
  task_workscope_specific_id: number;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_unicode_ci',
  })
  task_workscope_specific_key: string;

  @Column({ type: 'int' })
  task_id: number;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_unicode_ci',
  })
  task_key: string;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  workscope_specific_serial_rfid: string;

  @Column({ type: 'int' })
  equipment_id: number;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_unicode_ci',
  })
  equipment_key: string;

  @Column({ type: 'int' })
  cert_id: number;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_unicode_ci',
  })
  equipment_cert_key: string;

  @Column({ type: 'int' })
  created_by: number;

  @Column({ type: 'datetime' })
  created_on: Date;

  @Column({ type: 'int' })
  updated_by: number;

  @Column({ type: 'datetime' })
  updated_on: Date;

  @Column({ type: 'int', default: 1 })
  status: number;

  @Column({ type: 'datetime' })
  sync_date: Date;
}
