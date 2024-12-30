import {
  BaseEntity,
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
  UpdateDateColumn,
} from 'typeorm';

@Entity('task_exipired_notification')
export class Task_exipired_notification extends BaseEntity {
  @PrimaryGeneratedColumn()
  expire_notification_id: number;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_unicode_ci',
  })
  expire_notification_key: string;

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
    length: 250,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  expire_notification_msg: string;

  @Column({ type: 'int' })
  expire_days: number;

  @Column({
    type: 'varchar',
    length: 500,
    charset: 'utf8',
    collation: 'utf8_unicode_ci',
  })
  expire_assigne_user_id: string;

  @Column({
    type: 'varchar',
    length: 200,
    charset: 'utf8',
    collation: 'utf8_unicode_ci',
  })
  notification_date: string;

  @Column({ type: 'int' })
  created_by: number;

  @CreateDateColumn({ type: 'datetime' })
  created_on: Date;

  @Column({ type: 'int' })
  updated_by: number;

  @UpdateDateColumn({ type: 'datetime' })
  updated_on: Date;

  @Column({ type: 'int', default: 1 })
  status: number;

  @Column({ type: 'datetime', nullable: true })
  sync_date: Date;
}
