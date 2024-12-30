import { UsersService } from './users.service';
import { CreateUserDto } from './models/dto/create-user.dto';
import { Users } from './models/entities/users.entity';
export declare class UsersController {
    private readonly usersService;
    constructor(usersService: UsersService);
    createUser(createUserDto: CreateUserDto): Promise<Users>;
}
