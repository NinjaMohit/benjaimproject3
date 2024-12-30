import {
  BaseEntity,
  Entity,
  PrimaryGeneratedColumn,
  Column,
  UpdateDateColumn,
  CreateDateColumn,
} from 'typeorm';

@Entity('framework_equipment_ex')
export class Framework_equipment_ex {
  @PrimaryGeneratedColumn()
  ex_id: number;

  @Column({ type: 'int', nullable: false })
  equipment_id: number;

  @Column({ type: 'varchar', length: 10, nullable: false })
  epl_atex_marking: string;

  @Column({ type: 'varchar', length: 20, nullable: false })
  ex_category: string;

  @Column({ type: 'varchar', length: 20, nullable: false })
  ex_division: string;

  @Column({ type: 'varchar', length: 20, nullable: true })
  ex_protection: string | null;

  @Column({ type: 'varchar', length: 20, nullable: false })
  ex_gas_group: string;

  @Column({ type: 'varchar', length: 20, nullable: false })
  ex_ip_code: string;

  @Column({ type: 'varchar', length: 250, nullable: true })
  ex_standards: string | null;

  @Column({ type: 'varchar', length: 250, nullable: true })
  ex_pmi: string | null;

  @Column({ type: 'varchar', length: 20, nullable: false })
  ex_temp_class: string;

  @Column({ type: 'varchar', length: 30, nullable: false })
  ex_ambient_temp: string;

  @Column({ type: 'varchar', length: 30, nullable: true })
  ex_cert_no: string | null;

  @Column({ type: 'varchar', length: 100, nullable: true })
  ex_notified_body: string | null;

  @Column({ type: 'varchar', length: 250, nullable: true })
  ex_link_to_certificates: string | null;

  @Column({ type: 'text', nullable: true })
  ex_general_procedure: string | null;

  @Column({ type: 'text', nullable: true })
  ex_special_procedure: string | null;

  @Column({ type: 'int', nullable: false })
  created_by: number;

  @Column({ type: 'int', nullable: false })
  updated_by: number;

  @CreateDateColumn({ type: 'datetime', nullable: false })
  created_on: Date;

  @UpdateDateColumn({
    type: 'timestamp',
    nullable: false,
    default: () => 'CURRENT_TIMESTAMP',
  })
  updated_on: Date;

  @Column({ type: 'datetime', nullable: true })
  sync_date: Date | null;
}
