import {
  BaseEntity,
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
  UpdateDateColumn,
} from 'typeorm';

@Entity('task_equipment')
export class Task_equipment extends BaseEntity {
  @PrimaryGeneratedColumn()
  task_equipment_id: number;

  @Column({ type: 'int' })
  task_id: number;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'latin1',
    collation: 'latin1_swedish_ci',
  })
  task_equipment_key: string;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'latin1',
    collation: 'latin1_swedish_ci',
  })
  task_key: string;

  @Column({ type: 'int' })
  equipment_type_id: number;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  equipment_status: string;

  @Column({ type: 'int' })
  certificate_id: number;

  @Column({ type: 'int' })
  created_by: number;

  @CreateDateColumn({ type: 'datetime', nullable: true })
  created_on: Date;

  @Column({ type: 'int' })
  updated_by: number;

  @UpdateDateColumn({ type: 'datetime', nullable: true })
  updated_on: Date;

  @Column({ type: 'int', default: 1 })
  status: number;

  @Column({ type: 'datetime', nullable: true })
  sync_date: Date;
}
