import { BaseEntity, Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('task_workscope_item_indicator_image')
export class Task_workscope_item_indicator_image extends BaseEntity {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'latin1',
    collation: 'latin1_swedish_ci',
  })
  doc_key: string;

  @Column({ type: 'int' })
  task_workscope_id: number;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'latin1',
    collation: 'latin1_swedish_ci',
  })
  task_workscope_key: string;

  @Column({
    type: 'varchar',
    length: 255,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  doc_title: string;

  @Column({
    type: 'varchar',
    length: 100,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  doc_name: string;

  @Column({ type: 'int' })
  published: number;

  @Column({ type: 'date' })
  created_on: Date;

  @Column({ type: 'date' })
  updated_on: Date;

  @Column({ type: 'int', default: 0 })
  updated_by: number;

  @Column({ type: 'int', default: 1 })
  status: number;

  @Column({ type: 'datetime', nullable: true })
  sync_date: Date;
}
