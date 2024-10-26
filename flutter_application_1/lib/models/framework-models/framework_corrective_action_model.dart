class FrameworkCorrectiveActionModel {
  int? correctiveActionId; // Nullable since it may not be present initially
  final int parentId; // Parent ID is required
  final String title; // Title is required
  final String caCode; // Corrective action code is required
  final int caClass; // Class of corrective action is required
  String? caType; // Type of corrective action can be null
  String? standardRef; // Standard reference can be null
  String? suggestedRemedial; // Suggested remedial action can be null
  int? closeOutDuration; // Close out duration can be null
  String? notes; // Notes can be null
  final int caStatus; // Status of the corrective action is required
  final int createdBy; // ID of user who created the action is required
  final String createdOn; // Creation timestamp is required
  final int updatedBy; // ID of user who updated the action is required
  final String updatedOn; // Last updated timestamp is required
  final String syncDate; // Synchronization date is required

  // Constructor with required parameters and optional ones
  FrameworkCorrectiveActionModel({
    this.correctiveActionId,
    required this.parentId,
    required this.title,
    required this.caCode,
    required this.caClass,
    this.caType,
    this.standardRef,
    this.suggestedRemedial,
    this.closeOutDuration,
    this.notes,
    required this.caStatus,
    required this.createdBy,
    required this.createdOn,
    required this.updatedBy,
    required this.updatedOn,
    required this.syncDate,
  });

  // Convert a FrameworkCorrectiveActionModel into a Map (for inserting into the database)
  Map<String, dynamic> toJson() {
    return {
      'corrective_action_id': correctiveActionId,
      'parent_id': parentId,
      'title': title,
      'ca_code': caCode,
      'ca_class': caClass,
      'ca_type': caType,
      'standard_ref': standardRef,
      'suggested_remedial': suggestedRemedial,
      'close_out_duration': closeOutDuration,
      'notes': notes,
      'ca_status': caStatus,
      'created_by': createdBy,
      'created_on': createdOn,
      'updated_by': updatedBy,
      'updated_on': updatedOn,
      'sync_date': syncDate,
    };
  }

  // Convert a Map into a FrameworkCorrectiveActionModel (for retrieving from the database)
  factory FrameworkCorrectiveActionModel.fromJson(Map<String, dynamic> json) {
    return FrameworkCorrectiveActionModel(
      correctiveActionId: json['corrective_action_id'],
      parentId: json['parent_id'] ?? 0, // Provide default value
      title: json['title'] ?? 'Unknown Title', // Default to avoid null
      caCode: json['ca_code'] ?? 'Unknown Code', // Default to avoid null
      caClass: json['ca_class'] ?? 0, // Default value
      caType: json['ca_type'],
      standardRef: json['standard_ref'],
      suggestedRemedial: json['suggested_remedial'],
      closeOutDuration: json['close_out_duration'],
      notes: json['notes'],
      caStatus: json['ca_status'] ?? 0, // Default value
      createdBy: json['created_by'] ?? 0, // Default value
      createdOn: json['created_on'] ?? '', // Default to empty string
      updatedBy: json['updated_by'] ?? 0, // Default value
      updatedOn: json['updated_on'] ?? '', // Default to empty string
      syncDate: json['sync_date'] ?? '', // Default to empty string
    );
  }
}
