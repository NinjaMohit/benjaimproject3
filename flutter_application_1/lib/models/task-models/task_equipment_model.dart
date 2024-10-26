class TaskEquipmentModel {
  int? taskEquipmentId; // Nullable because it's auto-incremented
  int taskId;
  String taskEquipmentKey;
  String taskKey;
  int equipmentTypeId;
  String equipmentStatus;
  int certificateId;
  int createdBy;
  String? createdOn; // Nullable, if not always set initially
  int updatedBy;
  String? updatedOn; // Nullable, if not always updated initially
  int status;
  String syncDate;

  TaskEquipmentModel({
    this.taskEquipmentId, // Nullable
    required this.taskId,
    required this.taskEquipmentKey,
    required this.taskKey,
    required this.equipmentTypeId,
    required this.equipmentStatus,
    required this.certificateId,
    required this.createdBy,
    this.createdOn, // Nullable
    required this.updatedBy,
    this.updatedOn, // Nullable
    required this.status,
    required this.syncDate,
  });

  // Convert a TaskEquipmentModel object into a Map object
  Map<String, dynamic> toJson() {
    return {
      'task_equipment_id': taskEquipmentId,
      'task_id': taskId,
      'task_equipment_key': taskEquipmentKey,
      'task_key': taskKey,
      'equipment_type_id': equipmentTypeId,
      'equipment_status': equipmentStatus,
      'certificate_id': certificateId,
      'created_by': createdBy,
      'created_on': createdOn,
      'updated_by': updatedBy,
      'updated_on': updatedOn,
      'status': status,
      'sync_date': syncDate,
    };
  }

  factory TaskEquipmentModel.fromJson(Map<String, dynamic> json) {
    return TaskEquipmentModel(
      taskEquipmentId: json['task_equipment_id'],
      taskId: json['task_id'] ?? 0,
      taskEquipmentKey: json['task_equipment_key'] ?? '',
      taskKey: json['task_key'] ?? '',
      equipmentTypeId: json['equipment_type_id'] ?? 0,
      equipmentStatus: json['equipment_status'] ?? '',
      certificateId: json['certificate_id'] ?? 0,
      createdBy: json['created_by'] ?? 0,
      createdOn: json['created_on'], // Nullable
      updatedBy: json['updated_by'] ?? 0,
      updatedOn: json['updated_on'], // Nullable
      status: json['status'] ?? 0,
      syncDate: json['sync_date'] ?? '',
    );
  }
}
