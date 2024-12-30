import { Controller, Get, Param, UseGuards } from '@nestjs/common';
import { EquipmentsService } from './equipments.service';
import { JwtAuthGuard } from 'src/auth/guards/jwt-auth.guard';
import { Corrective_action } from './models/entities/corrective-action.entity';
import { Corrective_action_doc } from './models/entities/corrective-action-doc.entity';
import { Corrective_action_fault_img } from './models/entities/corrective-action-fault-img.entity';
import { Corrective_action_fix_img } from './models/entities/corrective-action-fix-img.entity';

import { Equipment_basic } from './models/entities/equipment-basic.entity';
import { Equipment_certificate } from './models/entities/equipment-certificate.entity';
import { Equipment_ex } from './models/entities/equipment-ex.entity';
import { Equipment_standard } from './models/entities/equipment-standard.entity';
import { Equipment_drops } from './models/entities/equipment-drops.entity';
//import { Framework_organisation } from '../Frameworks/models/entities/framework-organisation.entity';

@Controller('equipments')
export class EquipmentsController {
  constructor(private readonly equipmentsService: EquipmentsService) {}

  @UseGuards(JwtAuthGuard)
  @Get('/')
  testing(): Promise<any> {
    return;
  }

  @UseGuards(JwtAuthGuard)
  @Get('/getCorrectiveActions/:userId')
  getCorrectiveActions(
    @Param('userId') userId: number,
  ): Promise<Corrective_action[]> {
    return this.equipmentsService.getCorrectiveActions(userId);
  }

  @UseGuards(JwtAuthGuard)
  @Get('/getEquipments/:location_id')
  getEquipments(
    @Param('location_id') location_id: number,
  ): Promise<Equipment_basic[]> {
    return this.equipmentsService.getEquipments(location_id);
  }

  @UseGuards(JwtAuthGuard)
  @Get('/getEquipmentCerts/:location_id')
  getEquipmentCerts(
    @Param('location_id') location_id: number,
  ): Promise<Equipment_certificate[]> {
    return this.equipmentsService.getEquipmentCerts(location_id);
  }

  @UseGuards(JwtAuthGuard)
  @Get('/getEquipmentEx/:location_id')
  getEquipmentEx(
    @Param('location_id') location_id: number,
  ): Promise<Equipment_ex[]> {
    return this.equipmentsService.getEquipmentEx(location_id);
  }

  @UseGuards(JwtAuthGuard)
  @Get('/getEquipmentStandard/:location_id')
  getEquipmentStandard(
    @Param('location_id') location_id: number,
  ): Promise<Equipment_standard[]> {
    return this.equipmentsService.getEquipmentStandard(location_id);
  }

  @UseGuards(JwtAuthGuard)
  @Get('/getEquipmentDrops/:location_id')
  getEquipmentDrops(
    @Param('location_id') location_id: number,
  ): Promise<Equipment_drops[]> {
    return this.equipmentsService.getEquipmentDrops(location_id);
  }

  @UseGuards(JwtAuthGuard)
  @Get('/getLocationsByParent/:parentId')
  async getLocationsByParent(@Param('parentId') parentId: number) {
    return (
      await this.equipmentsService.getLocationsByParentId(parentId)
    ).toString();
  }

  @UseGuards(JwtAuthGuard)
  @Get('/getEquipmentByParent/:parentId')
  async getEquipmentByParent(@Param('parentId') parentId: number) {
    return (
      await this.equipmentsService.getEquipmentByParent(parentId)
    ).toString();
  }
}
