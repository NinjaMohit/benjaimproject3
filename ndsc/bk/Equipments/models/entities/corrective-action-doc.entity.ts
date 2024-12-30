import { BaseEntity, Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('corrective_action_doc')
export class Corrective_action_doc {
  @PrimaryGeneratedColumn()
  doc_id: number;

  @Column({
    type: 'varchar',
    length: 50,
    charset: 'utf8',
    collation: 'utf8_unicode_ci',
  })
  ca_doc_key: string;

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
  doc_title: string;

  @Column({
    type: 'varchar',
    length: 100,
    charset: 'utf8',
    collation: 'utf8_general_ci',
  })
  ca_doc_name: string;

  @Column({ type: 'datetime' })
  doc_date: Date;

  @Column({ type: 'int', default: 1 })
  status: number;

  @Column({ type: 'int' })
  created_by: number;

  @Column({ type: 'datetime' })
  created_on: Date;

  @Column({ type: 'datetime' })
  sync_date: Date;
}
