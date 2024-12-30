import {
  BaseEntity,
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
  UpdateDateColumn,
} from 'typeorm';

@Entity('framework_certificate')
export class Framework_certificate {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ type: 'varchar', length: 50 })
  cert_unique_id: string;

  @Column({ type: 'varchar', length: 50 })
  cert_group: string;

  @Column({ type: 'int' })
  cert_type: number;

  @Column({ type: 'varchar', length: 20 })
  sort: string;

  @Column({ type: 'int', default: 0 })
  competence: number;

  @Column({ type: 'varchar', length: 255 })
  title: string;

  @Column({ type: 'int' })
  cert_status: number;

  @Column({ type: 'int' })
  valid_day_tick: number;

  @Column({ type: 'int', default: 0 })
  notuse_valid_day: number;

  @Column({ type: 'int' })
  notuse_valid_hour: number;

  @Column({ type: 'int' })
  valid_hour_tick: number;

  @Column({ type: 'int', default: 0 })
  is_cos: number;

  @Column({ type: 'int', default: 0 })
  is_major_cos: number;

  @Column({ type: 'int', default: 0 })
  is_intermediate_cos: number;

  @Column({ type: 'varchar', length: 255 })
  certificate_format: string;

  @Column({ type: 'text' })
  comments: string;

  @Column({ type: 'int' })
  parent_id: number;

  @Column({ type: 'int' })
  created_by: number;

  @CreateDateColumn()
  created_on: Date;

  @Column({ type: 'int' })
  updated_by: number;

  @UpdateDateColumn()
  updated_on: Date;

  @Column({ type: 'int' })
  published: number;

  @Column({ type: 'datetime' })
  sync_date: Date;
}
