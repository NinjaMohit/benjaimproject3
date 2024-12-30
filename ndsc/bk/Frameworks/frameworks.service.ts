import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Framework_organisation } from './models/entities/framework-organisation.entity';
import { Framework_certificate } from './models/entities/framework-certificate.entity';
import { Framework_certificate_indicators } from './models/entities/framework-certificate-indicators.entity';
import { Framework_corrective_action } from './models/entities/framework-corrective-action.entity';

import { Framework_equipment_basic } from './models/entities/framework-equipment-basic.entity';
import { Framework_equipment_cert } from './models/entities/framework-equipment-cert.entity';
import { Framework_equipment_ex } from './models/entities/framework-equipment-ex.entity';
import { Framework_equipment_standard } from './models/entities/framework-equipment-standard.entity';

import { Repository, In } from 'typeorm';

@Injectable()
export class FrameworksService {
  constructor(
    @InjectRepository(Framework_organisation)
    private FrameworkOrganisationRepository: Repository<Framework_organisation>,

    @InjectRepository(Framework_certificate)
    private FrameworkCertificateRepository: Repository<Framework_certificate>,

    @InjectRepository(Framework_certificate_indicators)
    private FrameworkCertificateIndicatorsRepository: Repository<Framework_certificate_indicators>,

    @InjectRepository(Framework_corrective_action)
    private FrameworkCorrectiveActionRepository: Repository<Framework_corrective_action>,

    @InjectRepository(Framework_equipment_basic)
    private FrameworkEquipmentBasicRepository: Repository<Framework_equipment_basic>,

    @InjectRepository(Framework_equipment_cert)
    private FrameworkEquipmentCertRepository: Repository<Framework_equipment_cert>,

    @InjectRepository(Framework_equipment_ex)
    private FrameworkEquipmentExRepository: Repository<Framework_equipment_ex>,

    @InjectRepository(Framework_equipment_standard)
    private FrameworkEquipmentStandardRepository: Repository<Framework_equipment_standard>,
  ) {}

  async getLocation(
    organisation_id: number,
  ): Promise<Framework_organisation[]> {
    const locations =
      await this.FrameworkOrganisationRepository.createQueryBuilder(
        'framework_organisation',
      )
        .where('framework_organisation.organisation_id = :organisation_id', {
          organisation_id,
        })
        .getMany();

    return locations;
  }

  async getCertificates(id: number): Promise<any> {
    const certs = await this.FrameworkCertificateRepository.find({
      where: {
        cert_status: 1,
      },
    });

    return certs;
  }

  async getCertificate(id: number): Promise<Framework_certificate[]> {
    const certs = await this.FrameworkCertificateRepository.createQueryBuilder(
      'framework_certificate',
    )
      .where('framework_certificate.id = :id', { id })
      .getMany();

    return certs;
  }

  async getIndicators(): Promise<any> {
    const indicators = await this.FrameworkCertificateIndicatorsRepository.find(
      {
        where: {
          status: 1,
        },
      },
    );

    return indicators;
  }

  async getIndicator(id: number): Promise<Framework_certificate_indicators[]> {
    const indicator = await this.FrameworkCertificateIndicatorsRepository.find({
      where: {
        id: id,
      },
    });

    return indicator;
  }

  async getFrmCorrectiveActions(): Promise<any> {
    const corrective_actions =
      await this.FrameworkCorrectiveActionRepository.find({
        where: {
          ca_status: 1,
        },
      });

    return corrective_actions;
  }

  async getFrmCorrectiveAction(
    corrective_action_id: number,
  ): Promise<Framework_corrective_action[]> {
    const corrective_action =
      await this.FrameworkCorrectiveActionRepository.find({
        where: {
          corrective_action_id: corrective_action_id,
          ca_status: 1,
        },
      });

    return corrective_action;
  }

  async getFrameworkEquipments(): Promise<Framework_equipment_basic[]> {
    const frm_equipments = await this.FrameworkEquipmentBasicRepository.find({
      where: {
        status: 1,
      },
    });

    return frm_equipments;
  }

  async getFrameworkEquipment(
    equipment_id: number,
  ): Promise<Framework_equipment_basic[]> {
    const frm_equipment = await this.FrameworkEquipmentBasicRepository.find({
      where: {
        equipment_id: equipment_id,
        status: 1,
      },
    });

    return frm_equipment;
  }

  async getFrmEquipmentCerts(): Promise<Framework_equipment_cert[]> {
    const frm_equipment_certs =
      await this.FrameworkEquipmentCertRepository.find({
        where: {
          day_hour: 'd',
        },
      });

    return frm_equipment_certs;
  }

  async getFrmEquipmentEx(): Promise<Framework_equipment_ex[]> {
    const frm_equipment_ex = await this.FrameworkEquipmentExRepository.find({});

    return frm_equipment_ex;
  }

  async getFrmEquipmentStandard(): Promise<Framework_equipment_standard[]> {
    const frm_equipment_standard =
      await this.FrameworkEquipmentStandardRepository.find({});

    return frm_equipment_standard;
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
}
