class TaskWorkscopeSpecificEquipmentModel {
  final int? taskWorkscopeSpecificId; // Optional for auto-incremented ID
  final String? taskWorkscopeSpecificKey;
  final int taskId;
  final String? taskKey;
  final String? workscopeSpecificSerialRfid;
  final int equipmentId;
  final String? equipmentKey;
  final int certId;
  final String? equipmentCertKey;
  final int createdBy;
  final String? createdOn;
  final int updatedBy;
  final String updatedOn; // Changed to non-nullable
  final int status;
  final String? syncDate;

  TaskWorkscopeSpecificEquipmentModel({
    this.taskWorkscopeSpecificId,
    this.taskWorkscopeSpecificKey,
    required this.taskId,
    this.taskKey,
    this.workscopeSpecificSerialRfid,
    required this.equipmentId,
    this.equipmentKey,
    required this.certId,
    this.equipmentCertKey,
    required this.createdBy,
    this.createdOn,
    required this.updatedBy,
    String? updatedOn, // Nullable in constructor
    this.status = 1,
    this.syncDate,
  }) : updatedOn = updatedOn ??
            DateTime.now()
                .toIso8601String(); // Initialize with current date if null

  Map<String, dynamic> toJson() {
    return {
      'task_workscope_specific_id': taskWorkscopeSpecificId,
      'task_workscope_specific_key': taskWorkscopeSpecificKey,
      'task_id': taskId,
      'task_key': taskKey,
      'workscope_specific_serial_rfid': workscopeSpecificSerialRfid,
      'equipment_id': equipmentId,
      'equipment_key': equipmentKey,
      'cert_id': certId,
      'equipment_cert_key': equipmentCertKey,
      'created_by': createdBy,
      'created_on': createdOn,
      'updated_by': updatedBy,
      'updated_on': updatedOn,
      'status': status,
      'sync_date': syncDate,
    };
  }

  factory TaskWorkscopeSpecificEquipmentModel.fromJson(
      Map<String, dynamic> json) {
    return TaskWorkscopeSpecificEquipmentModel(
      taskWorkscopeSpecificId: json['task_workscope_specific_id'],
      taskWorkscopeSpecificKey: json['task_workscope_specific_key'],
      taskId: json['task_id'],
      taskKey: json['task_key'],
      workscopeSpecificSerialRfid: json['workscope_specific_serial_rfid'],
      equipmentId: json['equipment_id'],
      equipmentKey: json['equipment_key'],
      certId: json['cert_id'],
      equipmentCertKey: json['equipment_cert_key'],
      createdBy: json['created_by'],
      createdOn: json['created_on'],
      updatedBy: json['updated_by'],
      updatedOn: json['updated_on'] ??
          DateTime.now()
              .toIso8601String(), // Initialize with current date if null
      status: json['status'] ?? 1,
      syncDate: json['sync_date'],
    );
  }
}
