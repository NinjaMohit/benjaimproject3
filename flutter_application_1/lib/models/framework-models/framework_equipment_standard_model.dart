class FrameworkEquipmentStandardModel {
  int? id; // Nullable since it may not be present initially
  final int equipmentId; // Equipment ID is required
  String? internationalStandards; // International standards can be null
  String? regionalStandards; // Regional standards can be null
  String? contractorStandards; // Contractor standards can be null
  String? systemNoteOnGeneral; // System note on general can be null
  String? dropStandards; // Drop standards can be null
  String? systemNotesOnDrops; // System notes on drops can be null
  String? internationalStandardsDetails; // Details about international standards can be null
  String? regionalStandardsDetails; // Details about regional standards can be null
  String? contractorStandardsDetails; // Details about contractor standards can be null
  String? primaryFixing; // Primary fixing info can be null
  String? secondaryRetention; // Secondary retention info can be null
  String? safetySecuring; // Safety securing details can be null
  String? dropsInspectionProcedure; // Drops inspection procedure can be null
  String? exStandard; // EX standards can be null
  String? exSystemNotes; // EX system notes can be null
  String? exGeneralProcedure; // EX general procedure can be null
  String? exSpecialProcedure; // EX special procedure can be null
  String? dropsFrequency; // Drops frequency can be null
  String? standards; // General standards can be null
  String? standardsDetails; // Additional details on standards can be null
  final int registerUpdate; // Register update flag is required
  final int createdBy; // ID of user who created the record is required
  final String createdOn; // Creation timestamp is required
  final int updatedBy; // ID of user who updated the record is required
  final String updatedOn; // Last updated timestamp is required
  final String syncDate; // Synchronization date is required

  // Constructor with required parameters and optional ones
  FrameworkEquipmentStandardModel({
    this.id,
    required this.equipmentId,
    this.internationalStandards,
    this.regionalStandards,
    this.contractorStandards,
    this.systemNoteOnGeneral,
    this.dropStandards,
    this.systemNotesOnDrops,
    this.internationalStandardsDetails,
    this.regionalStandardsDetails,
    this.contractorStandardsDetails,
    this.primaryFixing,
    this.secondaryRetention,
    this.safetySecuring,
    this.dropsInspectionProcedure,
    this.exStandard,
    this.exSystemNotes,
    this.exGeneralProcedure,
    this.exSpecialProcedure,
    this.dropsFrequency,
    this.standards,
    this.standardsDetails,
    required this.registerUpdate,
    required this.createdBy,
    required this.createdOn,
    required this.updatedBy,
    required this.updatedOn,
    required this.syncDate,
  });

  // Convert a FrameworkEquipmentStandardModel into a Map (for inserting into the database)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'equipment_id': equipmentId,
      'international_standards': internationalStandards,
      'regional_standards': regionalStandards,
      'contractor_standards': contractorStandards,
      'system_note_on_general': systemNoteOnGeneral,
      'drop_standards': dropStandards,
      'system_notes_on_drops': systemNotesOnDrops,
      'international_standards_details': internationalStandardsDetails,
      'regional_standards_details': regionalStandardsDetails,
      'contractor_standards_details': contractorStandardsDetails,
      'primary_fixing': primaryFixing,
      'secondary_retention': secondaryRetention,
      'safety_securing': safetySecuring,
      'drops_inspection_procedure': dropsInspectionProcedure,
      'ex_standard': exStandard,
      'ex_system_notes': exSystemNotes,
      'ex_general_procedure': exGeneralProcedure,
      'ex_special_procedure': exSpecialProcedure,
      'drops_frequency': dropsFrequency,
      'standards': standards,
      'standards_details': standardsDetails,
      'register_update': registerUpdate,
      'created_by': createdBy,
      'created_on': createdOn,
      'updated_by': updatedBy,
      'updated_on': updatedOn,
      'sync_date': syncDate,
    };
  }

  // Convert a Map into a FrameworkEquipmentStandardModel (for retrieving from the database)
  factory FrameworkEquipmentStandardModel.fromJson(Map<String, dynamic> json) {
    return FrameworkEquipmentStandardModel(
      id: json['id'],
      equipmentId: json['equipment_id'] ?? 0, // Provide default value
      internationalStandards: json['international_standards'],
      regionalStandards: json['regional_standards'],
      contractorStandards: json['contractor_standards'],
      systemNoteOnGeneral: json['system_note_on_general'],
      dropStandards: json['drop_standards'],
      systemNotesOnDrops: json['system_notes_on_drops'],
      internationalStandardsDetails: json['international_standards_details'],
      regionalStandardsDetails: json['regional_standards_details'],
      contractorStandardsDetails: json['contractor_standards_details'],
      primaryFixing: json['primary_fixing'],
      secondaryRetention: json['secondary_retention'],
      safetySecuring: json['safety_securing'],
      dropsInspectionProcedure: json['drops_inspection_procedure'],
      exStandard: json['ex_standard'],
      exSystemNotes: json['ex_system_notes'],
      exGeneralProcedure: json['ex_general_procedure'],
      exSpecialProcedure: json['ex_special_procedure'],
      dropsFrequency: json['drops_frequency'],
      standards: json['standards'],
      standardsDetails: json['standards_details'],
      registerUpdate: json['register_update'] ?? 0, // Default value
      createdBy: json['created_by'] ?? 0, // Default value
      createdOn: json['created_on'] ?? '', // Default to empty string
      updatedBy: json['updated_by'] ?? 0, // Default value
      updatedOn: json['updated_on'] ?? '', // Default to empty string
      syncDate: json['sync_date'] ?? '', // Default to empty string
    );
  }
}
