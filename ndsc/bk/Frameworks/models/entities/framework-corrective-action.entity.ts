import {
  BaseEntity,
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
  UpdateDateColumn,
} from 'typeorm';

@Entity('framework_corrective_action')
export class Framework_corrective_action {
  @PrimaryGeneratedColumn()
  corrective_action_id: number;

  @Column({ type: 'int', nullable: false })
  parent_id: number;

  @Column({ type: 'varchar', length: 255, nullable: false })
  title: string;

  @Column({ type: 'varchar', length: 50, nullable: false })
  ca_code: string;

  @Column({ type: 'int', default: 1, nullable: false })
  ca_class: number;

  @Column({ type: 'varchar', length: 50, nullable: true })
  ca_type: string | null;

  @Column({ type: 'varchar', length: 255, nullable: true })
  standard_ref: string | null;

  @Column({ type: 'varchar', length: 255, nullable: true })
  suggested_remedial: string | null;

  @Column({ type: 'int', nullable: true })
  close_out_duration: number | null;

  @Column({ type: 'varchar', length: 1000, nullable: true })
  notes: string | null;

  @Column({ type: 'int', default: 1, nullable: false })
  ca_status: number;

  @Column({ type: 'int', nullable: false })
  created_by: number;

  @CreateDateColumn({ type: 'datetime', nullable: false })
  created_on: Date;

  @Column({ type: 'int', nullable: false })
  updated_by: number;

  @UpdateDateColumn({
    type: 'timestamp',
    default: () => 'CURRENT_TIMESTAMP',
    nullable: true,
  })
  updated_on: Date;

  @Column({ type: 'datetime', nullable: true })
  sync_date: Date | null;
}
