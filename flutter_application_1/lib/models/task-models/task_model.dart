class TaskModel {
  final int? taskId; // Primary key
  final String title;
  final String taskKey;
  final String startDate;
  final String startInspectionDate;
  final String? startInspectionDateOnApp;
  final String taskInspectionKey;
  final int location;
  final int isReoccuring;
  final int systemTask;
  final String systemEmailUsers;
  final int assignedTo;
  final String taskDaysHours;
  final String? lastDays;
  final String? nextDays;
  final String validDays;
  final double remainingDays;
  final double lastHours;
  final double remainingHours;
  final double currentHours;
  final double validHours;
  final String? comments;
  final int status;
  final int lastStatusBeforeExpiring;
  final int taskStatus;
  final int overdue;
  final String? completeDate;
  final double hoursOnCompletion;
  final double nextCompletionHrs;
  final int isApproved;
  final String completedBy;
  final int allCertStatus;
  final int exWorkscope;
  final String? exzoneWorkscope;
  final int dropsWorkscope;
  final int tubularWorkscope;
  final String dropzoneWorkscope;
  final int taskType;
  final int critical;
  final int taskEndFlag;
  final int inspectionType;
  final String? pic;
  final String? picNo;
  final String? ptwNumber;
  final String? summaryInspectionComment;
  final String? summaryInspectorSignature;
  final String? summaryInspectorName;
  final String? summaryApprovalName;
  final String? summaryApprovalSignature;
  final String? cityAddress;
  final String? gps;
  final String? standardRef;
  final String defaultWorkscopeSort;
  final int isHold;
  final int workscopeIsAvailable;
  final int totalMajorCert;
  final String? templateId;
  final String? templatePositions;
  final int totalIntermediateCert;
  final int adminWillTaskOut;
  final int workscopeIsAvailableBk;
  final int createdBy;
  final String? createdOn;
  final int updatedBy;
  final String updatedOn;
  final String syncDate;

  TaskModel({
    this.taskId,
    required this.title,
    required this.taskKey,
    required this.startDate,
    required this.startInspectionDate,
    this.startInspectionDateOnApp,
    required this.taskInspectionKey,
    required this.location,
    required this.isReoccuring,
    required this.systemTask,
    required this.systemEmailUsers,
    required this.assignedTo,
    this.taskDaysHours = 'd',
    this.lastDays,
    this.nextDays,
    required this.validDays,
    required this.remainingDays,
    this.lastHours = 0,
    this.remainingHours = 0,
    this.currentHours = 0,
    this.validHours = 0,
    this.comments,
    this.status = 1,
    this.lastStatusBeforeExpiring = 1,
    this.taskStatus = 1,
    required this.overdue,
    this.completeDate,
    required this.hoursOnCompletion,
    this.nextCompletionHrs = 0,
    required this.isApproved,
    required this.completedBy,
    required this.allCertStatus,
    required this.exWorkscope,
    this.exzoneWorkscope,
    required this.dropsWorkscope,
    this.tubularWorkscope = 0,
    required this.dropzoneWorkscope,
    this.taskType = 1,
    this.critical = 0,
    this.taskEndFlag = 0,
    this.inspectionType = 1,
    this.pic,
    this.picNo,
    this.ptwNumber,
    this.summaryInspectionComment,
    this.summaryInspectorSignature,
    this.summaryInspectorName,
    this.summaryApprovalName,
    this.summaryApprovalSignature,
    this.cityAddress,
    this.gps,
    this.standardRef,
    this.defaultWorkscopeSort = 'serial',
    this.isHold = 0,
    this.workscopeIsAvailable = 0,
    this.totalMajorCert = 0,
    this.templateId,
    this.templatePositions,
    this.totalIntermediateCert = 0,
    this.adminWillTaskOut = 0,
    required this.workscopeIsAvailableBk,
    required this.createdBy,
    this.createdOn,
    required this.updatedBy,
    required this.updatedOn,
    required this.syncDate,
  });

  // Convert model to JSON for insertion into SQLite
  Map<String, dynamic> toJson() {
    return {
      'task_id': taskId,
      'title': title,
      'task_key': taskKey,
      'start_date': startDate,
      'start_inspection_date': startInspectionDate,
      'start_inspection_date_on_app': startInspectionDateOnApp,
      'task_inspection_key': taskInspectionKey,
      'location': location,
      'is_reoccuring': isReoccuring,
      'system_task': systemTask,
      'system_email_users': systemEmailUsers,
      'assigned_to': assignedTo,
      'task_days_hours': taskDaysHours,
      'last_days': lastDays,
      'next_days': nextDays,
      'valid_days': validDays,
      'remaining_days': remainingDays,
      'last_hours': lastHours,
      'remaining_hours': remainingHours,
      'current_hours': currentHours,
      'valid_hours': validHours,
      'comments': comments,
      'status': status,
      'last_status_before_expiring': lastStatusBeforeExpiring,
      'task_status': taskStatus,
      'overdue': overdue,
      'complete_date': completeDate,
      'hours_on_completion': hoursOnCompletion,
      'next_completion_hrs': nextCompletionHrs,
      'is_approved': isApproved,
      'completed_by': completedBy,
      'all_cert_status': allCertStatus,
      'ex_workscope': exWorkscope,
      'exzone_workscope': exzoneWorkscope,
      'drops_workscope': dropsWorkscope,
      'tubular_workscope': tubularWorkscope,
      'dropzone_workscope': dropzoneWorkscope,
      'task_type': taskType,
      'critical': critical,
      'task_end_flag': taskEndFlag,
      'inspection_type': inspectionType,
      'PIC': pic,
      'PIC_no': picNo,
      'PTW_number': ptwNumber,
      'summary_inspection_comment': summaryInspectionComment,
      'summary_inspector_signature': summaryInspectorSignature,
      'summary_inspector_name': summaryInspectorName,
      'summary_approval_name': summaryApprovalName,
      'summary_approval_signature': summaryApprovalSignature,
      'city_address': cityAddress,
      'gps': gps,
      'standard_ref': standardRef,
      'default_workscope_sort': defaultWorkscopeSort,
      'is_hold': isHold,
      'workscope_is_available': workscopeIsAvailable,
      'total_major_cert': totalMajorCert,
      'template_id': templateId,
      'template_positions': templatePositions,
      'total_intermediate_cert': totalIntermediateCert,
      'admin_will_task_out': adminWillTaskOut,
      'workscope_is_available_bk': workscopeIsAvailableBk,
      'created_by': createdBy,
      'created_on': createdOn,
      'updated_by': updatedBy,
      'updated_on': updatedOn,
      'sync_date': syncDate,
    };
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      taskId: json['task_id'] as int?,
      title: json['title'] as String,
      taskKey: json['task_key'] as String,
      startDate: json['start_date'] as String,
      startInspectionDate: json['start_inspection_date'] as String,
      startInspectionDateOnApp: json['start_inspection_date_on_app'] as String?,
      taskInspectionKey: json['task_inspection_key'] as String,
      location: json['location'] as int,
      isReoccuring: json['is_reoccuring'] as int,
      systemTask: json['system_task'] as int,
      systemEmailUsers: json['system_email_users'] as String,
      assignedTo: json['assigned_to'] as int,
      taskDaysHours: json['task_days_hours'] as String,
      lastDays: json['last_days'] as String?,
      nextDays: json['next_days'] as String?,
      validDays: json['valid_days'] as String,
      remainingDays: (json['remaining_days'] as num).toDouble(),
      lastHours: (json['last_hours'] as num).toDouble(),
      remainingHours: (json['remaining_hours'] as num).toDouble(),
      currentHours: (json['current_hours'] as num).toDouble(),
      validHours: (json['valid_hours'] as num).toDouble(),
      comments: json['comments'] as String?,
      status: json['status'] as int,
      lastStatusBeforeExpiring: json['last_status_before_expiring'] as int,
      taskStatus: json['task_status'] as int,
      overdue: json['overdue'] as int,
      completeDate: json['complete_date'] as String?,
      hoursOnCompletion: (json['hours_on_completion'] as num).toDouble(),
      nextCompletionHrs: (json['next_completion_hrs'] as num).toDouble(),
      isApproved: json['is_approved'] as int,
      completedBy: json['completed_by'] as String,
      allCertStatus: json['all_cert_status'] as int,
      exWorkscope: json['ex_workscope'] as int,
      exzoneWorkscope: json['exzone_workscope'] as String?,
      dropsWorkscope: json['drops_workscope'] as int,
      tubularWorkscope: json['tubular_workscope'] as int,
      dropzoneWorkscope: json['dropzone_workscope'] as String,
      taskType: json['task_type'] as int,
      critical: json['critical'] as int,
      taskEndFlag: json['task_end_flag'] as int,
      inspectionType: json['inspection_type'] as int,
      pic: json['PIC'] as String?,
      picNo: json['PIC_no'] as String?,
      ptwNumber: json['PTW_number'] as String?,
      summaryInspectionComment: json['summary_inspection_comment'] as String?,
      summaryInspectorSignature: json['summary_inspector_signature'] as String?,
      summaryInspectorName: json['summary_inspector_name'] as String?,
      summaryApprovalName: json['summary_approval_name'] as String?,
      summaryApprovalSignature: json['summary_approval_signature'] as String?,
      cityAddress: json['city_address'] as String?,
      gps: json['gps'] as String?,
      standardRef: json['standard_ref'] as String?,
      defaultWorkscopeSort: json['default_workscope_sort'] as String,
      isHold: json['is_hold'] as int,
      workscopeIsAvailable: json['workscope_is_available'] as int,
      totalMajorCert: json['total_major_cert'] as int,
      templateId: json['template_id'] as String?,
      templatePositions: json['template_positions'] as String?,
      totalIntermediateCert: json['total_intermediate_cert'] as int,
      adminWillTaskOut: json['admin_will_task_out'] as int,
      workscopeIsAvailableBk: json['workscope_is_available_bk'] as int,
      createdBy: json['created_by'] as int,
      createdOn: json['created_on'] as String?,
      updatedBy: json['updated_by'] as int,
      updatedOn: json['updated_on'] as String,
      syncDate: json['sync_date'] as String,
    );
  }
}
