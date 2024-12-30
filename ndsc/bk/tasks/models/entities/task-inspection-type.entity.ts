import { BaseEntity, Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('task_inspection_type')
export class Task_inspection_type extends BaseEntity {
  @PrimaryGeneratedColumn()
  inspection_id: number;

  @Column()
  inspection_title: string;

  @Column()
  inspection_type_image: string;

  @Column()
  status: number;

  @Column()
  created_at: Date;
}
