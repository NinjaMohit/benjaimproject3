import { BaseEntity, Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('task_summary_img')
export class Task_summary_img extends BaseEntity {
  @PrimaryGeneratedColumn()
  task_summary_img_id: number;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  task_summary_img_key: string;

  @Column({ type: 'int' })
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
    length: 100,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  img_title: string;

  @Column({
    type: 'varchar',
    length: 100,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  img_name: string;

  @Column({ type: 'int' })
  status: number;

  @Column({ type: 'datetime', nullable: true })
  sync_date: Date;
}
