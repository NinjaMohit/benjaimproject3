import { BaseEntity, Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('corrective_action_fault_img')
export class Corrective_action_fault_img {
  @PrimaryGeneratedColumn()
  fault_id: number;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_unicode_ci',
  })
  ca_fault_key: string;

  @Column({ type: 'int' })
  corrective_id: number;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_unicode_ci',
  })
  corrective_key: string;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_unicode_ci',
  })
  unique_id: string;

  @Column({
    type: 'varchar',
    length: 255,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  img_title: string;

  @Column({
    type: 'varchar',
    length: 150,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  fault_image_name: string;

  @Column({ type: 'datetime' })
  fault_image_date: Date;

  @Column({ type: 'int', default: 1 })
  status: number;

  @Column({ type: 'int' })
  created_by: number;

  @Column({ type: 'datetime' })
  created_on: Date;

  @Column({ type: 'datetime' })
  sync_date: Date;
}
