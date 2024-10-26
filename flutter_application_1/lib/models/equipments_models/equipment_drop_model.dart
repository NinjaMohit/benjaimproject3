class EquipmentDropModel {
  int? dropid;
  String dropKey;
  int equipmentId;
  String equipmentKey;
  String dropId;
  String dropZone;
  String dropFrequency;
  String dropStandards;
  String dropPrimaryFixing;
  String dropSecondaryRetention;
  int dropSafetySecuring;
  String dropSafetySecuringOther;
  String dropSafetySecuringOld;
  String dropSafetySecuringSn;
  String dropInspectionProcedure;
  String dropPhoto;
  int createdBy;
  DateTime? createdOn;
  int updatedBy;
  DateTime updatedOn;
  DateTime syncDate;

  EquipmentDropModel({
    this.dropid,
    required this.dropKey,
    required this.equipmentId,
    required this.equipmentKey,
    required this.dropId,
    required this.dropZone,
    required this.dropFrequency,
    required this.dropStandards,
    required this.dropPrimaryFixing,
    required this.dropSecondaryRetention,
    required this.dropSafetySecuring,
    required this.dropSafetySecuringOther,
    required this.dropSafetySecuringOld,
    required this.dropSafetySecuringSn,
    required this.dropInspectionProcedure,
    required this.dropPhoto,
    required this.createdBy,
    this.createdOn,
    required this.updatedBy,
    required this.updatedOn,
    required this.syncDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'dropid': dropid,
      'drop_key': dropKey,
      'equipment_id': equipmentId,
      'equipment_key': equipmentKey,
      'drop_id': dropId,
      'drop_zone': dropZone,
      'drop_frequency': dropFrequency,
      'drop_standards': dropStandards,
      'drop_primary_fixing': dropPrimaryFixing,
      'drop_secondary_retention': dropSecondaryRetention,
      'drop_safety_securing': dropSafetySecuring,
      'drop_safety_securing_other': dropSafetySecuringOther,
      'drop_safety_securing_old': dropSafetySecuringOld,
      'drop_safety_securing_sn': dropSafetySecuringSn,
      'drop_inspection_procedure': dropInspectionProcedure,
      'drop_photo': dropPhoto,
      'created_by': createdBy,
      'created_on': (createdOn ?? DateTime.now())
          .toIso8601String(), // Default value for null
      'updated_by': updatedBy,
      'updated_on': updatedOn.toIso8601String(),
      'sync_date': syncDate.toIso8601String(),
    };
  }

  factory EquipmentDropModel.fromJson(Map<String, dynamic> json) {
    return EquipmentDropModel(
      dropid: json['dropid'],
      dropKey: json['drop_key'] ?? '',
      equipmentId: json['equipment_id'] ?? 0,
      equipmentKey: json['equipment_key'] ?? '',
      dropId: json['drop_id'] ?? '',
      dropZone: json['drop_zone'] ?? '',
      dropFrequency: json['drop_frequency'] ?? '0',
      dropStandards: json['drop_standards'] ?? '',
      dropPrimaryFixing: json['drop_primary_fixing'] ?? '',
      dropSecondaryRetention: json['drop_secondary_retention'] ?? '',
      dropSafetySecuring: json['drop_safety_securing'] ?? 0,
      dropSafetySecuringOther: json['drop_safety_securing_other'] ?? '',
      dropSafetySecuringOld: json['drop_safety_securing_old'] ?? '0',
      dropSafetySecuringSn: json['drop_safety_securing_sn'] ?? '',
      dropInspectionProcedure: json['drop_inspection_procedure'] ?? '',
      dropPhoto: json['drop_photo'] ?? '',
      createdBy: json['created_by'] ?? 0,
      createdOn: json['created_on'] != null
          ? DateTime.parse(json['created_on'])
          : null,
      updatedBy: json['updated_by'] ?? 0,
      updatedOn: DateTime.parse(
          json['updated_on'] ?? DateTime.now().toIso8601String()),
      syncDate:
          DateTime.parse(json['sync_date'] ?? DateTime.now().toIso8601String()),
    );
  }
}
