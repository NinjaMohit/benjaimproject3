import { Users } from './models/entities/users.entity';
import { Repository } from 'typeorm';
import { CreateUserDto } from './models/dto/create-user.dto';
export declare class UsersService {
    private usersRepositiry;
    constructor(usersRepositiry: Repository<Users>);
    createUser(createUserDto: CreateUserDto): Promise<Users>;
    findUserByEmail(email: string): Promise<Users>;
}
