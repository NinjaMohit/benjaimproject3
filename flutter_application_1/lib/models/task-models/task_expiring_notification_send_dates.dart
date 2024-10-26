class TaskExpiringNotificationSendDateModel {
  int? id;
  String taskExpiringNotificationSendDatesKey;
  int taskId;
  String taskKey;
  String notificationDate;
  String notificationEnddate;
  int expiringNotificationDayOption;
  int status;
  DateTime syncDate;

  TaskExpiringNotificationSendDateModel({
    this.id,
    required this.taskExpiringNotificationSendDatesKey,
    required this.taskId,
    required this.taskKey,
    required this.notificationDate,
    required this.notificationEnddate,
    required this.expiringNotificationDayOption,
    this.status = 0, // Default value
    required this.syncDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'task_expiring_notification_send_dates_key':
          taskExpiringNotificationSendDatesKey,
      'task_id': taskId,
      'task_key': taskKey,
      'notification_date': notificationDate,
      'notification_enddate': notificationEnddate,
      'expiring_notification_day_option': expiringNotificationDayOption,
      'status': status,
      'sync_date': syncDate.toIso8601String(),
    };
  }

  factory TaskExpiringNotificationSendDateModel.fromJson(
      Map<String, dynamic> json) {
    return TaskExpiringNotificationSendDateModel(
      id: json['id'] as int?,
      taskExpiringNotificationSendDatesKey:
          json['task_expiring_notification_send_dates_key'] ?? '',
      taskId: json['task_id'] ?? 0,
      taskKey: json['task_key'] ?? '',
      notificationDate: json['notification_date'] ?? '',
      notificationEnddate: json['notification_enddate'] ?? '',
      expiringNotificationDayOption:
          json['expiring_notification_day_option'] ?? 0,
      status: json['status'] ?? 0,
      syncDate: DateTime.parse(json['sync_date']),
    );
  }
}
