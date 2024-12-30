import { Users_groups } from './models/entities/users-groups.entity';
import { Repository } from 'typeorm';
import { CreateUsersgroupsDto } from './models/dto/create-users-groups.dto';
export declare class UsersgroupsService {
    private usersgroupsRepositiry;
    constructor(usersgroupsRepositiry: Repository<Users_groups>);
    createUsers_groups(CreateUsersgroupsDto: CreateUsersgroupsDto): Promise<Users_groups>;
    findgroupByID(user_id: number): Promise<Users_groups>;
}
