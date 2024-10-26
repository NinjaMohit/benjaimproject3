class TaskSummaryStatusModel {
  int? taskSummaryId;
  String taskSummaryKey;
  String taskInspectionKey;
  DateTime completeDate;
  String completedBy;
  int reportedUserSignature;
  int userNoOfSignature;
  DateTime? nextDays;
  DateTime? lastDays;
  int taskStatus;
  int taskId;
  String taskKey;
  int totalItem;
  int pass;
  int fail;
  int notFound;
  int noAccess;
  int correctiveAction;
  int corrective;
  int assignedTo;
  int critical;
  double overdueDays;
  double overdueHours;
  int status;
  int validDays;
  DateTime summaryDate;
  String? inspectionComment;
  String? inspectorSignature;
  String? inspectorName;
  String? approvalName;
  String? approvalSignature;
  String? pic;
  String? picNo;
  String? ptwNumber;
  int taskInspectionType;
  double hoursOnCompletion;
  double nextCompletionHrs;
  int location;
  String? standardRef;
  int verification;
  DateTime syncDate;

  TaskSummaryStatusModel({
    this.taskSummaryId,
    required this.taskSummaryKey,
    required this.taskInspectionKey,
    required this.completeDate,
    required this.completedBy,
    this.reportedUserSignature = 0,
    this.userNoOfSignature = 0,
    this.nextDays,
    this.lastDays,
    required this.taskStatus,
    required this.taskId,
    required this.taskKey,
    required this.totalItem,
    required this.pass,
    required this.fail,
    required this.notFound,
    required this.noAccess,
    this.correctiveAction = 0,
    this.corrective = 0,
    this.assignedTo = 0,
    this.critical = 0,
    this.overdueDays = 0.0,
    this.overdueHours = 0.0,
    required this.status,
    this.validDays = 0,
    required this.summaryDate,
    this.inspectionComment,
    this.inspectorSignature,
    this.inspectorName,
    this.approvalName,
    this.approvalSignature,
    this.pic,
    this.picNo,
    this.ptwNumber,
    this.taskInspectionType = 1,
    this.hoursOnCompletion = 0.0,
    this.nextCompletionHrs = 0.0,
    this.location = 0,
    this.standardRef,
    this.verification = 3,
    required this.syncDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'task_summary_id': taskSummaryId,
      'task_summary_key': taskSummaryKey,
      'task_inspection_key': taskInspectionKey,
      'complete_date': completeDate.toIso8601String(),
      'completed_by': completedBy,
      'reported_user_signature': reportedUserSignature,
      'user_no_of_signature': userNoOfSignature,
      'next_days': nextDays?.toIso8601String(),
      'last_days': lastDays?.toIso8601String(),
      'task_status': taskStatus,
      'task_id': taskId,
      'task_key': taskKey,
      'total_item': totalItem,
      'pass': pass,
      'fail': fail,
      'not_found': notFound,
      'no_access': noAccess,
      'corrective_action': correctiveAction,
      'corrective': corrective,
      'assigned_to': assignedTo,
      'critical': critical,
      'overdue_days': overdueDays,
      'overdue_hours': overdueHours,
      'status': status,
      'valid_days': validDays,
      'summary_date': summaryDate.toIso8601String(),
      'inspection_comment': inspectionComment,
      'inspector_signature': inspectorSignature,
      'inspector_name': inspectorName,
      'approval_name': approvalName,
      'approval_signature': approvalSignature,
      'PIC': pic,
      'PIC_no': picNo,
      'PTW_number': ptwNumber,
      'task_inspection_type': taskInspectionType,
      'hours_on_completion': hoursOnCompletion,
      'next_completion_hrs': nextCompletionHrs,
      'location': location,
      'standard_ref': standardRef,
      'verification': verification,
      'sync_date': syncDate.toIso8601String(),
    };
  }

  factory TaskSummaryStatusModel.fromJson(Map<String, dynamic> json) {
    return TaskSummaryStatusModel(
      taskSummaryId: json['task_summary_id'],
      taskSummaryKey: json['task_summary_key'],
      taskInspectionKey: json['task_inspection_key'],
      completeDate: DateTime.parse(json['complete_date']),
      completedBy: json['completed_by'],
      reportedUserSignature: json['reported_user_signature'] ?? 0,
      userNoOfSignature: json['user_no_of_signature'] ?? 0,
      nextDays:
          json['next_days'] != null ? DateTime.parse(json['next_days']) : null,
      lastDays:
          json['last_days'] != null ? DateTime.parse(json['last_days']) : null,
      taskStatus: json['task_status'],
      taskId: json['task_id'],
      taskKey: json['task_key'],
      totalItem: json['total_item'],
      pass: json['pass'],
      fail: json['fail'],
      notFound: json['not_found'],
      noAccess: json['no_access'],
      correctiveAction: json['corrective_action'] ?? 0,
      corrective: json['corrective'] ?? 0,
      assignedTo: json['assigned_to'] ?? 0,
      critical: json['critical'] ?? 0,
      overdueDays: (json['overdue_days'] as num?)?.toDouble() ?? 0.0,
      overdueHours: (json['overdue_hours'] as num?)?.toDouble() ?? 0.0,
      status: json['status'],
      validDays: json['valid_days'] ?? 0,
      summaryDate: DateTime.parse(json['summary_date']),
      inspectionComment: json['inspection_comment'],
      inspectorSignature: json['inspector_signature'],
      inspectorName: json['inspector_name'],
      approvalName: json['approval_name'],
      approvalSignature: json['approval_signature'],
      pic: json['PIC'],
      picNo: json['PIC_no'],
      ptwNumber: json['PTW_number'],
      taskInspectionType: json['task_inspection_type'] ?? 1,
      hoursOnCompletion:
          (json['hours_on_completion'] as num?)?.toDouble() ?? 0.0,
      nextCompletionHrs:
          (json['next_completion_hrs'] as num?)?.toDouble() ?? 0.0,
      location: json['location'] ?? 0,
      standardRef: json['standard_ref'],
      verification: json['verification'] ?? 3,
      syncDate: DateTime.parse(json['sync_date']),
    );
  }
}
