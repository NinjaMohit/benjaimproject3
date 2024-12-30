import { Module } from '@nestjs/common';
import { FrameworksService } from './frameworks.service';
import { FrameworksController } from './frameworks.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Framework_organisation } from './models/entities/framework-organisation.entity'; // Updated import
import { Framework_certificate } from './models/entities/framework-certificate.entity';
import { Framework_certificate_indicators } from './models/entities/framework-certificate-indicators.entity';
import { Framework_corrective_action } from './models/entities/framework-corrective-action.entity';
import { Framework_equipment_basic } from './models/entities/framework-equipment-basic.entity';
import { Framework_equipment_cert } from './models/entities/framework-equipment-cert.entity';
import { Framework_equipment_ex } from './models/entities/framework-equipment-ex.entity';
import { Framework_equipment_standard } from './models/entities/framework-equipment-standard.entity';
@Module({
  imports: [
    TypeOrmModule.forFeature([
      Framework_organisation,
      Framework_certificate,
      Framework_certificate_indicators,
      Framework_corrective_action,
      Framework_equipment_basic,
      Framework_equipment_cert,
      Framework_equipment_ex,
      Framework_equipment_standard,
    ]),
  ], // Updated class name
  controllers: [FrameworksController],
  providers: [FrameworksService],
  exports: [FrameworksService],
})
export class FrameworksModule {}
