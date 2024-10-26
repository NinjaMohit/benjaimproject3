class FrameworkCertModel {
  int? id; // Nullable because it is auto-incremented
  String certUniqueId;
  String certGroup;
  int certType;
  String sort;
  int competence;
  String title;
  int certStatus;
  int validDayTick;
  int notuseValidDay;
  int notuseValidHour;
  int validHourTick;
  int isCos;
  int isMajorCos;
  int isIntermediateCos;
  String certificateFormat;
  String comments;
  int parentId;
  int createdBy;
  String createdOn; // Made non-nullable
  int updatedBy;
  String? updatedOn; // Nullable if you want to allow it to be null
  int published;
  String syncDate;

  FrameworkCertModel({
    this.id,
    required this.certUniqueId,
    required this.certGroup,
    required this.certType,
    required this.sort,
    this.competence = 0, // Default value
    required this.title,
    required this.certStatus,
    required this.validDayTick,
    this.notuseValidDay = 0, // Default value
    required this.notuseValidHour,
    required this.validHourTick,
    this.isCos = 0, // Default value
    this.isMajorCos = 0, // Default value
    this.isIntermediateCos = 0, // Default value
    required this.certificateFormat,
    required this.comments,
    required this.parentId,
    required this.createdBy,
    String? createdOn, // Accept as nullable in the constructor
    required this.updatedBy,
    this.updatedOn,
    required this.published,
    required this.syncDate,
  }) : createdOn = createdOn ??
            DateTime.now().toIso8601String(); // Set current time if null

  // Convert a FrameworkCertModel object into a Map object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cert_unique_id': certUniqueId,
      'cert_group': certGroup,
      'cert_type': certType,
      'sort': sort,
      'competence': competence,
      'title': title,
      'cert_status': certStatus,
      'valid_day_tick': validDayTick,
      'notuse_valid_day': notuseValidDay,
      'notuse_valid_hour': notuseValidHour,
      'valid_hour_tick': validHourTick,
      'is_cos': isCos,
      'is_major_cos': isMajorCos,
      'is_intermediate_cos': isIntermediateCos,
      'certificate_format': certificateFormat,
      'comments': comments,
      'parent_id': parentId,
      'created_by': createdBy,
      'created_on': createdOn, // Ensure it's not null
      'updated_by': updatedBy,
      'updated_on': updatedOn,
      'published': published,
      'sync_date': syncDate,
    };
  }

  factory FrameworkCertModel.fromJson(Map<String, dynamic> json) {
    return FrameworkCertModel(
      id: json['id'],
      certUniqueId: json['cert_unique_id'] ?? '',
      certGroup: json['cert_group'] ?? '',
      certType: json['cert_type'] ?? 0,
      sort: json['sort'] ?? '',
      competence: json['competence'] ?? 0,
      title: json['title'] ?? '',
      certStatus: json['cert_status'] ?? 0,
      validDayTick: json['valid_day_tick'] ?? 0,
      notuseValidDay: json['notuse_valid_day'] ?? 0,
      notuseValidHour: json['notuse_valid_hour'] ?? 0,
      validHourTick: json['valid_hour_tick'] ?? 0,
      isCos: json['is_cos'] ?? 0,
      isMajorCos: json['is_major_cos'] ?? 0,
      isIntermediateCos: json['is_intermediate_cos'] ?? 0,
      certificateFormat: json['certificate_format'] ?? '',
      comments: json['comments'] ?? '',
      parentId: json['parent_id'] ?? 0,
      createdBy: json['created_by'] ?? 0,
      createdOn: json['created_on'] ??
          DateTime.now().toIso8601String(), // Provide a default
      updatedBy: json['updated_by'] ?? 0,
      updatedOn: json['updated_on'],
      published: json['published'] ?? 0,
      syncDate: json['sync_date'] ?? '',
    );
  }
}
