class FrameworkEquipmentExModel {
  int? exId; // Nullable since it may not be present initially
  final int equipmentId; // Equipment ID is required
  final String eplAtexMarking; // EPL Atex marking is required
  final String exCategory; // EX category is required
  final String exDivision; // EX division is required
  final String exProtection; // EX protection can be null
  final String exGasGroup; // EX gas group is required
  final String exIpCode; // EX IP code is required
  final String exStandards; // EX standards can be null
  final String exPmi; // EX PMI can be null
  final String exTempClass; // EX temperature class is required
  final String exAmbientTemp; // EX ambient temperature is required
  final String exCertNo; // EX certificate number can be null
  final String exNotifiedBody; // EX notified body can be null
  final String exLinkToCertificates; // EX link to certificates can be null
  final String exGeneralProcedure; // EX general procedure can be null
  final String exSpecialProcedure; // EX special procedure can be null
  final int createdBy; // ID of user who created the record is required
  final int updatedBy; // ID of user who updated the record is required
  final String createdOn; // Creation timestamp is required
  final String updatedOn; // Last updated timestamp is required
  final String syncDate; // Synchronization date is required

  // Constructor with required parameters and optional ones
  FrameworkEquipmentExModel({
    this.exId,
    required this.equipmentId,
    required this.eplAtexMarking,
    required this.exCategory,
    required this.exDivision,
    required this.exProtection,
    required this.exGasGroup,
    required this.exIpCode,
    required this.exStandards,
    required this.exPmi,
    required this.exTempClass,
    required this.exAmbientTemp,
    required this.exCertNo,
    required this.exNotifiedBody,
    required this.exLinkToCertificates,
    required this.exGeneralProcedure,
    required this.exSpecialProcedure,
    required this.createdBy,
    required this.updatedBy,
    required this.createdOn,
    required this.updatedOn,
    required this.syncDate,
  });

  // Convert a FrameworkEquipmentExModel into a Map (for inserting into the database)
  Map<String, dynamic> toJson() {
    return {
      'ex_id': exId,
      'equipment_id': equipmentId,
      'epl_atex_marking': eplAtexMarking,
      'ex_category': exCategory,
      'ex_division': exDivision,
      'ex_protection': exProtection,
      'ex_gas_group': exGasGroup,
      'ex_ip_code': exIpCode,
      'ex_standards': exStandards,
      'ex_pmi': exPmi,
      'ex_temp_class': exTempClass,
      'ex_ambient_temp': exAmbientTemp,
      'ex_cert_no': exCertNo,
      'ex_notified_body': exNotifiedBody,
      'ex_link_to_certificates': exLinkToCertificates,
      'ex_general_procedure': exGeneralProcedure,
      'ex_special_procedure': exSpecialProcedure,
      'created_by': createdBy,
      'updated_by': updatedBy,
      'created_on': createdOn,
      'updated_on': updatedOn,
      'sync_date': syncDate,
    };
  }

  // Convert a Map into a FrameworkEquipmentExModel (for retrieving from the database)
  factory FrameworkEquipmentExModel.fromJson(Map<String, dynamic> json) {
    return FrameworkEquipmentExModel(
      exId: json['ex_id'],
      equipmentId: json['equipment_id'] ?? 0, // Provide default value
      eplAtexMarking: json['epl_atex_marking'] ??
          'Unknown Marking', // Default to avoid null
      exCategory:
          json['ex_category'] ?? 'Unknown Category', // Default to avoid null
      exDivision:
          json['ex_division'] ?? 'Unknown Division', // Default to avoid null
      exProtection: json['ex_protection'], // Can be null
      exGasGroup:
          json['ex_gas_group'] ?? 'Unknown Gas Group', // Default to avoid null
      exIpCode:
          json['ex_ip_code'] ?? 'Unknown IP Code', // Default to avoid null
      exStandards: json['ex_standards'], // Can be null
      exPmi: json['ex_pmi'], // Can be null
      exTempClass: json['ex_temp_class'] ??
          'Unknown Temp Class', // Default to avoid null
      exAmbientTemp: json['ex_ambient_temp'] ??
          'Unknown Ambient Temp', // Default to avoid null
      exCertNo: json['ex_cert_no'], // Can be null
      exNotifiedBody: json['ex_notified_body'], // Can be null
      exLinkToCertificates: json['ex_link_to_certificates'], // Can be null
      exGeneralProcedure: json['ex_general_procedure'], // Can be null
      exSpecialProcedure: json['ex_special_procedure'], // Can be null
      createdBy: json['created_by'] ?? 0, // Default value
      updatedBy: json['updated_by'] ?? 0, // Default value
      createdOn: json['created_on'] ?? '', // Default to empty string
      updatedOn: json['updated_on'] ?? '', // Default to empty string
      syncDate: json['sync_date'] ?? '', // Default to empty string
    );
  }
}
