class CorrectiveActionModel {
  final int correctiveId;
  final String correctiveKey;
  final int equipmentId;
  final String equipmentKey;
  final String caType;
  final String? caTypeOld; // Nullable field
  final String caDetails;
  final DateTime dateOfFail;
  final String foundBy;
  final DateTime closeOutBy;
  final int caStatus;
  final int caStatusOld;
  final int assignedTo;
  final DateTime closedOut;
  final String approved;
  final String notes;
  final int relTaskWorkscopeId;
  final int createdBy;
  final DateTime createdOn;
  final int updatedBy;
  final DateTime updatedOn;
  final int status;
  final int verification;
  final String stage;
  final DateTime syncDate;

  CorrectiveActionModel({
    required this.correctiveId,
    required this.correctiveKey,
    required this.equipmentId,
    required this.equipmentKey,
    required this.caType,
    this.caTypeOld,
    required this.caDetails,
    required this.dateOfFail,
    required this.foundBy,
    required this.closeOutBy,
    this.caStatus = 1,
    this.caStatusOld = 0,
    required this.assignedTo,
    required this.closedOut,
    required this.approved,
    required this.notes,
    this.relTaskWorkscopeId = 0,
    required this.createdBy,
    required this.createdOn,
    required this.updatedBy,
    required this.updatedOn,
    this.status = 1,
    this.verification = 3,
    required this.stage,
    required this.syncDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'corrective_id': correctiveId,
      'corrective_key': correctiveKey,
      'equipment_id': equipmentId,
      'equipment_key': equipmentKey,
      'ca_type': caType,
      'ca_type_old': caTypeOld,
      'ca_details': caDetails,
      'date_of_fail': dateOfFail.toIso8601String(),
      'found_by': foundBy,
      'close_out_by': closeOutBy.toIso8601String(),
      'ca_status': caStatus,
      'ca_status_old': caStatusOld,
      'assigned_to': assignedTo,
      'closed_out': closedOut.toIso8601String(),
      'approved': approved,
      'notes': notes,
      'rel_task_workscope_id': relTaskWorkscopeId,
      'created_by': createdBy,
      'created_on': createdOn.toIso8601String(),
      'updated_by': updatedBy,
      'updated_on': updatedOn.toIso8601String(),
      'status': status,
      'verification': verification,
      'stage': stage,
      'sync_date': syncDate.toIso8601String(),
    };
  }

  factory CorrectiveActionModel.fromJson(Map<String, dynamic> json) {
    return CorrectiveActionModel(
      correctiveId: json['corrective_id'] ?? 0, // Default value if null
      correctiveKey: json['corrective_key'] ?? '',
      equipmentId: json['equipment_id'] ?? 0,
      equipmentKey: json['equipment_key'] ?? '',
      caType: json['ca_type'] ?? '',
      caTypeOld: json['ca_type_old'], // Nullable
      caDetails: json['ca_details'] ?? '',
      dateOfFail:
          DateTime.tryParse(json['date_of_fail'] ?? '') ?? DateTime.now(),
      foundBy: json['found_by'] ?? '',
      closeOutBy:
          DateTime.tryParse(json['close_out_by'] ?? '') ?? DateTime.now(),
      caStatus: json['ca_status'] ?? 1,
      caStatusOld: json['ca_status_old'] ?? 0,
      assignedTo: json['assigned_to'] ?? 0,
      closedOut: DateTime.tryParse(json['closed_out'] ?? '') ?? DateTime.now(),
      approved: json['approved'] ?? '',
      notes: json['notes'] ?? '',
      relTaskWorkscopeId: json['rel_task_workscope_id'] ?? 0,
      createdBy: json['created_by'] ?? 0,
      createdOn: DateTime.tryParse(json['created_on'] ?? '') ?? DateTime.now(),
      updatedBy: json['updated_by'] ?? 0,
      updatedOn: DateTime.tryParse(json['updated_on'] ?? '') ?? DateTime.now(),
      status: json['status'] ?? 1,
      verification: json['verification'] ?? 3,
      stage: json['stage'] ?? '',
      syncDate: DateTime.tryParse(json['sync_date'] ?? '') ?? DateTime.now(),
    );
  }
}
