class TaskWorkscopeItemInspectionModel {
  int? id;
  String inspectionKey;
  int taskWorkscopeId;
  String taskWorkscopeKey;
  DateTime? inspectionDate;
  int inspectionStatus;
  int indicatorStatus;
  String comment;
  String inspectionBy;
  String inspectionarSignature;
  int isPublished;
  int isDeleted;
  DateTime syncDate;

  TaskWorkscopeItemInspectionModel({
    this.id,
    required this.inspectionKey,
    required this.taskWorkscopeId,
    required this.taskWorkscopeKey,
    this.inspectionDate,
    required this.inspectionStatus,
    required this.indicatorStatus,
    required this.comment,
    required this.inspectionBy,
    required this.inspectionarSignature,
    required this.isPublished,
    required this.isDeleted,
    required this.syncDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'task_workscope_item_inspection_id': id,
      'task_workscope_item_inspection_key': inspectionKey,
      'task_workscope_id': taskWorkscopeId,
      'task_workscope_key': taskWorkscopeKey,
      'inspection_date': inspectionDate?.toIso8601String(),
      'inspection_status': inspectionStatus,
      'indicator_status': indicatorStatus,
      'comment': comment,
      'inspection_by': inspectionBy,
      'inspectionar_signature': inspectionarSignature,
      'is_published': isPublished,
      'is_deleted': isDeleted,
      'sync_date': syncDate.toIso8601String(),
    };
  }

  factory TaskWorkscopeItemInspectionModel.fromJson(Map<String, dynamic> json) {
    return TaskWorkscopeItemInspectionModel(
      id: json['task_workscope_item_inspection_id'],
      inspectionKey: json['task_workscope_item_inspection_key'] ?? '',
      taskWorkscopeId: json['task_workscope_id'] ?? 0,
      taskWorkscopeKey: json['task_workscope_key'] ?? '',
      inspectionDate: json['inspection_date'] != null
          ? DateTime.parse(json['inspection_date'])
          : null,
      inspectionStatus: json['inspection_status'] ?? 0,
      indicatorStatus: json['indicator_status'] ?? 0,
      comment: json['comment'] ?? '',
      inspectionBy: json['inspection_by'] ?? '',
      inspectionarSignature: json['inspectionar_signature'] ?? '',
      isPublished: json['is_published'] ?? 0,
      isDeleted: json['is_deleted'] ?? 0,
      syncDate: DateTime.parse(json['sync_date']),
    );
  }
}
