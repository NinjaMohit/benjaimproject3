class TaskSummaryDocModel {
  int? taskSummaryDocId;
  String taskSummaryDocKey;
  int taskSummaryId;
  String taskSummaryKey;
  String docTitle;
  String docName;
  int status;
  int verification;
  DateTime syncDate;

  TaskSummaryDocModel({
    this.taskSummaryDocId,
    required this.taskSummaryDocKey,
    required this.taskSummaryId,
    required this.taskSummaryKey,
    required this.docTitle,
    required this.docName,
    required this.status,
    this.verification = 0, // Default value as specified in the SQL
    required this.syncDate,
  });

  // Convert the model to a JSON map for SQLite insertion
  Map<String, dynamic> toJson() {
    return {
      'task_summary_doc_id': taskSummaryDocId,
      'task_summary_doc_key': taskSummaryDocKey,
      'task_summary_id': taskSummaryId,
      'task_summary_key': taskSummaryKey,
      'doc_title': docTitle,
      'doc_name': docName,
      'status': status,
      'verification': verification,
      'sync_date': syncDate.toIso8601String(),
    };
  }

  // Create the model from a JSON map (typically used when fetching from SQLite)
  factory TaskSummaryDocModel.fromJson(Map<String, dynamic> json) {
    return TaskSummaryDocModel(
      taskSummaryDocId: json['task_summary_doc_id'],
      taskSummaryDocKey:
          json['task_summary_doc_key'] ?? '', // Default empty string if null
      taskSummaryId: json['task_summary_id'] ?? 0, // Default to 0 if null
      taskSummaryKey:
          json['task_summary_key'] ?? '', // Default empty string if null
      docTitle: json['doc_title'] ?? '', // Default empty string if null
      docName: json['doc_name'] ?? '', // Default empty string if null
      status: json['status'] ?? 0, // Default to 0 if null
      verification: json['verification'] ?? 0, // Default to 0 if null
      syncDate: DateTime.parse(json['sync_date'] ??
          DateTime.now().toIso8601String()), // Handle null date
    );
  }
}
