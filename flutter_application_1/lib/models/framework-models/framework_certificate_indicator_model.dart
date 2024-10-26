class FrameworkCertIndicatorModel {
  int? id;
  int frameworkCertificateId;
  String indicatorUniqueId;
  int? sort;
  String title;
  String? minOld;
  double min;
  double max;
  String? maxOld;
  int setLimit;
  int isFh;
  String? caTitle;
  int createdBy;
  String? createdOn;
  int updatedBy;
  String? updatedOn;
  int status;
  String syncDate;

  FrameworkCertIndicatorModel({
    this.id,
    required this.frameworkCertificateId,
    required this.indicatorUniqueId,
    this.sort,
    required this.title,
    this.minOld,
    required this.min,
    required this.max,
    this.maxOld,
    required this.setLimit,
    required this.isFh,
    this.caTitle,
    required this.createdBy,
    this.createdOn,
    required this.updatedBy,
    this.updatedOn,
    required this.status,
    required this.syncDate,
  });

  // Convert a FrameworkCertIndicatorModel to a Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'framework_certificate_id': frameworkCertificateId,
      'indicator_unique_id': indicatorUniqueId,
      'sort': sort,
      'title': title,
      'min_old': minOld,
      'min': min,
      'max': max,
      'max_old': maxOld,
      'set_limit': setLimit,
      'is_fh': isFh,
      'ca_title': caTitle,
      'created_by': createdBy,
      'created_on': createdOn,
      'updated_by': updatedBy,
      'updated_on': updatedOn,
      'status': status,
      'sync_date': syncDate,
    };
  }

  factory FrameworkCertIndicatorModel.fromJson(Map<String, dynamic> json) {
    return FrameworkCertIndicatorModel(
      id: json['id'],
      frameworkCertificateId: json['framework_certificate_id'],
      indicatorUniqueId: json['indicator_unique_id'],
      sort: json['sort'],
      title: json['title'],
      minOld: json['min_old'],

      // Convert 'min' to double safely
      min: (json['min'] is int) ? (json['min'] as int).toDouble() : json['min'],

      // Convert 'max' to double safely
      max: (json['max'] is int) ? (json['max'] as int).toDouble() : json['max'],

      maxOld: json['max_old'],
      setLimit: json['set_limit'],
      isFh: json['is_fh'],
      caTitle: json['ca_title'],
      createdBy: json['created_by'],
      createdOn: json['created_on'],
      updatedBy: json['updated_by'],
      updatedOn: json['updated_on'],
      status: json['status'],
      syncDate: json['sync_date'],
    );
  }
}
