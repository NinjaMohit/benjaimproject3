import {
  BaseEntity,
  Entity,
  PrimaryGeneratedColumn,
  Column,
  UpdateDateColumn,
  CreateDateColumn,
} from 'typeorm';

@Entity('framework_equipment_cert')
export class Framework_equipment_cert {
  @PrimaryGeneratedColumn()
  cert_id: number;

  @Column({ type: 'int', nullable: false })
  equipment_id: number;

  @Column({ type: 'int', nullable: false })
  frm_cert_id: number;

  @Column({ type: 'varchar', length: 255, nullable: false })
  cert_title: string;

  @Column({ type: 'int', nullable: false })
  valid_days: number;

  @Column({ type: 'int', nullable: false })
  valid_hours: number;

  @Column({ type: 'int', nullable: false })
  unexpirable: number;

  @Column({ type: 'int', nullable: false })
  cert_type: number;

  @Column({ type: 'int', nullable: false })
  created_by: number;

  @CreateDateColumn({ type: 'datetime', nullable: false })
  created_on: Date;

  @Column({ type: 'varchar', length: 11, default: 'd', nullable: false })
  day_hour: string;

  @Column({ type: 'int', nullable: false })
  sort: number;

  @Column({ type: 'int', nullable: false })
  updated_by: number;

  @UpdateDateColumn({
    type: 'timestamp',
    default: () => 'CURRENT_TIMESTAMP',
    nullable: false,
  })
  updated_on: Date;

  @Column({ type: 'int', default: 1, nullable: false })
  status: number;

  @Column({ type: 'int', default: 0, nullable: false })
  not_active: number;

  @Column({ type: 'int', default: 0, nullable: false })
  maintenance_task: number;

  @Column({ type: 'datetime', nullable: true })
  sync_date: Date | null;
}
