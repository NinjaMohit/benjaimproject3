import { AuthService } from './auth.service';
import { UserLoginDto } from './models/dto/user-login.dto';
export declare class AuthController {
    private readonly authService;
    constructor(authService: AuthService);
    login(authLoginDto: UserLoginDto): Promise<{
        access_token: string;
    }>;
    test(): Promise<string>;
}
