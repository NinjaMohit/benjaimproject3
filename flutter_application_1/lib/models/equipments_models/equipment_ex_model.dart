class EquipmentExModel {
  int? exId;
  String exKey;
  int equipmentId;
  String equipmentKey;
  String? exIdTag;
  String? exCableTag;
  String? exNoGlands;
  String exZone;
  String? eplAtexMarking;
  String? exCategory;
  String? exDivision;
  String? exProtection;
  String? exGasGroup;
  String? exIpCode;
  String? exStandards;
  String? exPmi;
  String? exTempClass;
  String? exAmbientTemp;
  String? exExposure;
  String? exESD;
  String? exCertNo;
  String? exNotifiedBody;
  String? exLinkToCertificates;
  String? exGeneralProcedure;
  String? exSpecialProcedure;
  String? exImage;
  int createdBy;
  DateTime? createdOn;
  int? updatedBy;
  DateTime updatedOn;
  DateTime syncDate;

  EquipmentExModel({
    this.exId,
    required this.exKey,
    required this.equipmentId,
    required this.equipmentKey,
    this.exIdTag,
    this.exCableTag,
    this.exNoGlands,
    required this.exZone,
    this.eplAtexMarking,
    this.exCategory,
    this.exDivision,
    this.exProtection,
    this.exGasGroup,
    this.exIpCode,
    this.exStandards,
    this.exPmi,
    this.exTempClass,
    this.exAmbientTemp,
    this.exExposure,
    this.exESD,
    this.exCertNo,
    this.exNotifiedBody,
    this.exLinkToCertificates,
    this.exGeneralProcedure,
    this.exSpecialProcedure,
    this.exImage,
    required this.createdBy,
    this.createdOn,
    this.updatedBy,
    required this.updatedOn,
    required this.syncDate,
  });

  factory EquipmentExModel.fromJson(Map<String, dynamic> json) {
    return EquipmentExModel(
      exId: json['ex_id'] as int?,
      exKey: json['ex_key'] ?? '',
      equipmentId: json['equipment_id'] ?? 0,
      equipmentKey: json['equipment_key'] ?? '',
      exIdTag: json['ex_id_tag'] ?? '',
      exCableTag: json['ex_cable_tag'] ?? '',
      exNoGlands: json['ex_no_glands'] ?? '',
      exZone: json['ex_zone'] ?? '',
      eplAtexMarking: json['epl_atex_marking'] ?? '',
      exCategory: json['ex_category'] ?? '',
      exDivision: json['ex_division'] ?? '',
      exProtection: json['ex_protection'] ?? '',
      exGasGroup: json['ex_gas_group'] ?? '',
      exIpCode: json['ex_ip_code'] ?? '',
      exStandards: json['ex_standards'] ?? '',
      exPmi: json['ex_pmi'] ?? '',
      exTempClass: json['ex_temp_class'] ?? '',
      exAmbientTemp: json['ex_ambient_temp'] ?? '',
      exExposure: json['ex_exposure'] ?? '',
      exESD: json['ex_ESD'] ?? '',
      exCertNo: json['ex_cert_no'] ?? '',
      exNotifiedBody: json['ex_notified_body'] ?? '',
      exLinkToCertificates: json['ex_link_to_certificates'] ?? '',
      exGeneralProcedure: json['ex_general_procedure'] ?? '',
      exSpecialProcedure: json['ex_special_procedure'] ?? '',
      exImage: json['ex_image'] ?? '',
      createdBy: json['created_by'] ?? 0,
      createdOn: json['created_on'] != null
          ? DateTime.parse(json['created_on'])
          : DateTime.now(),
      updatedBy: json['updated_by'] ?? 0,
      updatedOn: DateTime.parse(
          json['updated_on'] ?? DateTime.now().toIso8601String()),
      syncDate:
          DateTime.parse(json['sync_date'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ex_id': exId,
      'ex_key': exKey,
      'equipment_id': equipmentId,
      'equipment_key': equipmentKey,
      'ex_id_tag': exIdTag ?? '',
      'ex_cable_tag': exCableTag ?? '',
      'ex_no_glands': exNoGlands ?? '',
      'ex_zone': exZone,
      'epl_atex_marking': eplAtexMarking ?? '',
      'ex_category': exCategory ?? '',
      'ex_division': exDivision ?? '',
      'ex_protection': exProtection ?? '',
      'ex_gas_group': exGasGroup ?? '',
      'ex_ip_code': exIpCode ?? '',
      'ex_standards': exStandards ?? '',
      'ex_pmi': exPmi ?? '',
      'ex_temp_class': exTempClass ?? '',
      'ex_ambient_temp': exAmbientTemp ?? '',
      'ex_exposure': exExposure ?? '',
      'ex_ESD': exESD ?? '',
      'ex_cert_no': exCertNo ?? '',
      'ex_notified_body': exNotifiedBody ?? '',
      'ex_link_to_certificates': exLinkToCertificates ?? '',
      'ex_general_procedure': exGeneralProcedure ?? '',
      'ex_special_procedure': exSpecialProcedure ?? '',
      'ex_image': exImage ?? '',
      'created_by': createdBy,
      'created_on': createdOn?.toIso8601String(),
      'updated_by': updatedBy,
      'updated_on': updatedOn.toIso8601String(),
      'sync_date': syncDate.toIso8601String(),
    };
  }
}
