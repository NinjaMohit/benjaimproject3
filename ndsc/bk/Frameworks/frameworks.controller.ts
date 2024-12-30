import { Controller, Get, Param, UseGuards } from '@nestjs/common';
import { FrameworksService } from './frameworks.service';
import { JwtAuthGuard } from 'src/auth/guards/jwt-auth.guard';
import { Framework_organisation } from './models/entities/framework-organisation.entity';
import { Framework_certificate } from './models/entities/framework-certificate.entity';
import { Framework_certificate_indicators } from './models/entities/framework-certificate-indicators.entity';
import { Framework_corrective_action } from './models/entities/framework-corrective-action.entity';
import { Framework_equipment_basic } from './models/entities/framework-equipment-basic.entity';
import { Framework_equipment_cert } from './models/entities/framework-equipment-cert.entity';
import { Framework_equipment_ex } from './models/entities/framework-equipment-ex.entity';
import { Framework_equipment_standard } from './models/entities/framework-equipment-standard.entity';

@Controller('frameworks')
export class FrameworksController {
  constructor(private readonly frameworksService: FrameworksService) {}

  @UseGuards(JwtAuthGuard)
  @Get('/getLocation/:organisation_id')
  getLocation(
    @Param('organisation_id') organisation_id: number,
  ): Promise<Framework_organisation[]> {
    return this.frameworksService.getLocation(organisation_id);
  }

  @UseGuards(JwtAuthGuard)
  @Get('/getCertificates')
  getCertificates(@Param('id') id: number): Promise<Framework_certificate[]> {
    return this.frameworksService.getCertificates(id);
  }

  @UseGuards(JwtAuthGuard)
  @Get('/getCertificate/:id')
  getCertificate(@Param('id') id: number): Promise<Framework_certificate[]> {
    return this.frameworksService.getCertificate(id);
  }

  @UseGuards(JwtAuthGuard)
  @Get('/getIndicators')
  getIndicators(): Promise<Framework_certificate_indicators[]> {
    return this.frameworksService.getIndicators();
  }

  @UseGuards(JwtAuthGuard)
  @Get('/getIndicator/:id')
  getIndicator(
    @Param('id') id: number,
  ): Promise<Framework_certificate_indicators[]> {
    return this.frameworksService.getIndicator(id);
  }

  @UseGuards(JwtAuthGuard)
  @Get('/getFrmCorrectiveActions')
  getFrmCorrectiveActions(
    @Param('framework_certificate_id') framework_certificate_id: number,
  ): Promise<Framework_corrective_action[]> {
    return this.frameworksService.getFrmCorrectiveActions();
  }

  @UseGuards(JwtAuthGuard)
  @Get('/getFrmCorrectiveAction/:corrective_action_id')
  getFrmCorrectiveAction(
    @Param('corrective_action_id') corrective_action_id: number,
  ): Promise<Framework_corrective_action[]> {
    return this.frameworksService.getFrmCorrectiveAction(corrective_action_id);
  }

  @UseGuards(JwtAuthGuard)
  @Get('/getFrameworkEquipment/:equipment_id')
  getFrameworkEquipment(
    @Param('equipment_id') equipment_id: number,
  ): Promise<Framework_equipment_basic[]> {
    return this.frameworksService.getFrameworkEquipment(equipment_id);
  }

  @UseGuards(JwtAuthGuard)
  @Get('/getFrameworkEquipments')
  getFrameworkEquipments(): Promise<Framework_equipment_basic[]> {
    return this.frameworksService.getFrameworkEquipments();
  }

  @UseGuards(JwtAuthGuard)
  @Get('/getFrmEquipmentCerts')
  getFrmEquipmentCerts(): Promise<Framework_equipment_cert[]> {
    return this.frameworksService.getFrmEquipmentCerts();
  }

  @UseGuards(JwtAuthGuard)
  @Get('/getFrmEquipmentEx')
  getFrmEquipmentEx(): Promise<Framework_equipment_ex[]> {
    return this.frameworksService.getFrmEquipmentEx();
  }

  @UseGuards(JwtAuthGuard)
  @Get('/getFrmEquipmentStandard')
  getFrmEquipmentStandard(): Promise<Framework_equipment_standard[]> {
    return this.frameworksService.getFrmEquipmentStandard();
  }

  @UseGuards(JwtAuthGuard)
  @Get('/getLocationsByParent/:parentId')
  async getLocationsByParent(@Param('parentId') parentId: number) {
    return (
      await this.frameworksService.getLocationsByParentId(parentId)
    ).toString();
  }
}
