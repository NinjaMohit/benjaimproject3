import { BaseEntity } from 'typeorm';
export declare class Users_groups extends BaseEntity {
    id: number;
    user_id: number;
    group_id: number;
}
