class TaskNotificationsModel {
  int? id;
  String notificationKey;
  int taskId;
  String taskKey;
  int expireNotificationId;
  String notification;
  String type;
  DateTime notificationDate;
  int userId;
  int read;
  String forwardTo;
  String assignedTo;
  int updatedBy;
  DateTime updatedOn;
  int status;
  DateTime syncDate;

  TaskNotificationsModel({
    this.id,
    required this.notificationKey,
    required this.taskId,
    required this.taskKey,
    required this.expireNotificationId,
    required this.notification,
    required this.type,
    required this.notificationDate,
    required this.userId,
    required this.read,
    required this.forwardTo,
    required this.assignedTo,
    required this.updatedBy,
    required this.updatedOn,
    required this.status,
    required this.syncDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'notification_key': notificationKey,
      'task_id': taskId,
      'task_key': taskKey,
      'expire_notification_id': expireNotificationId,
      'notification': notification,
      'type': type,
      'notification_date': notificationDate.toIso8601String(),
      'user_id': userId,
      'read': read,
      'forward_to': forwardTo,
      'assigned_to': assignedTo,
      'updated_by': updatedBy,
      'updated_on': updatedOn.toIso8601String(),
      'status': status,
      'sync_date': syncDate.toIso8601String(),
    };
  }

  factory TaskNotificationsModel.fromJson(Map<String, dynamic> json) {
    return TaskNotificationsModel(
      id: json['id'],
      notificationKey: json['notification_key'] ?? '', // Handle potential null
      taskId: json['task_id'] ?? 0, // Default to 0 if null
      taskKey: json['task_key'] ?? '', // Default to empty string
      expireNotificationId: json['expire_notification_id'] ?? 0, // Default to 0
      notification: json['notification'] ?? '', // Default to empty string
      type: json['type'] ?? '', // Default to empty string
      notificationDate: DateTime.parse(json['notification_date'] ??
          DateTime.now().toIso8601String()), // Handle null date
      userId: json['user_id'] ?? 0, // Default to 0
      read: json['read'] ?? 0, // Default to 0
      forwardTo: json['forward_to'] ?? '', // Default to empty string
      assignedTo: json['assigned_to'] ?? '', // Default to empty string
      updatedBy: json['updated_by'] ?? 0, // Default to 0
      updatedOn: DateTime.parse(json['updated_on'] ??
          DateTime.now().toIso8601String()), // Handle null date
      status: json['status'] ?? 0, // Default to 0
      syncDate: DateTime.parse(json['sync_date'] ??
          DateTime.now().toIso8601String()), // Handle null date
    );
  }
}
