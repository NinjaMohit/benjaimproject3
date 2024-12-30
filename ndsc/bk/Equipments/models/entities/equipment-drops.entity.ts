import { BaseEntity, Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('equipment_drops')
export class Equipment_drops {
  @PrimaryGeneratedColumn()
  dropid: number;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'latin1',
    collation: 'latin1_swedish_ci',
  })
  drop_key: string;

  @Column({ type: 'int' })
  equipment_id: number;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'latin1',
    collation: 'latin1_swedish_ci',
  })
  equipment_key: string;

  @Column({
    type: 'varchar',
    length: 25,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  drop_id: string;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'latin1',
    collation: 'latin1_swedish_ci',
  })
  drop_zone: string;

  @Column({
    type: 'varchar',
    length: 255,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  drop_frequency: string;

  @Column({
    type: 'varchar',
    length: 255,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  drop_standards: string;

  @Column({
    type: 'varchar',
    length: 255,
    charset: 'utf8',
    collation: 'utf8_general_ci',
    nullable: true,
  })
  drop_primary_fixing: string;

  @Column({
    type: 'varchar',
    length: 255,
    charset: 'utf8',
    collation: 'utf8_general_ci',
    nullable: true,
  })
  drop_secondary_retention: string;

  @Column({ type: 'int' })
  drop_safety_securing: number;

  @Column({
    type: 'varchar',
    length: 255,
    charset: 'latin1',
    collation: 'latin1_swedish_ci',
  })
  drop_safety_securing_other: string;

  @Column({
    type: 'varchar',
    length: 255,
    charset: 'utf8',
    collation: 'utf8_general_ci',
    nullable: true,
  })
  drop_safety_securing_old: string;

  @Column({
    type: 'varchar',
    length: 300,
    charset: 'latin1',
    collation: 'latin1_swedish_ci',
  })
  drop_safety_securing_sn: string;

  @Column({
    type: 'text',
    charset: 'utf8',
    collation: 'utf8_general_ci',
    nullable: true,
  })
  drop_inspection_procedure: string;

  @Column({
    type: 'varchar',
    length: 100,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  drop_photo: string;

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
