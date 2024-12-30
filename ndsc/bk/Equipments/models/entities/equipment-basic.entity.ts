import { BaseEntity, Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('equipment_basic')
export class Equipment_basic {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  equipment_key: string;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_general_ci',
    nullable: true,
  })
  rfid: string;

  @Column({ type: 'int' })
  status: number;

  @Column({
    type: 'varchar',
    length: 100,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  serial: string;

  @Column({
    type: 'varchar',
    length: 150,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  equ_type: string;

  @Column({ type: 'int' })
  frm_equipment_id: number;

  @Column({ type: 'int' })
  location: number;

  @Column({
    type: 'varchar',
    length: 250,
    charset: 'utf8',
    collation: 'utf8_general_ci',
    nullable: true,
  })
  position: string;

  @Column({
    type: 'varchar',
    length: 150,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  asset_number_sap: string;

  @Column({
    type: 'varchar',
    length: 150,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  link_to_asset: string;

  @Column({
    type: 'varchar',
    length: 200,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  dimension: string;

  @Column({
    type: 'varchar',
    length: 150,
    charset: 'utf8',
    collation: 'utf8_general_ci',
    nullable: true,
  })
  swl_swp: string;

  @Column({
    type: 'varchar',
    length: 500,
    charset: 'utf8',
    collation: 'utf8_general_ci',
    nullable: true,
  })
  test_load: string;

  @Column({
    type: 'varchar',
    length: 150,
    charset: 'utf8',
    collation: 'utf8_general_ci',
    nullable: true,
  })
  wll_mawp: string;

  @Column({
    type: 'varchar',
    length: 25,
    charset: 'utf8',
    collation: 'utf8_general_ci',
    nullable: true,
  })
  factor_of_safety: string;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  model: string;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_general_ci',
    nullable: true,
  })
  manufacturer: string;

  @Column({ type: 'date', nullable: true })
  date_of_manufacturer: Date;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  weight: string;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_general_ci',
    nullable: true,
  })
  grid_ref: string;

  @Column({
    type: 'varchar',
    length: 150,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  access: string;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_general_ci',
    nullable: true,
  })
  height: string;

  @Column({ type: 'int', nullable: true, default: 0 })
  nfl: number;

  @Column({ type: 'int', nullable: true, default: 0 })
  drops: number;

  @Column({ type: 'int', nullable: true, default: 0 })
  ex: number;

  @Column({ type: 'int', nullable: true, default: 0 })
  critical: number;

  @Column({ type: 'int', default: 0 })
  eqgroups: number;

  @Column({ type: 'int', default: 0 })
  third_party: number;

  @Column({ type: 'int', default: 0 })
  api: number;

  @Column({ type: 'int', default: 0 })
  engine: number;

  @Column({ type: 'int', default: 0 })
  hose: number;

  @Column({ type: 'int', default: 0 })
  asset: number;

  @Column({ type: 'int', default: 0 })
  audited: number;

  @Column({ type: 'int', default: 0 })
  capital_equipment: number;

  @Column({ type: 'int' })
  confined_space: number;

  @Column({ type: 'float', default: 0 })
  current_hrs: number;

  @Column({ type: 'float', nullable: true, default: 0 })
  old_current_hrs: number;

  @Column({ type: 'date', nullable: true })
  last_current_hrs_reading_date: Date;

  @Column({ type: 'float', default: 0 })
  previous_current_hrs: number;

  @Column({
    type: 'text',
    charset: 'utf8',
    collation: 'utf8_general_ci',
    nullable: true,
  })
  photo: string;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_general_ci',
    nullable: true,
  })
  in_service_po_no: string;

  @Column({ type: 'date', nullable: true })
  in_service: Date;

  @Column({
    type: 'varchar',
    length: 250,
    charset: 'utf8',
    collation: 'utf8_general_ci',
    nullable: true,
  })
  mro: string;

  @Column({ type: 'date', nullable: true })
  in_service_remove: Date;

  @Column({ type: 'int', nullable: true })
  in_service_valid_days: number;

  @Column({ type: 'int', nullable: true })
  in_service_is_unexpirable: number;

  @Column({
    type: 'varchar',
    length: 255,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  lock_id: string;

  @Column({
    type: 'varchar',
    length: 100,
    charset: 'utf8',
    collation: 'utf8_general_ci',
    nullable: true,
  })
  coc_no: string;

  @Column({ type: 'int', default: 3 })
  coc_verification: number;

  @Column({ type: 'date', nullable: true })
  coc_issue_date: Date;

  @Column({ type: 'date', nullable: true })
  coc_expiry_date: Date;

  @Column({ type: 'int', nullable: true })
  coc_valid_days: number;

  @Column({ type: 'int', nullable: true })
  coc_is_unexpirable: number;

  @Column({ type: 'text', charset: 'utf8', collation: 'utf8_general_ci' })
  comments: string;

  @Column({ type: 'int', default: 0 })
  connect_a: number;

  @Column({ type: 'int', default: 0 })
  connect_b: number;

  @Column({
    type: 'varchar',
    length: 150,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  material: string;

  @Column({ type: 'float', default: 0 })
  nominal_thickness_mm: number;

  @Column({ type: 'float', default: 0 })
  minimum_thickness_mm: number;

  @Column({ type: 'float', default: 0 })
  current_reading_mm: number;

  @Column({
    type: 'varchar',
    length: 255,
    charset: 'utf8',
    collation: 'utf8_general_ci',
    nullable: true,
  })
  coc_issuer: string;

  @Column({ type: 'int' })
  parent_id: number;

  @Column({
    type: 'varchar',
    length: 500,
    charset: 'utf8',
    collation: 'utf8_general_ci',
    nullable: true,
  })
  detail: string;

  @Column({
    type: 'varchar',
    length: 100,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  system: string;

  @Column({ type: 'int' })
  is_deleted: number;

  @Column({ type: 'int' })
  created_by: number;

  @Column({ type: 'int' })
  updated_by: number;

  @Column({ type: 'datetime' })
  created_on: Date;

  @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
  updated_on: Date;

  @Column({ type: 'datetime', nullable: true })
  sync_date: Date;
}
