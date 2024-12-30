import { Module } from '@nestjs/common';
import { EquipmentsService } from './equipments.service';
import { EquipmentsController } from './equipments.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
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
//import { FrameworksService } from '../Frameworks/frameworks.service';
//import { FrameworksModule } from '../frameworks/frameworks.module';

import { Framework_organisation } from './models/entities/framework-organisation.entity';
import { Framework_equipment_basic } from './models/entities/framework-equipment-basic.entity';

@Module({
  imports: [
    TypeOrmModule.forFeature([
      Corrective_action,
      Corrective_action_doc,
      Corrective_action_fault_img,
      Corrective_action_fix_img,
      Equipment_basic,
      Equipment_certificate,
      Equipment_ex,
      Equipment_standard,
      Equipment_drops,
      Framework_organisation,
      Framework_equipment_basic,
      //FrameworksModule,
    ]),
  ], // Updated class name
  controllers: [EquipmentsController],
  providers: [EquipmentsService],
  exports: [EquipmentsService],
})
export class EquipmentsModule {}
