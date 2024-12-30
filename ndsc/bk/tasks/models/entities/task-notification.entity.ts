import { BaseEntity, Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('task_notification')
export class Task_notification extends BaseEntity {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  notification_key: string;

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
  expire_notification_id: number;

  @Column({
    type: 'varchar',
    length: 500,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  notification: string;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  type: string;

  @Column({ type: 'datetime' })
  notification_date: Date;

  @Column({ type: 'int' })
  user_id: number;

  @Column({ type: 'int' })
  read: number;

  @Column({
    type: 'varchar',
    length: 500,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  forward_to: string;

  @Column({
    type: 'varchar',
    length: 500,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  assigned_to: string;

  @Column({ type: 'int' })
  updated_by: number;

  @Column({ type: 'datetime' })
  updated_on: Date;

  @Column({ type: 'int' })
  status: number;

  @Column({ type: 'datetime', nullable: true })
  sync_date: Date;
}
