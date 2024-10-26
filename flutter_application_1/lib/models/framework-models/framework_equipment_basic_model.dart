class FrameworkEquipmentBasicModel {
  final int equipmentId;
  final int parentId;
  final int sort;
  final String title;
  final String photo;
  final int status;
  final String? dropsFrequency; // Nullable
  final int cocValidDays;
  final int cocUnexpirable;
  final int inServiceValidDays;
  final int inServiceUnexpirable;
  final int asset;
  final int critical;
  final int grouping;
  final int eqgroups;
  final int api;
  final int engine;
  final int hose;
  final int capitalEquipment;
  final String? manufacturer; // Nullable
  final String? model; // Nullable
  final String? weight; // Nullable
  final String? swl; // Nullable
  final String? wll; // Nullable
  final String? testLoad; // Nullable
  final String? visualInspectionInternationalStandards; // Nullable
  final String? visualInspectionSystemNotes; // Nullable
  final String? ndtInspectionInternationalStandards; // Nullable
  final String? ndtInspectionSystemNotes; // Nullable
  final String? dropsStandards; // Nullable
  final String? dropsPrimaryFixing; // Nullable
  final String? dropsSafetySecuring; // Nullable
  final String? exStandards; // Nullable
  final String? exGeneralProcedure; // Nullable
  final String? generalEquipmentNotes; // Nullable
  final String? widgetType; // Nullable
  final String? reginalStandards; // Nullable
  final String? dropsSystemNotes; // Nullable
  final String? secondaryRetention; // Nullable
  final String? dropsInspectionProcedure; // Nullable
  final String? exSystemNotes; // Nullable
  final String? exSpecialProcedure; // Nullable
  final String? components; // Nullable
  final String? consumables; // Nullable
  final int regWidget;
  final double cost;
  final double sellingCost;
  final double displayFormat;
  final String? sortOrder; // Nullable
  final String? dimension; // Nullable
  final String patternNumber;
  final String catalogueNumber;
  final String? codeRfid; // Nullable
  final String? mro; // Nullable
  final String? details; // Nullable
  final String system;
  final int updatedBy;
  final DateTime updatedOn;
  final int createdBy;
  final DateTime createdOn;
  final int published;
  final DateTime syncDate;

  FrameworkEquipmentBasicModel({
    required this.equipmentId,
    required this.parentId,
    required this.sort,
    required this.title,
    required this.photo,
    required this.status,
    this.dropsFrequency,
    required this.cocValidDays,
    required this.cocUnexpirable,
    required this.inServiceValidDays,
    required this.inServiceUnexpirable,
    required this.asset,
    required this.critical,
    required this.grouping,
    required this.eqgroups,
    required this.api,
    required this.engine,
    required this.hose,
    required this.capitalEquipment,
    this.manufacturer,
    this.model,
    this.weight,
    this.swl,
    this.wll,
    this.testLoad,
    this.visualInspectionInternationalStandards,
    this.visualInspectionSystemNotes,
    this.ndtInspectionInternationalStandards,
    this.ndtInspectionSystemNotes,
    this.dropsStandards,
    this.dropsPrimaryFixing,
    this.dropsSafetySecuring,
    this.exStandards,
    this.exGeneralProcedure,
    this.generalEquipmentNotes,
    this.widgetType,
    this.reginalStandards,
    this.dropsSystemNotes,
    this.secondaryRetention,
    this.dropsInspectionProcedure,
    this.exSystemNotes,
    this.exSpecialProcedure,
    this.components,
    this.consumables,
    required this.regWidget,
    required this.cost,
    required this.sellingCost,
    required this.displayFormat,
    this.sortOrder,
    this.dimension,
    required this.patternNumber,
    required this.catalogueNumber,
    this.codeRfid,
    this.mro,
    this.details,
    required this.system,
    required this.updatedBy,
    required this.updatedOn,
    required this.createdBy,
    required this.createdOn,
    required this.published,
    required this.syncDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'equipment_id': equipmentId,
      'parent_id': parentId,
      'sort': sort,
      'title': title,
      'photo': photo,
      'status': status,
      'drops_frequency': dropsFrequency,
      'coc_valid_days': cocValidDays,
      'coc_unexpirable': cocUnexpirable,
      'in_service_valid_days': inServiceValidDays,
      'in_service_unexpirable': inServiceUnexpirable,
      'asset': asset,
      'critical': critical,
      'grouping': grouping,
      'eqgroups': eqgroups,
      'api': api,
      'engine': engine,
      'hose': hose,
      'capital_equipment': capitalEquipment,
      'manufacturer': manufacturer,
      'model': model,
      'weight': weight,
      'SWL': swl,
      'WLL': wll,
      'test_load': testLoad,
      'visual_inspection_international_standards':
          visualInspectionInternationalStandards,
      'visual_inspection_system_notes': visualInspectionSystemNotes,
      'ndt_inspection_international_standards':
          ndtInspectionInternationalStandards,
      'ndt_inspection_system_notes': ndtInspectionSystemNotes,
      'drops_standards': dropsStandards,
      'drops_primary_fixing': dropsPrimaryFixing,
      'drops_safety_securing': dropsSafetySecuring,
      'ex_standards': exStandards,
      'ex_general_procedure': exGeneralProcedure,
      'general_equipment_notes': generalEquipmentNotes,
      'widget_type': widgetType,
      'reginal_standards': reginalStandards,
      'drops_system_notes': dropsSystemNotes,
      'secondary_retention': secondaryRetention,
      'drops_inspection_procedure': dropsInspectionProcedure,
      'ex_system_notes': exSystemNotes,
      'ex_special_procedure': exSpecialProcedure,
      'components': components,
      'consumables': consumables,
      'reg_widget': regWidget,
      'cost': cost,
      'selling_cost': sellingCost,
      'display_format': displayFormat,
      'sort_order': sortOrder,
      'dimension': dimension,
      'pattern_number': patternNumber,
      'catalogue_number': catalogueNumber,
      'code_rfid': codeRfid,
      'mro': mro,
      'details': details,
      'system': system,
      'updated_by': updatedBy,
      'updated_on': updatedOn.toIso8601String(),
      'created_by': createdBy,
      'created_on': createdOn.toIso8601String(),
      'published': published,
      'sync_date': syncDate.toIso8601String(),
    };
  }

  factory FrameworkEquipmentBasicModel.fromJson(Map<String, dynamic> json) {
    return FrameworkEquipmentBasicModel(
      equipmentId: json['equipment_id'] ?? 0,
      parentId: json['parent_id'] ?? 0,
      sort: json['sort'] ?? 0,
      title: json['title'] ?? '', // Ensure a default value
      photo: json['photo'] ?? '',
      status: json['status'] ?? 0,
      dropsFrequency: json['drops_frequency'] ?? '',
      cocValidDays: json['coc_valid_days'] ?? 0,
      cocUnexpirable: json['coc_unexpirable'] ?? 0,
      inServiceValidDays: json['in_service_valid_days'] ?? 0,
      inServiceUnexpirable: json['in_service_unexpirable'] ?? 0,
      asset: json['asset'] ?? 0,
      critical: json['critical'] ?? 0,
      grouping: json['grouping'] ?? 0,
      eqgroups: json['eqgroups'] ?? 0,
      api: json['api'] ?? 0,
      engine: json['engine'] ?? 0,
      hose: json['hose'] ?? 0,
      capitalEquipment: json['capital_equipment'] ?? 0,
      manufacturer: json['manufacturer'] ?? '',
      model: json['model'] ?? '',
      weight: json['weight'] ?? '',
      swl: json['SWL'] ?? '',
      wll: json['WLL'] ?? '',
      testLoad: json['test_load'] ?? '',
      visualInspectionInternationalStandards:
          json['visual_inspection_international_standards'] ?? '',
      visualInspectionSystemNotes: json['visual_inspection_system_notes'] ?? '',
      ndtInspectionInternationalStandards:
          json['ndt_inspection_international_standards'] ?? '',
      ndtInspectionSystemNotes: json['ndt_inspection_system_notes'] ?? '',
      dropsStandards: json['drops_standards'] ?? '',
      dropsPrimaryFixing: json['drops_primary_fixing'] ?? '',
      dropsSafetySecuring: json['drops_safety_securing'] ?? '',
      exStandards: json['ex_standards'] ?? '',
      exGeneralProcedure: json['ex_general_procedure'] ?? '',
      generalEquipmentNotes: json['general_equipment_notes'] ?? '',
      widgetType: json['widget_type'] ?? '',
      reginalStandards: json['reginal_standards'] ?? '',
      dropsSystemNotes: json['drops_system_notes'] ?? '',
      secondaryRetention: json['secondary_retention'] ?? '',
      dropsInspectionProcedure: json['drops_inspection_procedure'] ?? '',
      exSystemNotes: json['ex_system_notes'] ?? '',
      exSpecialProcedure: json['ex_special_procedure'] ?? '',
      components: json['components'] ?? '',
      consumables: json['consumables'] ?? '',
      regWidget: json['reg_widget'] ?? 0,
      cost: (json['cost'] is int)
          ? (json['cost'] as int).toDouble()
          : (json['cost']?.toDouble() ?? 0.0),
      sellingCost: (json['selling_cost'] is int)
          ? (json['selling_cost'] as int).toDouble()
          : (json['selling_cost']?.toDouble() ?? 0.0),
      displayFormat: (json['display_format'] is int)
          ? (json['display_format'] as int).toDouble()
          : (json['display_format']?.toDouble() ?? 0.0),
      sortOrder: json['sort_order'] ?? '',
      dimension: json['dimension'] ?? '',
      patternNumber: json['pattern_number'] ?? '', // Handle nullable safely
      catalogueNumber: json['catalogue_number'] ?? '',
      codeRfid: json['code_rfid'] ?? '',
      mro: json['mro'] ?? '',
      details: json['details'] ?? '',
      system: json['system'] ?? '',
      updatedBy: json['updated_by'] ?? 0,
      updatedOn: DateTime.parse(json['updated_on'] ??
          DateTime.now().toIso8601String()), // Fallback to now if null
      createdBy: json['created_by'] ?? 0,
      createdOn: DateTime.parse(
          json['created_on'] ?? DateTime.now().toIso8601String()),
      published: json['published'] ?? 0,
      syncDate:
          DateTime.parse(json['sync_date'] ?? DateTime.now().toIso8601String()),
    );
  }
}
