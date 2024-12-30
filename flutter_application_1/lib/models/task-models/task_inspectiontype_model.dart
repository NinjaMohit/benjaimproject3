class TaskInspectionTypeModel {
  int? idNo;
  final int? inspectionId; // Corresponds to `inspection_id` in API JSON
  final String inspectionTitle; // Corresponds to `inspection_title` in API JSON
  final String?
      inspectionTypeImage; // Nullable, from `inspection_type_image` in API JSON
  final int status; // Status field from API JSON
  final String? createdAt; // Nullable, from `created_at` in API JSON

  TaskInspectionTypeModel({
    this.idNo,
    this.inspectionId,
    required this.inspectionTitle,
    this.inspectionTypeImage,
    required this.status,
    this.createdAt,
  });

  // Convert to JSON, excluding `idNo` if null
  Map<String, dynamic> toJson() {
    return {
      'inspection_Id': inspectionId,
      'inspection_title': inspectionTitle,
      'inspection_type_image': inspectionTypeImage,
      'status': status,
      'created_at': createdAt,
    };
  }

  // Convert from JSON to a model instance
  factory TaskInspectionTypeModel.fromJson(Map<String, dynamic> json) {
    return TaskInspectionTypeModel(
      idNo: json['idNo'],
      inspectionId: json['inspection_id'],
      inspectionTitle: json['inspection_title'],
      inspectionTypeImage: json['inspection_type_image'],
      status: json['status'] ?? 0,
      createdAt: json['created_at'],
    );
  }
}
