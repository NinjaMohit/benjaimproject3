class TaskExpiredNotificationModel {
  int? expireNotificationId;
  String expireNotificationKey;
  int taskId;
  String taskKey;
  String expireNotificationMsg;
  int expireDays;
  String expireAssigneUserId;
  String notificationDate;
  int createdBy;
  DateTime createdOn;
  int updatedBy;
  DateTime updatedOn;
  int status;
  DateTime syncDate;

  TaskExpiredNotificationModel({
    this.expireNotificationId,
    required this.expireNotificationKey,
    required this.taskId,
    required this.taskKey,
    required this.expireNotificationMsg,
    required this.expireDays,
    required this.expireAssigneUserId,
    required this.notificationDate,
    required this.createdBy,
    required this.createdOn,
    required this.updatedBy,
    required this.updatedOn,
    this.status = 1, // Default value
    required this.syncDate,
  });

  // Convert a TaskExpiredNotificationModel object into a Map object
  Map<String, dynamic> toJson() {
    return {
      'expire_notification_id': expireNotificationId,
      'expire_notification_key': expireNotificationKey,
      'task_id': taskId,
      'task_key': taskKey,
      'expire_notification_msg': expireNotificationMsg,
      'expire_days': expireDays,
      'expire_assigne_user_id': expireAssigneUserId,
      'notification_date': notificationDate,
      'created_by': createdBy,
      'created_on': createdOn.toIso8601String(),
      'updated_by': updatedBy,
      'updated_on': updatedOn.toIso8601String(),
      'status': status,
      'sync_date': syncDate.toIso8601String(),
    };
  }

  factory TaskExpiredNotificationModel.fromJson(Map<String, dynamic> json) {
    return TaskExpiredNotificationModel(
      expireNotificationId: json['expire_notification_id'] as int?,
      expireNotificationKey: json['expire_notification_key'] ??
          '', // Default to empty string if null
      taskId: json['task_id'] as int? ?? 0, // Default to 0 if null
      taskKey: json['task_key'] ?? '', // Default to empty string if null
      expireNotificationMsg: json['expire_notification_msg'] ??
          '', // Default to empty string if null
      expireDays: json['expire_days'] as int? ?? 0, // Default to 0 if null
      expireAssigneUserId: json['expire_assigne_user_id'] ??
          '', // Default to empty string if null
      notificationDate:
          json['notification_date'] ?? '', // Default to empty string if null
      createdBy: json['created_by'] as int? ?? 0, // Default to 0 if null
      createdOn: DateTime.parse(json['created_on'] ??
          DateTime.now().toIso8601String()), // Default to current date if null
      updatedBy: json['updated_by'] as int? ?? 0, // Default to 0 if null
      updatedOn: DateTime.parse(json['updated_on'] ??
          DateTime.now().toIso8601String()), // Default to current date if null
      status: json['status'] as int? ?? 1, // Default to 1 if null
      syncDate: DateTime.parse(json['sync_date'] ??
          DateTime.now().toIso8601String()), // Default to current date if null
    );
  }
}
