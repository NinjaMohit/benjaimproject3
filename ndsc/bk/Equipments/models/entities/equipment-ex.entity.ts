import {
  BaseEntity,
  Entity,
  PrimaryGeneratedColumn,
  Column,
  UpdateDateColumn,
  CreateDateColumn,
} from 'typeorm';

@Entity('equipment_ex')
export class Equipment_ex {
  @PrimaryGeneratedColumn()
  ex_id: number;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  ex_key: string;

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
    length: 50,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  ex_id_tag: string;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  ex_cable_tag: string;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  ex_no_glands: string;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  ex_zone: string;

  @Column({
    type: 'varchar',
    length: 30,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  epl_atex_marking: string;

  @Column({
    type: 'varchar',
    length: 20,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  ex_category: string;

  @Column({
    type: 'varchar',
    length: 20,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  ex_division: string;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  ex_protection: string;

  @Column({
    type: 'varchar',
    length: 20,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  ex_gas_group: string;

  @Column({
    type: 'varchar',
    length: 20,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  ex_ip_code: string;

  @Column({
    type: 'varchar',
    length: 250,
    charset: 'utf8',
    collation: 'utf8_general_ci',
    nullable: true,
  })
  ex_standards: string;

  @Column({
    type: 'varchar',
    length: 250,
    charset: 'utf8',
    collation: 'utf8_general_ci',
    nullable: true,
  })
  ex_pmi: string;

  @Column({
    type: 'varchar',
    length: 20,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  ex_temp_class: string;

  @Column({
    type: 'varchar',
    length: 30,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  ex_ambient_temp: string;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  ex_exposure: string;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  ex_ESD: string;

  @Column({
    type: 'varchar',
    length: 20,
    charset: 'utf8',
    collation: 'utf8_general_ci',
    nullable: true,
  })
  ex_cert_no: string;

  @Column({
    type: 'varchar',
    length: 100,
    charset: 'utf8',
    collation: 'utf8_general_ci',
    nullable: true,
  })
  ex_notified_body: string;

  @Column({
    type: 'varchar',
    length: 250,
    charset: 'utf8',
    collation: 'utf8_general_ci',
    nullable: true,
  })
  ex_link_to_certificates: string;

  @Column({
    type: 'text',
    charset: 'utf8',
    collation: 'utf8_general_ci',
    nullable: true,
  })
  ex_general_procedure: string;

  @Column({
    type: 'text',
    charset: 'utf8',
    collation: 'utf8_general_ci',
    nullable: true,
  })
  ex_special_procedure: string;

  @Column({
    type: 'varchar',
    length: 100,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  ex_image: string;

  @Column({ type: 'int' })
  created_by: number;

  @Column({ type: 'datetime' })
  created_on: Date;

  @Column({ type: 'int' })
  updated_by: number;

  @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
  updated_on: Date;

  @Column({ type: 'datetime', nullable: true })
  sync_date: Date;
}
