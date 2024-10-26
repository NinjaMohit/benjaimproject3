class FrameworkEquipmentCertModel {
  int? certId; // Nullable since it may not be present initially
  final int equipmentId; // Required
  final int frmCertId; // Required
  final String certTitle; // Required
  final int validDays; // Required
  final int validHours; // Required
  final int unexpirable; // Required
  final int certType; // Required
  final int createdBy; // Required
  final String createdOn; // Required (as a string to store date)
  final String dayHour; // Required, defaults to 'd'
  final int sort; // Required
  final int updatedBy; // Required
  final String updatedOn; // Required (as a string to store date)
  final int status; // Required
  final int notActive; // Required
  final int maintenanceTask; // Required
  final String syncDate; // Required (as a string to store date)

  // Constructor with required parameters and optional ones
  FrameworkEquipmentCertModel({
    this.certId,
    required this.equipmentId,
    required this.frmCertId,
    required this.certTitle,
    required this.validDays,
    required this.validHours,
    required this.unexpirable,
    required this.certType,
    required this.createdBy,
    required this.createdOn,
    required this.dayHour,
    required this.sort,
    required this.updatedBy,
    required this.updatedOn,
    required this.status,
    required this.notActive,
    required this.maintenanceTask,
    required this.syncDate,
  });

  // Convert a FrameworkEquipmentCertModel into a Map (for inserting into the database)
  Map<String, dynamic> toJson() {
    return {
      'cert_id': certId,
      'equipment_id': equipmentId,
      'frm_cert_id': frmCertId,
      'cert_title': certTitle,
      'valid_days': validDays,
      'valid_hours': validHours,
      'unexpirable': unexpirable,
      'cert_type': certType,
      'created_by': createdBy,
      'created_on': createdOn,
      'day_hour': dayHour,
      'sort': sort,
      'updated_by': updatedBy,
      'updated_on': updatedOn,
      'status': status,
      'not_active': notActive,
      'maintenance_task': maintenanceTask,
      'sync_date': syncDate,
    };
  }

  // Convert a Map into a FrameworkEquipmentCertModel (for retrieving from the database)
  factory FrameworkEquipmentCertModel.fromJson(Map<String, dynamic> json) {
    return FrameworkEquipmentCertModel(
      certId: json['cert_id'],
      equipmentId: json['equipment_id'] ?? 0, // Default value
      frmCertId: json['frm_cert_id'] ?? 0, // Default value
      certTitle: json['cert_title'] ?? 'Unknown Title', // Default value
      validDays: json['valid_days'] ?? 0, // Default value
      validHours: json['valid_hours'] ?? 0, // Default value
      unexpirable: json['unexpirable'] ?? 0, // Default value
      certType: json['cert_type'] ?? 0, // Default value
      createdBy: json['created_by'] ?? 0, // Default value
      createdOn: json['created_on'] ?? '', // Default to empty string
      dayHour: json['day_hour'] ?? 'd', // Default to 'd'
      sort: json['sort'] ?? 0, // Default value
      updatedBy: json['updated_by'] ?? 0, // Default value
      updatedOn: json['updated_on'] ?? '', // Default to empty string
      status: json['status'] ?? 1, // Default to 1
      notActive: json['not_active'] ?? 0, // Default value
      maintenanceTask: json['maintenance_task'] ?? 0, // Default value
      syncDate: json['sync_date'] ?? '', // Default to empty string
    );
  }
}
