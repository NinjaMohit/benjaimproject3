import {
  BaseEntity,
  Entity,
  PrimaryGeneratedColumn,
  Column,
  UpdateDateColumn,
  CreateDateColumn,
} from 'typeorm';

@Entity('framework_equipment_basic')
export class Framework_equipment_basic {
  @PrimaryGeneratedColumn()
  equipment_id: number;

  @Column({ type: 'int', nullable: false })
  parent_id: number;

  @Column({ type: 'int', default: 0, nullable: false })
  sort: number;

  @Column({ type: 'varchar', length: 255, nullable: false })
  title: string;

  @Column({ type: 'varchar', length: 100, nullable: false })
  photo: string;

  @Column({ type: 'int', nullable: false })
  status: number;

  @Column({ type: 'varchar', length: 255, nullable: true })
  drops_frequency: string | null;

  @Column({ type: 'int', default: 0, nullable: true })
  coc_valid_days: number;

  @Column({ type: 'int', nullable: false })
  coc_unexpirable: number;

  @Column({ type: 'int', default: 0, nullable: true })
  in_service_valid_days: number;

  @Column({ type: 'int', nullable: false })
  in_service_unexpirable: number;

  @Column({ type: 'int', nullable: false })
  asset: number;

  @Column({ type: 'int', nullable: false })
  critical: number;

  @Column({ type: 'int', default: 0, nullable: false })
  grouping: number;

  @Column({ type: 'int', default: 0, nullable: false })
  eqgroups: number;

  @Column({ type: 'int', nullable: false })
  api: number;

  @Column({ type: 'int', default: 0, nullable: false })
  engine: number;

  @Column({ type: 'int', default: 0, nullable: false })
  hose: number;

  @Column({ type: 'int', default: 0, nullable: false })
  capital_equipment: number;

  @Column({ type: 'varchar', length: 50, nullable: true })
  manufacturer: string | null;

  @Column({ type: 'varchar', length: 50, nullable: true })
  model: string | null;

  @Column({ type: 'varchar', length: 50, nullable: true })
  weight: string | null;

  @Column({ type: 'varchar', length: 50, nullable: true })
  SWL: string | null;

  @Column({ type: 'varchar', length: 50, nullable: true })
  WLL: string | null;

  @Column({ type: 'varchar', length: 255, nullable: false })
  test_load: string;

  @Column({ type: 'varchar', length: 255, nullable: true })
  visual_inspection_international_standards: string | null;

  @Column({ type: 'text', nullable: true })
  visual_inspection_system_notes: string | null;

  @Column({ type: 'varchar', length: 255, nullable: true })
  ndt_inspection_international_standards: string | null;

  @Column({ type: 'text', nullable: true })
  ndt_inspection_system_notes: string | null;

  @Column({ type: 'varchar', length: 255, nullable: true })
  drops_standards: string | null;

  @Column({ type: 'varchar', length: 255, nullable: true })
  drops_primary_fixing: string | null;

  @Column({ type: 'varchar', length: 255, nullable: true })
  drops_safety_securing: string | null;

  @Column({ type: 'varchar', length: 255, nullable: true })
  ex_standards: string | null;

  @Column({ type: 'varchar', length: 500, nullable: true })
  ex_general_procedure: string | null;

  @Column({ type: 'text', nullable: true })
  general_equipment_notes: string | null;

  @Column({ type: 'varchar', length: 20, nullable: true })
  widget_type: string | null;

  @Column({ type: 'varchar', length: 255, nullable: true })
  reginal_standards: string | null;

  @Column({ type: 'text', nullable: true })
  drops_system_notes: string | null;

  @Column({ type: 'varchar', length: 255, nullable: true })
  secondary_retention: string | null;

  @Column({ type: 'varchar', length: 255, nullable: true })
  drops_inspection_procedure: string | null;

  @Column({ type: 'text', nullable: true })
  ex_system_notes: string | null;

  @Column({ type: 'varchar', length: 255, nullable: true })
  ex_special_procedure: string | null;

  @Column({ type: 'varchar', length: 255, nullable: true })
  components: string | null;

  @Column({ type: 'varchar', length: 255, nullable: true })
  consumables: string | null;

  @Column({ type: 'int', default: 0, nullable: false })
  reg_widget: number;

  @Column({ type: 'float', default: 0, nullable: false })
  cost: number;

  @Column({ type: 'float', default: 0, nullable: false })
  selling_cost: number;

  @Column({ type: 'float', default: 0, nullable: false })
  display_format: number;

  @Column({ type: 'varchar', length: 100, nullable: true })
  sort_order: string | null;

  @Column({ type: 'varchar', length: 50, nullable: true })
  dimension: string | null;

  @Column({ type: 'varchar', length: 50, nullable: false })
  pattern_number: string;

  @Column({ type: 'varchar', length: 50, nullable: false })
  catalogue_number: string;

  @Column({ type: 'varchar', length: 50, nullable: true })
  code_rfid: string | null;

  @Column({ type: 'varchar', length: 250, nullable: true })
  mro: string | null;

  @Column({ type: 'varchar', length: 1000, nullable: true })
  details: string | null;

  @Column({ type: 'varchar', length: 100, nullable: false })
  system: string;

  @Column({ type: 'int', nullable: false })
  updated_by: number;

  @UpdateDateColumn({
    type: 'timestamp',
    default: () => 'CURRENT_TIMESTAMP',
    nullable: false,
  })
  updated_on: Date;

  @Column({ type: 'int', nullable: false })
  created_by: number;

  @CreateDateColumn({ type: 'datetime', nullable: false })
  created_on: Date;

  @Column({ type: 'int', default: 1, nullable: false })
  published: number;

  @Column({ type: 'datetime', nullable: true })
  sync_date: Date | null;
}
