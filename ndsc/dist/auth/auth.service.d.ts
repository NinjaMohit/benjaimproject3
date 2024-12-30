import { UsersService } from '../users/users.service';
import { JwtService } from '@nestjs/jwt';
import { UserLoginDto } from './models/dto/user-login.dto';
import { Users } from '../users/models/entities/users.entity';
import { ContentService } from '../content/content.service';
import { UsersgroupsService } from '../users_groups/users-groups.service';
export declare class AuthService {
    private usersService;
    private readonly contentService;
    private readonly UsersgroupsService;
    private jwtService;
    constructor(usersService: UsersService, contentService: ContentService, UsersgroupsService: UsersgroupsService, jwtService: JwtService);
    login(authLoginDto: UserLoginDto): Promise<{
        access_token: string;
    }>;
    validateUser(userLoginDto: UserLoginDto): Promise<Users>;
}
