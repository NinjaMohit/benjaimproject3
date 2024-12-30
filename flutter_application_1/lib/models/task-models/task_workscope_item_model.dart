class TaskWorkscopeItemModel {
  final int taskWorkscopeId;
  final String taskWorkscopeKey;
  final int taskEquipmentId;
  final String taskEquipmentKey;
  final int taskWorkscopeSpecificId;
  final String taskWorkscopeSpecificKey;
  final int taskId;
  final String taskKey;
  final int frmEquipmentId;
  final int equipmentId;
  final String equipmentKey;
  final int certId;
  final String equipmentCertKey;
  final DateTime workStartDate;
  final DateTime workEndDate;
  final int isUnexpirable;
  final int isApproved;
  final int approvedBy;
  final int isDeleted;
  final int certCheckbox;
  final int correctiveId;
  final String correctiveKey;
  final int createdBy;
  final DateTime createdOn;
  final int updatedBy;
  final DateTime? updatedOn; // nullable
  final DateTime syncDate;

  TaskWorkscopeItemModel({
    required this.taskWorkscopeId,
    required this.taskWorkscopeKey,
    required this.taskEquipmentId,
    required this.taskEquipmentKey,
    required this.taskWorkscopeSpecificId,
    required this.taskWorkscopeSpecificKey,
    required this.taskId,
    required this.taskKey,
    required this.frmEquipmentId,
    required this.equipmentId,
    required this.equipmentKey,
    required this.certId,
    required this.equipmentCertKey,
    required this.workStartDate,
    required this.workEndDate,
    required this.isUnexpirable,
    required this.isApproved,
    required this.approvedBy,
    required this.isDeleted,
    required this.certCheckbox,
    required this.correctiveId,
    required this.correctiveKey,
    required this.createdBy,
    required this.createdOn,
    required this.updatedBy,
    this.updatedOn, // Allow null
    required this.syncDate,
  });
  factory TaskWorkscopeItemModel.fromJson(Map<String, dynamic> json) {
    return TaskWorkscopeItemModel(
      taskWorkscopeId: json['task_workscope_id'],
      taskWorkscopeKey: json['task_workscope_key'] ??
          '', // Provide default empty string if null
      taskEquipmentId: json['task_equipment_id'],
      taskEquipmentKey: json['task_equipment_key'] ??
          '', // Provide default empty string if null
      taskWorkscopeSpecificId: json['task_workscope_specific_id'],
      taskWorkscopeSpecificKey: json['task_workscope_specific_key'] ??
          '', // Provide default empty string if null
      taskId: json['task_id'],
      taskKey: json['task_key'] ?? '', // Provide default empty string if null
      frmEquipmentId: json['frm_equipment_id'],
      equipmentId: json['equipment_id'],
      equipmentKey:
          json['equipment_key'] ?? '', // Provide default empty string if null
      certId: json['cert_id'],
      equipmentCertKey: json['equipment_cert_key'] ??
          '', // Provide default empty string if null
      workStartDate: DateTime.parse(json['work_start_date']),
      workEndDate: DateTime.parse(json['work_end_date']),
      isUnexpirable: json['is_unexpirable'],
      isApproved: json['is_approved'],
      approvedBy: json['approved_by'],
      isDeleted: json['is_deleted'],
      certCheckbox: json['cert_checkbox'],
      correctiveId: json['corrective_id'],
      correctiveKey:
          json['corrective_key'] ?? '', // Provide default empty string if null
      createdBy: json['created_by'],
      createdOn: DateTime.parse(json['created_on']),
      updatedBy: json['updated_by'],
      updatedOn: json['updated_on'] != null
          ? DateTime.parse(json['updated_on'])
          : null,
      syncDate: DateTime.parse(json['sync_date']),
    );
  }

  // Convert model to JSON format
  Map<String, dynamic> toJson() {
    return {
      'task_workscope_id': taskWorkscopeId,
      'task_workscope_key': taskWorkscopeKey,
      'task_equipment_id': taskEquipmentId,
      'task_equipment_key': taskEquipmentKey,
      'task_workscope_specific_id': taskWorkscopeSpecificId,
      'task_workscope_specific_key': taskWorkscopeSpecificKey,
      'task_id': taskId,
      'task_key': taskKey,
      'frm_equipment_id': frmEquipmentId,
      'equipment_id': equipmentId,
      'equipment_key': equipmentKey,
      'cert_id': certId,
      'equipment_cert_key': equipmentCertKey,
      'work_start_date': workStartDate.toIso8601String(),
      'work_end_date': workEndDate.toIso8601String(),
      'is_unexpirable': isUnexpirable,
      'is_approved': isApproved,
      'approved_by': approvedBy,
      'is_deleted': isDeleted,
      'cert_checkbox': certCheckbox,
      'corrective_id': correctiveId,
      'corrective_key': correctiveKey,
      'created_by': createdBy,
      'created_on': createdOn.toIso8601String(),
      'updated_by': updatedBy,
      'updated_on': updatedOn?.toIso8601String() ??
          DateTime.now().toIso8601String(), // Default to now if null
      'sync_date': syncDate.toIso8601String(),
    };
  }
}
