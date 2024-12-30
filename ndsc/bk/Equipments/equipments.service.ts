import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Corrective_action } from './models/entities/corrective-action.entity';
import { Corrective_action_doc } from './models/entities/corrective-action-doc.entity';
import { Corrective_action_fault_img } from './models/entities/corrective-action-fault-img.entity';
import { Corrective_action_fix_img } from './models/entities/corrective-action-fix-img.entity';

import { Equipment_basic } from './models/entities/equipment-basic.entity';
import { Equipment_certificate } from './models/entities/equipment-certificate.entity';
import { Equipment_ex } from './models/entities/equipment-ex.entity';
import { Equipment_standard } from './models/entities/equipment-standard.entity';
import { Equipment_drops } from './models/entities/equipment-drops.entity';
import { Framework_organisation } from './models/entities/framework-organisation.entity';
import { Framework_equipment_basic } from './models/entities/framework-equipment-basic.entity';

import { Repository, In } from 'typeorm';
//import { FrameworksService } from '../Frameworks/frameworks.service'; // Adjust the path as needed

@Injectable()
export class EquipmentsService {
  constructor(
    //@InjectRepository(FrameworksService)
    // private readonly frameworksService: FrameworksService,

    @InjectRepository(Framework_equipment_basic)
    private FrameworkequipmentbasicRepository: Repository<Framework_equipment_basic>,

    @InjectRepository(Framework_organisation)
    private FrameworkOrganisationRepository: Repository<Framework_organisation>,

    @InjectRepository(Equipment_basic)
    private EquipmentBasicRepository: Repository<Equipment_basic>,

    @InjectRepository(Corrective_action)
    private correctiveActionRepository: Repository<Corrective_action>,

    @InjectRepository(Equipment_drops)
    private EquipmentDropsRepository: Repository<Equipment_drops>,

    @InjectRepository(Equipment_standard)
    private EquipmentStandardRepository: Repository<Equipment_standard>,

    @InjectRepository(Equipment_ex)
    private EquipmentExRepository: Repository<Equipment_ex>,

    @InjectRepository(Equipment_certificate)
    private EquipmentCertificateRepository: Repository<Equipment_certificate>,

    @InjectRepository(Corrective_action_doc)
    private CorrectiveActionDocRepository: Repository<Corrective_action_doc>,

    @InjectRepository(Corrective_action_fault_img)
    private CorrectiveActionFaultImgRepository: Repository<Corrective_action_fault_img>,

    @InjectRepository(Corrective_action_fix_img)
    private CorrectiveActionFixImgRepository: Repository<Corrective_action_fix_img>,
  ) {}

  async getCorrectiveActions(
    assigned_to: number,
  ): Promise<Corrective_action[]> {
    const list = await this.correctiveActionRepository.find({
      where: {
        assigned_to: assigned_to,
      },
    });

    return list;
  }

  async getEquipmentByParent(parentId: number): Promise<number[]> {
    const eqtypes = await this.FrameworkequipmentbasicRepository.find({
      relations: ['children'], // Fetch child locations recursively
      where: { parent: { equipment_id: parentId } }, // Match locations by their parent ID
    });

    // Map to get an array of organisation_ids from the children
    const EquipmentIds = eqtypes.flatMap((eqtype) =>
      eqtype.children.map((child) => child.equipment_id),
    );
    EquipmentIds.push(parentId);
    return EquipmentIds;
  }

  async getLocationsByParentId(parentId: number): Promise<number[]> {
    const locations = await this.FrameworkOrganisationRepository.find({
      relations: ['children'], // Fetch child locations recursively
      where: { parent: { organisation_id: parentId } }, // Match locations by their parent ID
    });

    // Map to get an array of organisation_ids from the children
    const organisationIds = locations.flatMap((location) =>
      location.children.map((child) => child.organisation_id),
    );
    organisationIds.push(parentId);
    return organisationIds;
  }

  async getEquipments(location_id: number): Promise<Equipment_basic[]> {
    const locations = await this.getLocationsByParentId(location_id);
    const equipments = await this.EquipmentBasicRepository.find({
      where: {
        location: In(locations),
        is_deleted: 0,
      },
    });

    return equipments;
  }

  async getEquipmentCerts(
    location_id: number,
  ): Promise<Equipment_certificate[]> {
    const equipments = await this.getEquipments(location_id);
    const ids = [];

    for (var i = 0; i < equipments.length; i++) {
      var id = equipments[i]['id'];
      ids.push(id);
    }

    const equipment_certs = await this.EquipmentCertificateRepository.find({
      where: {
        equipment_id: In(ids),
        is_deleted: 0,
      },
    });

    return equipment_certs;
  }

  async getEquipmentEx(location_id: number): Promise<Equipment_ex[]> {
    const equipments = await this.getEquipments(location_id);
    const ids = [];

    for (var i = 0; i < equipments.length; i++) {
      var id = equipments[i]['id'];
      ids.push(id);
    }

    const equipment_ex = await this.EquipmentExRepository.find({
      where: {
        equipment_id: In(ids),
      },
    });

    return equipment_ex;
  }

  async getEquipmentStandard(
    location_id: number,
  ): Promise<Equipment_standard[]> {
    const equipments = await this.getEquipments(location_id);
    const ids = [];

    for (var i = 0; i < equipments.length; i++) {
      var id = equipments[i]['id'];
      ids.push(id);
    }

    const equipment_standard = await this.EquipmentStandardRepository.find({
      where: {
        equipment_id: In(ids),
      },
    });

    return equipment_standard;
  }

  async getEquipmentDrops(location_id: number): Promise<Equipment_drops[]> {
    const equipments = await this.getEquipments(location_id);
    const ids = [];

    for (var i = 0; i < equipments.length; i++) {
      var id = equipments[i]['id'];
      ids.push(id);
    }

    const equipment_standard = await this.EquipmentDropsRepository.find({
      where: {
        equipment_id: In(ids),
      },
    });

    return equipment_standard;
  }
}
