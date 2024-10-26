class TaskInspectionTypeModel {
  int? inspectionId; // Nullable because it's auto-incremented
  String inspectionTitle;
  String? inspectionTypeImage; // Nullable
  int status;
  String? createdAt; // Nullable, if not always set initially

  TaskInspectionTypeModel({
    this.inspectionId, // Nullable
    required this.inspectionTitle,
    this.inspectionTypeImage, // Nullable
    required this.status,
    this.createdAt, // Nullable
  });

  // Convert a TaskInspectionTypeModel object into a JSON object
  Map<String, dynamic> toJson() {
    return {
      'inspection_id': inspectionId,
      'inspection_title': inspectionTitle,
      'inspection_type_image': inspectionTypeImage,
      'status': status,
      'created_at': createdAt,
    };
  }

  // Convert a JSON object into a TaskInspectionTypeModel object
  factory TaskInspectionTypeModel.fromJson(Map<String, dynamic> json) {
    return TaskInspectionTypeModel(
      inspectionId: json['inspection_id'],
      inspectionTitle: json['inspection_title'] ?? '',
      inspectionTypeImage: json['inspection_type_image'],
      status: json['status'] ?? 0,
      createdAt: json['created_at'], // Nullable
    );
  }
}
