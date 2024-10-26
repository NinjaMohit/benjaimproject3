class EquipmentStandardModel {
  final int? standardId; // Made nullable temporarily for debugging
  final String? standardKey; // Made nullable temporarily for debugging
  final int? equipmentId; // Made nullable temporarily for debugging
  final String? equipmentKey; // Made nullable temporarily for debugging
  final String internationalStandards;
  final String regionalStandards;
  final String? contractorStandards;
  final String? internationalDetails;
  final String? regionalDetails;
  final String? contractorDetails;
  final String internationalLinkToStandard;
  final String regionalLinkToStandard;
  final String contractorLinkToStandard;
  final int createdBy;
  final DateTime? createdOn;
  final int updatedBy;
  final DateTime updatedOn;
  final int published;
  final DateTime? syncDate;

  EquipmentStandardModel({
    this.standardId, // Made nullable temporarily for debugging
    this.standardKey, // Made nullable temporarily for debugging
    this.equipmentId, // Made nullable temporarily for debugging
    this.equipmentKey, // Made nullable temporarily for debugging
    required this.internationalStandards,
    required this.regionalStandards,
    this.contractorStandards,
    this.internationalDetails,
    this.regionalDetails,
    this.contractorDetails,
    required this.internationalLinkToStandard,
    required this.regionalLinkToStandard,
    required this.contractorLinkToStandard,
    required this.createdBy,
    this.createdOn,
    required this.updatedBy,
    required this.updatedOn,
    required this.published,
    this.syncDate,
  });

  factory EquipmentStandardModel.fromJson(Map<String, dynamic> json) {
    return EquipmentStandardModel(
      standardId: json['standard_id'] as int?,
      standardKey: json['standard_key'] as String?,
      equipmentId: json['equipment_id'] as int?,
      equipmentKey: json['equipment_key'] as String?,
      internationalStandards: json['international_standards'] ?? '',
      regionalStandards: json['regional_standards'] ?? '',
      contractorStandards: json['contractor_standards'] as String?,
      internationalDetails: json['international_details'] as String?,
      regionalDetails: json['regional_details'] as String?,
      contractorDetails: json['contractor_details'] as String?,
      internationalLinkToStandard: json['international_link_to_standard'] ?? '',
      regionalLinkToStandard: json['regional_link_to_standard'] ?? '',
      contractorLinkToStandard: json['contractor_link_to_standard'] ?? '',
      createdBy: json['created_by'] ?? 0,
      createdOn: json['created_on'] != null
          ? DateTime.tryParse(json['created_on'])
          : DateTime.now(), // Set fallback to current date
      updatedBy: json['updated_by'] ?? 0,
      updatedOn: json['updated_on'] != null
          ? DateTime.parse(json['updated_on'])
          : DateTime.now(), // Set fallback if `updated_on` is null
      published: json['published'] ?? 0,
      syncDate: json['sync_date'] != null
          ? DateTime.tryParse(json['sync_date'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'standard_id': standardId,
      'standard_key': standardKey,
      'equipment_id': equipmentId,
      'equipment_key': equipmentKey,
      'international_standards': internationalStandards,
      'regional_standards': regionalStandards,
      'contractor_standards': contractorStandards,
      'international_details': internationalDetails,
      'regional_details': regionalDetails,
      'contractor_details': contractorDetails,
      'international_link_to_standard': internationalLinkToStandard,
      'regional_link_to_standard': regionalLinkToStandard,
      'contractor_link_to_standard': contractorLinkToStandard,
      'created_by': createdBy,
      'created_on':
          createdOn?.toIso8601String() ?? DateTime.now().toIso8601String(),
      'updated_by': updatedBy,
      'updated_on': updatedOn.toIso8601String(),
      'published': published,
      'sync_date': (syncDate ?? DateTime.now())
          .toIso8601String(), // Ensure sync_date is not null
    };
  }
}
