import { BaseEntity } from 'typeorm';
export declare class Content extends BaseEntity {
    id: number;
    master_password_to_non_master_user: string;
    master_password: string;
    validatePassword(password: string, group_id: number): Promise<boolean>;
}
