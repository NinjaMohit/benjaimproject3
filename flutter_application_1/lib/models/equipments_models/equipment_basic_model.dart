class EquipmentBasicModel {
  int? id;
  String equipmentKey;
  String rfid;
  int status;
  String serial;
  String equType;
  int frmEquipmentId;
  int location;
  String position;
  String assetNumberSap;
  String linkToAsset;
  String dimension;
  String swlSwp;
  String testLoad;
  String wllMawp;
  String factorOfSafety;
  String model;
  String manufacturer;
  String dateOfManufacturer;
  String weight;
  String gridRef;
  String access;
  double? height; // Nullable
  int nfl;
  int drops;
  int ex;
  int critical;
  int eqgroups;
  int thirdParty;
  int api;
  int engine;
  int hose;
  int asset;
  int audited;
  int capitalEquipment;
  int confinedSpace;
  int currentHrs;
  int oldCurrentHrs;
  String? lastCurrentHrsReadingDate; // Nullable
  int previousCurrentHrs;
  String photo;
  String inServicePoNo;
  String inService; // Use proper date parsing if needed
  String mro;
  String inServiceRemove; // Use proper date parsing if needed
  int inServiceValidDays;
  int inServiceIsUnexpirable;
  String lockId;
  String cocNo;
  int cocVerification;
  String cocIssueDate; // Use proper date parsing if needed
  String cocExpiryDate; // Use proper date parsing if needed
  int cocValidDays;
  int cocIsUnexpirable;
  String comments;
  int connectA;
  int connectB;
  String material;
  double nominalThicknessMm;
  double minimumThicknessMm;
  double currentReadingMm;
  String cocIssuer;
  int parentId;
  String detail;
  String system;
  int isDeleted;
  int createdBy;
  int updatedBy;
  String createdOn; // Use proper date parsing if needed
  String updatedOn; // Use proper date parsing if needed
  String syncDate; // Use proper date parsing if needed

  EquipmentBasicModel({
    this.id,
    required this.equipmentKey,
    required this.rfid,
    required this.status,
    required this.serial,
    required this.equType,
    required this.frmEquipmentId,
    required this.location,
    required this.position,
    required this.assetNumberSap,
    required this.linkToAsset,
    required this.dimension,
    required this.swlSwp,
    required this.testLoad,
    required this.wllMawp,
    required this.factorOfSafety,
    required this.model,
    required this.manufacturer,
    required this.dateOfManufacturer,
    required this.weight,
    required this.gridRef,
    required this.access,
    this.height,
    required this.nfl,
    required this.drops,
    required this.ex,
    required this.critical,
    required this.eqgroups,
    required this.thirdParty,
    required this.api,
    required this.engine,
    required this.hose,
    required this.asset,
    required this.audited,
    required this.capitalEquipment,
    required this.confinedSpace,
    required this.currentHrs,
    required this.oldCurrentHrs,
    this.lastCurrentHrsReadingDate,
    required this.previousCurrentHrs,
    required this.photo,
    required this.inServicePoNo,
    required this.inService,
    required this.mro,
    required this.inServiceRemove,
    required this.inServiceValidDays,
    required this.inServiceIsUnexpirable,
    required this.lockId,
    required this.cocNo,
    required this.cocVerification,
    required this.cocIssueDate,
    required this.cocExpiryDate,
    required this.cocValidDays,
    required this.cocIsUnexpirable,
    required this.comments,
    required this.connectA,
    required this.connectB,
    required this.material,
    required this.nominalThicknessMm,
    required this.minimumThicknessMm,
    required this.currentReadingMm,
    required this.cocIssuer,
    required this.parentId,
    required this.detail,
    required this.system,
    required this.isDeleted,
    required this.createdBy,
    required this.updatedBy,
    required this.createdOn,
    required this.updatedOn,
    required this.syncDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'equipment_key': equipmentKey,
      'rfid': rfid,
      'status': status,
      'serial': serial,
      'equ_type': equType,
      'frm_equipment_id': frmEquipmentId,
      'location': location,
      'position': position,
      'asset_number_sap': assetNumberSap,
      'link_to_asset': linkToAsset,
      'dimension': dimension,
      'swl_swp': swlSwp,
      'test_load': testLoad,
      'wll_mawp': wllMawp,
      'factor_of_safety': factorOfSafety,
      'model': model,
      'manufacturer': manufacturer,
      'date_of_manufacturer': dateOfManufacturer,
      'weight': weight,
      'grid_ref': gridRef,
      'access': access,
      'height': height,
      'nfl': nfl,
      'drops': drops,
      'ex': ex,
      'critical': critical,
      'eqgroups': eqgroups,
      'third_party': thirdParty,
      'api': api,
      'engine': engine,
      'hose': hose,
      'asset': asset,
      'audited': audited,
      'capital_equipment': capitalEquipment,
      'confined_space': confinedSpace,
      'current_hrs': currentHrs,
      'old_current_hrs': oldCurrentHrs,
      'last_current_hrs_reading_date': lastCurrentHrsReadingDate,
      'previous_current_hrs': previousCurrentHrs,
      'photo': photo,
      'in_service_po_no': inServicePoNo,
      'in_service': inService,
      'mro': mro,
      'in_service_remove': inServiceRemove,
      'in_service_valid_days': inServiceValidDays,
      'in_service_is_unexpirable': inServiceIsUnexpirable,
      'lock_id': lockId,
      'coc_no': cocNo,
      'coc_verification': cocVerification,
      'coc_issue_date': cocIssueDate,
      'coc_expiry_date': cocExpiryDate,
      'coc_valid_days': cocValidDays,
      'coc_is_unexpirable': cocIsUnexpirable,
      'comments': comments,
      'connect_a': connectA,
      'connect_b': connectB,
      'material': material,
      'nominal_thickness_mm': nominalThicknessMm,
      'minimum_thickness_mm': minimumThicknessMm,
      'current_reading_mm': currentReadingMm,
      'coc_issuer': cocIssuer,
      'parent_id': parentId,
      'detail': detail,
      'system': system,
      'is_deleted': isDeleted,
      'created_by': createdBy,
      'updated_by': updatedBy,
      'created_on': createdOn,
      'updated_on': updatedOn,
      'sync_date': syncDate,
    };
  }

  factory EquipmentBasicModel.fromJson(Map<String, dynamic> json) {
    return EquipmentBasicModel(
      id: json['id'],
      equipmentKey: json['equipment_key'] ?? '',
      rfid: json['rfid'] ?? '',
      status: json['status'] ?? 0,
      serial: json['serial'] ?? '',
      equType: json['equ_type'] ?? '',
      frmEquipmentId: json['frm_equipment_id'] ?? 0,
      location: json['location'] ?? 0,
      position: json['position'] ?? '',
      assetNumberSap: json['asset_number_sap'] ?? '',
      linkToAsset: json['link_to_asset'] ?? '',
      dimension: json['dimension'] ?? '',
      swlSwp: json['swl_swp'] ?? '',
      testLoad: json['test_load'] ?? '',
      wllMawp: json['wll_mawp'] ?? '',
      factorOfSafety: json['factor_of_safety'] ?? '',
      model: json['model'] ?? '',
      manufacturer: json['manufacturer'] ?? '',
      dateOfManufacturer: json['date_of_manufacturer'] ?? '',
      weight: json['weight'] ?? '',
      gridRef: json['grid_ref'] ?? '',
      access: json['access'] ?? '',
      height: (json['height'] is int)
          ? (json['height'] as int).toDouble()
          : json['height'], // Handle int to double
      nfl: json['nfl'] ?? 0,
      drops: json['drops'] ?? 0,
      ex: json['ex'] ?? 0,
      critical: json['critical'] ?? 0,
      eqgroups: json['eqgroups'] ?? 0,
      thirdParty: json['third_party'] ?? 0,
      api: json['api'] ?? 0,
      engine: json['engine'] ?? 0,
      hose: json['hose'] ?? 0,
      asset: json['asset'] ?? 0,
      audited: json['audited'] ?? 0,
      capitalEquipment: json['capital_equipment'] ?? 0,
      confinedSpace: json['confined_space'] ?? 0,
      currentHrs: json['current_hrs'] ?? 0,
      oldCurrentHrs: json['old_current_hrs'] ?? 0,
      lastCurrentHrsReadingDate: json['last_current_hrs_reading_date'] ?? '',
      previousCurrentHrs: json['previous_current_hrs'] ?? 0,
      photo: json['photo'] ?? '',
      inServicePoNo: json['in_service_po_no'] ?? '',
      inService: json['in_service'] ?? '',
      mro: json['mro'] ?? '',
      inServiceRemove: json['in_service_remove'] ?? '',
      inServiceValidDays: json['in_service_valid_days'] ?? 0,
      inServiceIsUnexpirable: json['in_service_is_unexpirable'] ?? 0,
      lockId: json['lock_id'] ?? '',
      cocNo: json['coc_no'] ?? '',
      cocVerification: json['coc_verification'] ?? 0,
      cocIssueDate: json['coc_issue_date'] ?? '',
      cocExpiryDate: json['coc_expiry_date'] ?? '',
      cocValidDays: json['coc_valid_days'] ?? 0,
      cocIsUnexpirable: json['coc_is_unexpirable'] ?? 0,
      comments: json['comments'] ?? '',
      connectA: json['connect_a'] ?? 0,
      connectB: json['connect_b'] ?? 0,
      material: json['material'] ?? '',
      nominalThicknessMm: (json['nominal_thickness_mm'] is int)
          ? (json['nominal_thickness_mm'] as int).toDouble()
          : json['nominal_thickness_mm'], // Handle int to double
      minimumThicknessMm: (json['minimum_thickness_mm'] is int)
          ? (json['minimum_thickness_mm'] as int).toDouble()
          : json['minimum_thickness_mm'], // Handle int to double
      currentReadingMm: (json['current_reading_mm'] is int)
          ? (json['current_reading_mm'] as int).toDouble()
          : json['current_reading_mm'], // Handle int to double
      cocIssuer: json['coc_issuer'] ?? '',
      parentId: json['parent_id'] ?? 0,
      detail: json['detail'] ?? '',
      system: json['system'] ?? '',
      isDeleted: json['is_deleted'] ?? 0,
      createdBy: json['created_by'] ?? 0,
      updatedBy: json['updated_by'] ?? 0,
      createdOn: json['created_on'] ?? '',
      updatedOn: json['updated_on'] ?? '',
      syncDate: json['sync_date'] ?? '',
    );
  }
}
