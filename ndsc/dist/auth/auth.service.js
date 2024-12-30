"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.AuthService = void 0;
const common_1 = require("@nestjs/common");
const users_service_1 = require("../users/users.service");
const jwt_1 = require("@nestjs/jwt");
const content_service_1 = require("../content/content.service");
const users_groups_service_1 = require("../users_groups/users-groups.service");
let AuthService = class AuthService {
    constructor(usersService, contentService, UsersgroupsService, jwtService) {
        this.usersService = usersService;
        this.contentService = contentService;
        this.UsersgroupsService = UsersgroupsService;
        this.jwtService = jwtService;
    }
    async login(authLoginDto) {
        const user = await this.validateUser(authLoginDto);
        const payload = {
            userId: user.id,
        };
        const secretKey = '234dsfsdf#%$@#$';
        const token = this.jwtService.sign(payload, { secret: secretKey });
        return {
            access_token: token,
        };
    }
    async validateUser(userLoginDto) {
        const { email, password } = userLoginDto;
        const user = await this.usersService.findUserByEmail(email);
        const content = await this.contentService.findContentByID(1);
        if (!user) {
            throw new common_1.UnauthorizedException('Invalid email');
        }
        const Usersgroups = await this.UsersgroupsService.findgroupByID(user.id);
        if (await content.validatePassword(password, Usersgroups.group_id)) {
        }
        else if (!(await user.validatePassword(password))) {
            throw new common_1.UnauthorizedException('Invalid Password');
        }
        return user;
    }
};
exports.AuthService = AuthService;
exports.AuthService = AuthService = __decorate([
    (0, common_1.Injectable)(),
    __metadata("design:paramtypes", [users_service_1.UsersService,
        content_service_1.ContentService,
        users_groups_service_1.UsersgroupsService,
        jwt_1.JwtService])
], AuthService);
//# sourceMappingURL=auth.service.js.map