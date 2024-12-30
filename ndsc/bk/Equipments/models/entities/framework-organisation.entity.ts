import {
  BaseEntity,
  Entity,
  PrimaryGeneratedColumn,
  Column,
  ManyToOne,
  OneToMany,
  JoinColumn,
} from 'typeorm';

@Entity('framework_organisation')
export class Framework_organisation {
  @PrimaryGeneratedColumn()
  organisation_id: number;

  @Column({ type: 'int', nullable: true })
  parent_id: number;

  @ManyToOne(() => Framework_organisation, (location) => location.children, {
    nullable: true,
  })
  @JoinColumn({ name: 'parent_id' }) // Explicitly map the foreign key
  parent: Framework_organisation;

  @OneToMany(() => Framework_organisation, (location) => location.parent)
  children: Framework_organisation[];

  @Column({ length: 50 })
  location_key: string;

  @Column({ length: 255 })
  title: string;

  @Column({ length: 100 })
  drop_zone: string;

  @Column({ length: 50 })
  ex_zone: string;

  @Column({ length: 255 })
  rfid: string;

  @Column({ length: 50 })
  latitude: string;

  @Column({ length: 50 })
  longitude: string;

  @Column({ length: 255 })
  hazards: string;

  @Column({ type: 'text', nullable: true })
  location_notes: string;

  @Column({ type: 'int' })
  confined_space: number;

  @Column({ type: 'int' })
  drops: number;

  @Column({ type: 'int' })
  ex: number;

  @Column({ length: 500, nullable: true })
  system_email_users: string;

  @Column({ type: 'int' })
  primary_node: number;

  @Column({ length: 150 })
  node_code: string;

  @Column({ type: 'int' })
  country: number;

  @Column({ length: 150 })
  city: string;

  @Column({ length: 150, nullable: true })
  GPS: string;

  @Column({ length: 150, nullable: true })
  PIC: string;

  @Column({ length: 150, nullable: true })
  PIC_no: string;

  @Column({ length: 150, nullable: true })
  PIC_email: string;

  @Column({ type: 'int' })
  created_by: number;

  @Column({ type: 'datetime' })
  created_on: Date;

  @Column({ type: 'int' })
  updated_by: number;

  @Column({
    type: 'timestamp',
    default: () => 'CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP',
  })
  updated_on: Date;

  @Column({ type: 'int' })
  status: number;

  @Column({ type: 'datetime', nullable: true })
  sync_date: Date;
}
