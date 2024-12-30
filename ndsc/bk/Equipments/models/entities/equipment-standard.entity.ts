import { BaseEntity, Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('equipment_standard')
export class Equipment_standard {
  @PrimaryGeneratedColumn()
  standard_id: number;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  standard_key: string;

  @Column({ type: 'int' })
  equipment_id: number;

  @Column({
    type: 'varchar',
    length: 20,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  equipment_key: string;

  @Column({
    type: 'varchar',
    length: 255,
    charset: 'utf8',
    collation: 'utf8_general_ci',
    nullable: true,
  })
  international_standards: string;

  @Column({
    type: 'varchar',
    length: 255,
    charset: 'utf8',
    collation: 'utf8_general_ci',
    nullable: true,
  })
  regional_standards: string;

  @Column({
    type: 'varchar',
    length: 255,
    charset: 'utf8',
    collation: 'utf8_general_ci',
    nullable: true,
  })
  contractor_standards: string;

  @Column({
    type: 'varchar',
    length: 1000,
    charset: 'utf8',
    collation: 'utf8_general_ci',
    nullable: true,
  })
  international_details: string;

  @Column({
    type: 'varchar',
    length: 1000,
    charset: 'utf8',
    collation: 'utf8_general_ci',
    nullable: true,
  })
  regional_details: string;

  @Column({
    type: 'varchar',
    length: 1000,
    charset: 'utf8',
    collation: 'utf8_general_ci',
    nullable: true,
  })
  contractor_details: string;

  @Column({
    type: 'varchar',
    length: 500,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  international_link_to_standard: string;

  @Column({
    type: 'varchar',
    length: 500,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  regional_link_to_standard: string;

  @Column({
    type: 'varchar',
    length: 500,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  contractor_link_to_standard: string;

  @Column({ type: 'int' })
  created_by: number;

  @Column({ type: 'datetime' })
  created_on: Date;

  @Column({ type: 'int' })
  updated_by: number;

  @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
  updated_on: Date;

  @Column({ type: 'int' })
  published: number;

  @Column({ type: 'datetime', nullable: true })
  sync_date: Date;
}
