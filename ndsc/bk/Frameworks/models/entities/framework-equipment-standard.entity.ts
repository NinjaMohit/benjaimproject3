import {
  BaseEntity,
  Entity,
  PrimaryGeneratedColumn,
  Column,
  UpdateDateColumn,
  CreateDateColumn,
} from 'typeorm';

@Entity('framework_equipment_standard')
export class Framework_equipment_standard {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ type: 'int' })
  equipment_id: number;

  @Column({ type: 'varchar', length: 255, nullable: true })
  international_standards: string;

  @Column({ type: 'varchar', length: 255, nullable: true })
  regional_standards: string;

  @Column({ type: 'varchar', length: 255, nullable: true })
  contractor_standards: string;

  @Column({ type: 'varchar', length: 255, nullable: true })
  system_note_on_general: string;

  @Column({ type: 'varchar', length: 255, nullable: true })
  drop_standards: string;

  @Column({ type: 'varchar', length: 255, nullable: true })
  system_notes_on_drops: string;

  @Column({ type: 'text', nullable: true })
  international_standards_details: string;

  @Column({ type: 'text', nullable: true })
  regional_standards_details: string;

  @Column({ type: 'text', nullable: true })
  contractor_standards_details: string;

  @Column({ type: 'varchar', length: 255, nullable: true })
  primary_fixing: string;

  @Column({ type: 'varchar', length: 255, nullable: true })
  secondary_retention: string;

  @Column({ type: 'varchar', length: 500, nullable: true })
  safety_securing: string;

  @Column({ type: 'varchar', length: 500, nullable: true })
  drops_inspection_procedure: string;

  @Column({ type: 'varchar', length: 500, nullable: true })
  ex_standard: string;

  @Column({ type: 'varchar', length: 500, nullable: true })
  ex_system_notes: string;

  @Column({ type: 'varchar', length: 500, nullable: true })
  ex_general_procedure: string;

  @Column({ type: 'varchar', length: 500, nullable: true })
  ex_special_procedure: string;

  @Column({ type: 'varchar', length: 255, nullable: true })
  drops_frequency: string;

  @Column({ type: 'varchar', length: 255, nullable: true })
  standards: string;

  @Column({ type: 'varchar', length: 255, nullable: true })
  standards_details: string;

  @Column({ type: 'int', default: 0 })
  register_update: number;

  @Column({ type: 'int' })
  created_by: number;

  @CreateDateColumn({ type: 'datetime' })
  created_on: Date;

  @Column({ type: 'int' })
  updated_by: number;

  @UpdateDateColumn({ type: 'timestamp' })
  updated_on: Date;

  @Column({ type: 'datetime', nullable: true })
  sync_date: Date;
}
