class EquipmentCertificateModel {
  int? certId;
  String equipmentCertKey;
  int equipmentId;
  String equipmentKey;
  String certTitle;
  int frmCertId;
  int certType;
  DateTime? issueDate;
  DateTime? expiryDateOld;
  DateTime? expiryDate;
  double current;
  double last;
  double remaining;
  String? certValidDays;
  String dayHour;
  int isUnexpirable;
  int active;
  int maintenanceTask;
  String certFile;
  DateTime updatedOn;
  int updatedBy;
  int status;
  String stage;
  int verification;
  int isDeleted;
  DateTime syncDate;

  EquipmentCertificateModel({
    this.certId,
    required this.equipmentCertKey,
    required this.equipmentId,
    required this.equipmentKey,
    required this.certTitle,
    required this.frmCertId,
    required this.certType,
    this.issueDate,
    this.expiryDateOld,
    this.expiryDate,
    required this.current,
    required this.last,
    required this.remaining,
    this.certValidDays,
    required this.dayHour,
    required this.isUnexpirable,
    required this.active,
    required this.maintenanceTask,
    required this.certFile,
    required this.updatedOn,
    required this.updatedBy,
    required this.status,
    required this.stage,
    required this.verification,
    required this.isDeleted,
    required this.syncDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'cert_id': certId,
      'equipment_cert_key': equipmentCertKey,
      'equipment_id': equipmentId,
      'equipment_key': equipmentKey,
      'cert_title': certTitle,
      'frm_cert_id': frmCertId,
      'cert_type': certType,
      'issue_date': issueDate?.toIso8601String(),
      'expiry_date_old': expiryDateOld?.toIso8601String(),
      'expiry_date': expiryDate?.toIso8601String(),
      'current': current,
      'last': last,
      'remaining': remaining,
      'cert_valid_days': certValidDays,
      'day_hour': dayHour,
      'is_unexpirable': isUnexpirable,
      'active': active,
      'maintenance_task': maintenanceTask,
      'cert_file': certFile,
      'updated_on': updatedOn.toIso8601String(),
      'updated_by': updatedBy,
      'status': status,
      'stage': stage,
      'verification': verification,
      'is_deleted': isDeleted,
      'sync_date': syncDate.toIso8601String(),
    };
  }

  factory EquipmentCertificateModel.fromJson(Map<String, dynamic> json) {
    return EquipmentCertificateModel(
      certId: json['cert_id'],
      equipmentCertKey: json['equipment_cert_key'] ?? '',
      equipmentId: json['equipment_id'] ?? 0,
      equipmentKey: json['equipment_key'] ?? '',
      certTitle: json['cert_title'] ?? '',
      frmCertId: json['frm_cert_id'] ?? 0,
      certType: json['cert_type'] ?? 0,
      issueDate: json['issue_date'] != null
          ? DateTime.parse(json['issue_date'])
          : null,
      expiryDateOld: json['expiry_date_old'] != null
          ? DateTime.parse(json['expiry_date_old'])
          : null,
      expiryDate: json['expiry_date'] != null
          ? DateTime.parse(json['expiry_date'])
          : null,
      current: json['current']?.toDouble() ?? 0.0,
      last: json['last']?.toDouble() ?? 0.0,
      remaining: json['remaining']?.toDouble() ?? 0.0,
      certValidDays: json['cert_valid_days'],
      dayHour: json['day_hour'] ?? 'd',
      isUnexpirable: json['is_unexpirable'] ?? 0,
      active: json['active'] ?? 0,
      maintenanceTask: json['maintenance_task'] ?? 0,
      certFile: json['cert_file'] ?? '',
      updatedOn: DateTime.parse(
          json['updated_on'] ?? DateTime.now().toIso8601String()),
      updatedBy: json['updated_by'] ?? 0,
      status: json['status'] ?? 0,
      stage: json['stage'] ?? 'PENDING',
      verification: json['verification'] ?? 3,
      isDeleted: json['is_deleted'] ?? 0,
      syncDate:
          DateTime.parse(json['sync_date'] ?? DateTime.now().toIso8601String()),
    );
  }
}
