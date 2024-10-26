class FrameworkOrganisationModel {
  int? organisationId; // Nullable because it's auto-incremented
  int parentId;
  String locationKey;
  String title;
  String dropZone;
  String exZone;
  String? rfid; // Nullable
  String? latitude; // Nullable
  String? longitude; // Nullable
  String? hazards; // Nullable
  String? locationNotes; // Nullable
  int confinedSpace;
  int drops;
  int ex;
  String systemEmailUsers;
  int primaryNode;
  String nodeCode;
  int country;
  String city;
  String? gps; // Nullable
  String? pic; // Nullable
  String? picNo; // Nullable
  String? picEmail; // Nullable
  int createdBy;
  String createdOn;
  int updatedBy;
  String? updatedOn; // Nullable with default value in DB
  int status;
  String syncDate;

  FrameworkOrganisationModel({
    this.organisationId, // Nullable
    required this.parentId,
    required this.locationKey,
    required this.title,
    required this.dropZone,
    required this.exZone,
    this.rfid, // Nullable
    this.latitude, // Nullable
    this.longitude, // Nullable
    this.hazards, // Nullable
    this.locationNotes, // Nullable
    required this.confinedSpace,
    required this.drops,
    required this.ex,
    required this.systemEmailUsers,
    required this.primaryNode,
    required this.nodeCode,
    required this.country,
    required this.city,
    this.gps, // Nullable
    this.pic, // Nullable
    this.picNo, // Nullable
    this.picEmail, // Nullable
    required this.createdBy,
    required this.createdOn,
    required this.updatedBy,
    this.updatedOn, // Nullable
    required this.status,
    required this.syncDate,
  });

  // Convert a FrameworkOrganisationModel object into a JSON object
  Map<String, dynamic> toJson() {
    return {
      'organisation_id': organisationId,
      'parent_id': parentId,
      'location_key': locationKey,
      'title': title,
      'drop_zone': dropZone,
      'ex_zone': exZone,
      'rfid': rfid,
      'latitude': latitude,
      'longitude': longitude,
      'hazards': hazards,
      'location_notes': locationNotes,
      'confined_space': confinedSpace,
      'drops': drops,
      'ex': ex,
      'system_email_users': systemEmailUsers,
      'primary_node': primaryNode,
      'node_code': nodeCode,
      'country': country,
      'city': city,
      'gps': gps,
      'pic': pic,
      'pic_no': picNo,
      'pic_email': picEmail,
      'created_by': createdBy,
      'created_on': createdOn,
      'updated_by': updatedBy,
      'updated_on': updatedOn,
      'status': status,
      'sync_date': syncDate,
    };
  }

  // Convert a JSON object into a FrameworkOrganisationModel object
  factory FrameworkOrganisationModel.fromJson(Map<String, dynamic> json) {
    return FrameworkOrganisationModel(
      organisationId: json['organisation_id'],
      parentId: json['parent_id'] ?? 0,
      locationKey: json['location_key'] ?? '',
      title: json['title'] ?? '',
      dropZone: json['drop_zone'] ?? '',
      exZone: json['ex_zone'] ?? '',
      rfid: json['rfid'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      hazards: json['hazards'],
      locationNotes: json['location_notes'],
      confinedSpace: json['confined_space'] ?? 0,
      drops: json['drops'] ?? 0,
      ex: json['ex'] ?? 0,
      systemEmailUsers: json['system_email_users'] ?? '',
      primaryNode: json['primary_node'] ?? 0,
      nodeCode: json['node_code'] ?? '',
      country: json['country'] ?? 0,
      city: json['city'] ?? '',
      gps: json['gps'],
      pic: json['pic'],
      picNo: json['pic_no'],
      picEmail: json['pic_email'],
      createdBy: json['created_by'] ?? 0,
      createdOn: json['created_on'] ?? '',
      updatedBy: json['updated_by'] ?? 0,
      updatedOn: json['updated_on'], // Nullable
      status: json['status'] ?? 0,
      syncDate: json['sync_date'] ?? '',
    );
  }
}
