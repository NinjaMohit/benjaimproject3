"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.UsersGroupsModule = void 0;
const common_1 = require("@nestjs/common");
const users_groups_service_1 = require("./users-groups.service");
const users_groups_controller_1 = require("./users-groups.controller");
const typeorm_1 = require("@nestjs/typeorm");
const users_groups_entity_1 = require("./models/entities/users-groups.entity");
let UsersGroupsModule = class UsersGroupsModule {
};
exports.UsersGroupsModule = UsersGroupsModule;
exports.UsersGroupsModule = UsersGroupsModule = __decorate([
    (0, common_1.Module)({
        imports: [typeorm_1.TypeOrmModule.forFeature([users_groups_entity_1.Users_groups])],
        controllers: [users_groups_controller_1.UsersgroupController],
        providers: [users_groups_service_1.UsersgroupsService],
        exports: [users_groups_service_1.UsersgroupsService],
    })
], UsersGroupsModule);
//# sourceMappingURL=users-groups.module.js.map