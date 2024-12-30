import { BaseEntity, Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('equipment_certificate')
export class Equipment_certificate {
  @PrimaryGeneratedColumn()
  cert_id: number;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  equipment_cert_key: string;

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
    length: 255,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  cert_title: string;

  @Column({ type: 'int' })
  frm_cert_id: number;

  @Column({ type: 'int' })
  cert_type: number;

  @Column({ type: 'date', nullable: true })
  issue_date: Date;

  @Column({ type: 'date', nullable: true })
  expiry_date_old: Date;

  @Column({ type: 'date', nullable: true })
  expiry_date: Date;

  @Column({ type: 'float', default: 0 })
  current: number;

  @Column({ type: 'float', default: 0 })
  last: number;

  @Column({ type: 'float', default: 0 })
  remaining: number;

  @Column({
    type: 'varchar',
    length: 25,
    charset: 'utf8',
    collation: 'utf8_general_ci',
    nullable: true,
  })
  cert_valid_days: string;

  @Column({
    type: 'varchar',
    length: 10,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  day_hour: string;

  @Column({ type: 'int' })
  is_unexpirable: number;

  @Column({ type: 'int' })
  active: number;

  @Column({ type: 'int', default: 0 })
  maintenance_task: number;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  cert_file: string;

  @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
  updated_on: Date;

  @Column({ type: 'int' })
  updated_by: number;

  @Column({ type: 'int', default: 1 })
  status: number;

  @Column({
    type: 'varchar',
    length: 200,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  stage: string;

  @Column({ type: 'int', default: 3 })
  verification: number;

  @Column({ type: 'int' })
  is_deleted: number;

  @Column({ type: 'datetime', nullable: true })
  sync_date: Date;
}
