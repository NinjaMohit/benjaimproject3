import {
  BaseEntity,
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
  UpdateDateColumn,
} from 'typeorm';

@Entity('framework_certificate_indicators')
export class Framework_certificate_indicators {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ type: 'int', nullable: false })
  framework_certificate_id: number;

  @Column({ type: 'varchar', length: 50, nullable: false })
  indicator_unique_id: string;

  @Column({ type: 'int', nullable: true })
  sort: number | null;

  @Column({ type: 'varchar', length: 250, nullable: false })
  title: string;

  @Column({ type: 'varchar', length: 50, nullable: true })
  min_old: string | null;

  @Column({ type: 'float', nullable: false, default: 0 })
  min: number;

  @Column({ type: 'float', nullable: false, default: 0 })
  max: number;

  @Column({ type: 'varchar', length: 50, nullable: true })
  max_old: string | null;

  @Column({ type: 'int', nullable: false })
  set_limit: number;

  @Column({ type: 'int', nullable: false, default: 0 })
  is_fh: number;

  @Column({ type: 'varchar', length: 255, nullable: true })
  ca_title: string | null;

  @Column({ type: 'int', nullable: false })
  created_by: number;

  @CreateDateColumn({ type: 'datetime', nullable: true })
  created_on: Date | null;

  @Column({ type: 'int', nullable: false })
  updated_by: number;

  @UpdateDateColumn({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
  updated_on: Date;

  @Column({ type: 'int', nullable: false, default: 1 })
  status: number;

  @Column({ type: 'datetime', nullable: true })
  sync_date: Date | null;
}
