import { UsersgroupsService } from './users-groups.service';
import { CreateUsersgroupsDto } from './models/dto/create-users-groups.dto';
import { Users_groups } from './models/entities/users-groups.entity';
export declare class UsersgroupController {
    private readonly UsersgroupsService;
    constructor(UsersgroupsService: UsersgroupsService);
    createUser(CreateUsersgroupsDto: CreateUsersgroupsDto): Promise<Users_groups>;
}
