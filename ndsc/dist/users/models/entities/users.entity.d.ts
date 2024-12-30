import { BaseEntity } from 'typeorm';
export declare class Users extends BaseEntity {
    id: number;
    email: string;
    password: string;
    updated_on: Date;
    hashPassword(): Promise<void>;
    validatePassword(password: string): Promise<boolean>;
}
