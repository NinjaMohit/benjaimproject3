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
var __param = (this && this.__param) || function (paramIndex, decorator) {
    return function (target, key) { decorator(target, key, paramIndex); }
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.UsersgroupsService = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const users_groups_entity_1 = require("./models/entities/users-groups.entity");
const typeorm_2 = require("typeorm");
let UsersgroupsService = class UsersgroupsService {
    constructor(usersgroupsRepositiry) {
        this.usersgroupsRepositiry = usersgroupsRepositiry;
    }
    async createUsers_groups(CreateUsersgroupsDto) {
        const user = await this.usersgroupsRepositiry.create(CreateUsersgroupsDto);
        await user.save();
        return user;
    }
    async findgroupByID(user_id) {
        return await users_groups_entity_1.Users_groups.findOne({
            where: {
                user_id: user_id,
            },
        });
    }
};
exports.UsersgroupsService = UsersgroupsService;
exports.UsersgroupsService = UsersgroupsService = __decorate([
    (0, common_1.Injectable)(),
    __param(0, (0, typeorm_1.InjectRepository)(users_groups_entity_1.Users_groups)),
    __metadata("design:paramtypes", [typeorm_2.Repository])
], UsersgroupsService);
//# sourceMappingURL=users-groups.service.js.map