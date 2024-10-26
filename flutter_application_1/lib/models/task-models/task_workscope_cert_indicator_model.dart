class TaskWorkscopeCertIndicatorModel {
  int? id; // Local ID, not included in the database
  String taskWorkscopeCertIndicatorKey;
  int taskWorkscopeId;
  String taskWorkscopeKey;
  int equipmentId;
  String equipmentKey;
  int certificateIndicatorId;
  double measure;
  String comment;
  DateTime? inspectionDate;
  int indicatorStatus;
  String inspectionBy;
  int status;
  int isDeleted;
  DateTime syncDate;

  TaskWorkscopeCertIndicatorModel({
    this.id,
    required this.taskWorkscopeCertIndicatorKey,
    required this.taskWorkscopeId,
    required this.taskWorkscopeKey,
    required this.equipmentId,
    required this.equipmentKey,
    required this.certificateIndicatorId,
    required this.measure,
    required this.comment,
    this.inspectionDate,
    required this.indicatorStatus,
    required this.inspectionBy,
    required this.status,
    required this.isDeleted,
    required this.syncDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'task_workscope_cert_indicator_key': taskWorkscopeCertIndicatorKey,
      'task_workscope_id': taskWorkscopeId,
      'task_workscope_key': taskWorkscopeKey,
      'equipment_id': equipmentId,
      'equipment_key': equipmentKey,
      'certificate_indicator_id': certificateIndicatorId,
      'measure': measure,
      'comment': comment,
      'inspection_date': inspectionDate?.toIso8601String(),
      'indicator_status': indicatorStatus,
      'inspection_by': inspectionBy,
      'status': status,
      'is_deleted': isDeleted,
      'sync_date': syncDate.toIso8601String(),
    };
  }

  factory TaskWorkscopeCertIndicatorModel.fromJson(Map<String, dynamic> json) {
    return TaskWorkscopeCertIndicatorModel(
      id: json['task_workscope_cert_indicator_id'],
      taskWorkscopeCertIndicatorKey:
          json['task_workscope_cert_indicator_key'] ?? '',
      taskWorkscopeId: json['task_workscope_id'] ?? 0,
      taskWorkscopeKey: json['task_workscope_key'] ?? '',
      equipmentId: json['equipment_id'] ?? 0,
      equipmentKey: json['equipment_key'] ?? '',
      certificateIndicatorId: json['certificate_indicator_id'] ?? 0,
      measure: (json['measure'] is num) ? json['measure'].toDouble() : 0.0,
      comment: json['comment'] ?? '',
      inspectionDate: json['inspection_date'] != null
          ? DateTime.parse(json['inspection_date'])
          : null,
      indicatorStatus: json['indicator_status'] ?? 0,
      inspectionBy: json['inspection_by'] ?? '',
      status: json['status'] ?? 0,
      isDeleted: json['is_deleted'] ?? 0,
      syncDate:
          DateTime.parse(json['sync_date'] ?? DateTime.now().toIso8601String()),
    );
  }
}
