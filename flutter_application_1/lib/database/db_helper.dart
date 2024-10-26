import 'dart:developer';
import 'package:flutter_application_1/models/equipments_models/equipment_basic_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/equipments_models/equipment_certificate_model.dart';
import '../models/equipments_models/equipment_corrective_action_model.dart';
import '../models/equipments_models/equipment_ex_model.dart';
import '../models/equipments_models/equipment_standart_model.dart';
import '../models/framework-models/framework_certificate_indicator_model.dart';
import '../models/framework-models/framework_certificate_model.dart';
import '../models/framework-models/framework_corrective_action_model.dart';
import '../models/framework-models/framework_equipment_basic_model.dart';
import '../models/framework-models/framework_equipment_certificate_model.dart';
import '../models/framework-models/framework_equipment_ex_model.dart';
import '../models/framework-models/framework_equipment_standard_model.dart';
import '../models/framework-models/framework_organisation_model.dart';
import '../models/task-models/task_equipment_model.dart';
import '../models/task-models/task_expired_notification_model.dart';
import '../models/task-models/task_expiring_notification_send_dates.dart';
import '../models/task-models/task_inspectiontype_model.dart';
import '../models/task-models/task_notifications_model.dart';
import '../models/task-models/task_summary_doc_model.dart';
import '../models/task-models/task_summary_status_model.dart';
import '../models/task-models/task_workscope_cert_indicator_model.dart';
import '../models/task-models/task_workscope_item_inspection_model.dart';
import '../models/task-models/task_workscope_item_model.dart';
import '../models/task-models/task_workscope_specific_equipment_model.dart';
import '../models/equipments_models/equipment_drop_model.dart';

class DBHelper {
  static Database? _database;

  // Initialize the database
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'user_database.db');

    return await openDatabase(
      path,
      version: 1, // Incremented version
      onCreate: (db, version) async {
        await _createUserTables(db);
        await _createFrameworkCertificateTable(db);
        await _createFrameworkOrganisationTable(db);
        await _createFrameworkCertificateIndicatorsTable(db);
        await _createFrameworkCorrectiveActionTable(db);
        await _createFrameworkEquipmentCertTable(db);
        await _createFrameworkEquipmentExTable(db);
        await _createFrameworkEquipmentStandardTable(db);
        await _createFrameworkEquipmentBasicTable(db);

        //********************************************8 */
        await _createTaskInspectionTypeTable(db);
        await _createTaskEquipmentTable(db);
        await _createTaskExpiredNotificationTable(db);
        await _createTaskExpiringNotificationSendDatesTable(db);
        await _createTaskNotificationTable(db);
        await _createTaskSummaryDocTable(db);
        await _createTaskSummaryStatusTable(db);
        await _createTaskWorkscopeCertIndicatorTable(db);
        await _createTaskWorkscopeItemInspectionTable(db);
        await _createTaskWorkscopeItemTable(db);
        await _createTaskWorkscopeSpecificEquipmentTable(db);

        //******************** */
        await _createEquipmentCorrectiveActionTable(db);
        await _createEquipmentBasicTable(db);
        await _createEquipmentCertificateTable(db);
        await _createEquipmentExTable(db);
        await _createEquipmentStandardTable(db);
        await _createEquipmentDropsTable(db);
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        // Handle database upgrade logic if needed
        log('Database upgraded from version $oldVersion to $newVersion');
      },
    );
  }

  Future<void> _createUserTables(Database db) async {
    try {
      await db.execute('''
        CREATE TABLE users_account_one (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          username TEXT,
          password TEXT
        )
      ''');

      await db.execute('''
        CREATE TABLE users_account_two (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          username TEXT,
          password TEXT
        )
      ''');

      await db.execute('''
        CREATE TABLE users_account_three (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          username TEXT,
          password TEXT
        )
      ''');
      log('User account tables created successfully');
    } catch (e) {
      log('Error creating user account tables: $e');
    }
  }

  // Insert a user into the specified account table
  Future<void> insertUser(
      String username, String password, String accountSlug) async {
    final db = await database;

    try {
      String tableName = _getUserTableName(accountSlug);
      log('Inserting user into $tableName');
      await db.insert(
        tableName,
        {'username': username, 'password': password},
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      log('Error inserting user into $accountSlug: $e');
    }
  }

  // Retrieve user credentials from the specified account table
  Future<Map<String, dynamic>?> getUserCredentials(String accountSlug) async {
    final db = await database;
    String tableName = _getUserTableName(accountSlug);
    await logAllUsers();

    try {
      List<Map<String, dynamic>> result = await db.query(tableName);
      return result.isNotEmpty
          ? result.first
          : null; // Return the first user or null if no users
    } catch (e) {
      log('Error retrieving user credentials from $accountSlug: $e');
      return null;
    }
  }

  // Retrieve all user credentials from the specified account table
  Future<List<Map<String, dynamic>>> getAllData(String accountSlug) async {
    final db = await database;
    String tableName = _getUserTableName(accountSlug);
    await logAllUsers();

    try {
      List<Map<String, dynamic>> result = await db.query(tableName);
      return result; // Return all user data instead of just one
    } catch (e) {
      log('Error retrieving all data from $accountSlug: $e');
      return []; // Return an empty list on error
    }
  }

  // Retrieve the table name based on account slug
  String _getUserTableName(String accountSlug) {
    if (accountSlug == 'account-one') {
      return 'users_account_one';
    } else if (accountSlug == 'account-two') {
      return 'users_account_two';
    } else if (accountSlug == 'account-three') {
      return 'users_account_three';
    } else {
      throw Exception("Invalid account slug");
    }
  }

  // Log users from all account tables for debugging
  Future<void> logAllUsers() async {
    final db = await database;

    try {
      List<Map<String, dynamic>> usersAccountOne =
          await db.query('users_account_one');
      log('Users in account one: $usersAccountOne');

      List<Map<String, dynamic>> usersAccountTwo =
          await db.query('users_account_two');
      log('Users in account two: $usersAccountTwo');

      List<Map<String, dynamic>> usersAccountThree =
          await db.query('users_account_three');
      log('Users in account three: $usersAccountThree');
    } catch (e) {
      log('Error logging users: $e');
    }
  }

//*************************************Framework_certificate ********************* */

//http://localhost:3000/api/v1/frameworks/getCertificates

  Future<void> _createFrameworkCertificateTable(Database db) async {
    try {
      await db.execute(
        'CREATE TABLE framework_certificate ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT, '
        'cert_unique_id TEXT NOT NULL, '
        'cert_group TEXT NOT NULL, '
        'cert_type INTEGER NOT NULL, '
        'sort TEXT NOT NULL, '
        'competence INTEGER NOT NULL DEFAULT 0, '
        'title TEXT NOT NULL, '
        'cert_status INTEGER NOT NULL, '
        'valid_day_tick INTEGER NOT NULL, '
        'notuse_valid_day INTEGER NOT NULL DEFAULT 0, '
        'notuse_valid_hour INTEGER NOT NULL, '
        'valid_hour_tick INTEGER NOT NULL, '
        'is_cos INTEGER NOT NULL DEFAULT 0, '
        'is_major_cos INTEGER NOT NULL DEFAULT 0, '
        'is_intermediate_cos INTEGER NOT NULL DEFAULT 0, '
        'certificate_format TEXT NOT NULL, '
        'comments TEXT NOT NULL, '
        'parent_id INTEGER NOT NULL, '
        'created_by INTEGER NOT NULL, '
        'created_on TEXT NOT NULL, '
        'updated_by INTEGER NOT NULL, '
        'updated_on TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP, '
        'published INTEGER NOT NULL, '
        'sync_date TEXT NOT NULL'
        ')',
      );
      log('framework_certificate table created successfully');
    } catch (e) {
      log('Error creating framework_certificate table: $e');
    }
  }

  // Insert multiple certificates into the framework_certificate table
  Future<void> insertFrameworkCertificates(
      List<FrameworkCertModel> certificates) async {
    final db = await database;
    try {
      // Use batch to group multiple insert operations
      Batch batch = db.batch();

      for (var certificate in certificates) {
        batch.insert(
          'framework_certificate',
          certificate.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }

      // Commit the batch of operations to the database
      await batch.commit(
          noResult: true); // Use noResult: true for performance improvement
      log('Inserted ${certificates.length} Certificates');

      //  await printInsertedCertificates(certificates);
    } catch (e) {
      log('Error inserting certificates: $e');
    }
  }

// // Method to print inserted certificates for verification
//   Future<void> printInsertedCertificates(
//       List<FrameworkCertModel> certificates) async {
//     try {
//       for (var certificate in certificates) {
//         log('Inserted Certificate: ${certificate.toJson()}');
//       }
//     } catch (e) {
//       log('Error fetching inserted certificates: $e');
//     }
//   }

  /////**********************************task_inspection_type ***************************/
//task_inspection_type==http://localhost:3000/api/v1/tasks/getInspectionTypes
  Future<void> _createTaskInspectionTypeTable(Database db) async {
    try {
      await db.execute(
        'CREATE TABLE task_inspection_type ('
        'inspection_id INTEGER PRIMARY KEY AUTOINCREMENT, '
        'inspection_title TEXT NOT NULL, '
        'inspection_type_image TEXT, '
        'status INTEGER NOT NULL, '
        'created_at TEXT DEFAULT NULL'
        ')',
      );
      log('task_inspection_type table created successfully');
    } catch (e) {
      log('Error creating task_inspection_type table: $e');
    }
  }

  Future<void> insertTaskInspectionType(
      List<TaskInspectionTypeModel> inspectionTypesList) async {
    final db = await database; // Get the database instance

    try {
      // Use batch to group multiple insert operations
      Batch batch = db.batch();

      for (var inspectionType in inspectionTypesList) {
        batch.insert(
          'task_inspection_type',
          inspectionType.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }

      // Commit the batch of operations to the database
      await batch.commit(
          noResult: true); // Use noResult: true for performance improvement
      log('Inserted ${inspectionTypesList.length} Task Inspection Type entries');

      // Optional: Print inserted data for verification
      //  await printInsertedData(); // Ensure this method is implemented in DBHelper
    } catch (e) {
      log('Error inserting task inspection types: $e');
    }
  }

// // Method to fetch and print all records from the task_inspection_type table
//   Future<void> printInsertedData() async {
//     final db = await database; // Get the database instance

//     try {
//       final List<Map<String, dynamic>> records =
//           await db.query('task_inspection_type');

//       for (var record in records) {
//         log('Inserted Record: $record'); // Log each inserted record
//       }
//     } catch (e) {
//       log('Error fetching inserted data: $e');
//     }
//   }

  //********************************************** */
  //framework_organisation==http://localhost:3000/api/v1/frameworks/getLocations
  Future<void> _createFrameworkOrganisationTable(Database db) async {
    try {
      await db.execute(
        'CREATE TABLE framework_organisation ('
        'organisation_id INTEGER PRIMARY KEY NOT NULL, '
        'parent_id INTEGER NOT NULL, '
        'location_key TEXT NOT NULL, '
        'title TEXT NOT NULL, '
        'drop_zone TEXT NOT NULL, '
        'ex_zone TEXT NOT NULL, '
        'rfid TEXT, '
        'latitude TEXT, '
        'longitude TEXT, '
        'hazards TEXT, '
        'location_notes TEXT, '
        'confined_space INTEGER NOT NULL, '
        'drops INTEGER NOT NULL, '
        'ex INTEGER NOT NULL, '
        'system_email_users TEXT NOT NULL, '
        'primary_node INTEGER NOT NULL, '
        'node_code TEXT NOT NULL, '
        'country INTEGER NOT NULL, '
        'city TEXT NOT NULL, '
        'GPS TEXT, '
        'PIC TEXT, '
        'PIC_no TEXT, '
        'PIC_email TEXT, '
        'created_by INTEGER NOT NULL, '
        'created_on TEXT NOT NULL, '
        'updated_by INTEGER NOT NULL, '
        'updated_on TEXT DEFAULT CURRENT_TIMESTAMP NOT NULL, '
        'status INTEGER NOT NULL, '
        'sync_date TEXT NOT NULL'
        ')',
      );
      log('framework_organisation table created successfully');
    } catch (e) {
      log('Error creating framework_organisation table: $e');
    }
  }

  Future<void> insertFrameworkOrganisation(
      List<FrameworkOrganisationModel> organisationsList) async {
    final db = await database; // Get the database instance

    try {
      // Use batch to group multiple insert operations
      Batch batch = db.batch();

      for (var organisation in organisationsList) {
        batch.insert(
          'framework_organisation',
          organisation.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }

      // Commit the batch of operations to the database
      await batch.commit(
          noResult: true); // Use noResult: true for performance improvement
      log('Inserted ${organisationsList.length} Organisation entries');

      // Optional: Print inserted data for verification
      //await printInsertedData(); // Ensure this method is implemented in DBHelper
    } catch (e) {
      log('Error inserting organisations: $e');
    }
  }

// Method to fetch and print all records from the framework_organisation table
  // Future<void> printInsertedData() async {
  //   final db = await database; // Get the database instance

  //   try {
  //     final List<Map<String, dynamic>> records =
  //         await db.query('framework_organisation');

  //     for (var record in records) {
  //       log('Inserted Record: $record'); // Log each inserted record
  //     }
  //   } catch (e) {
  //     log('Error fetching inserted data: $e');
  //   }
  // }

  //************************************framework_certificate_indicators */
  //framework_certificate_indicators==http://localhost:3000/api/v1/frameworks/getIndicators

  Future<void> _createFrameworkCertificateIndicatorsTable(Database db) async {
    try {
      await db.execute(
        'CREATE TABLE framework_certificate_indicators ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT, '
        'framework_certificate_id INTEGER NOT NULL, '
        'indicator_unique_id TEXT NOT NULL, '
        'sort INTEGER, '
        'title TEXT NOT NULL, '
        'min_old TEXT, '
        'min REAL NOT NULL DEFAULT 0, '
        'max REAL NOT NULL DEFAULT 0, '
        'max_old TEXT, '
        'set_limit INTEGER NOT NULL, '
        'is_fh INTEGER NOT NULL DEFAULT 0, '
        'ca_title TEXT, '
        'created_by INTEGER NOT NULL, '
        'created_on TEXT, '
        'updated_by INTEGER NOT NULL, '
        'updated_on TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP, '
        'status INTEGER NOT NULL DEFAULT 1, '
        'sync_date TEXT NOT NULL, '
        'FOREIGN KEY (framework_certificate_id) REFERENCES framework_certificate(id) ON DELETE CASCADE'
        ')',
      );
      log('framework_certificate_indicators table created successfully');
    } catch (e) {
      log('Error creating framework_certificate_indicators table: $e');
    }
  }

  Future<void> insertCertificateIndicators(
      List<FrameworkCertIndicatorModel> indicatorsList) async {
    final db = await database; // Get the database instance

    try {
      // Use batch to group multiple insert operations
      Batch batch = db.batch();

      for (var indicator in indicatorsList) {
        batch.insert(
          'framework_certificate_indicators',
          indicator.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }

      // Commit the batch of operations to the database
      await batch.commit(
          noResult: true); // Use noResult: true for performance improvement
      log('Inserted ${indicatorsList.length} Certificate Indicator entries');

      // Optional: Print inserted data for verification
      //await printInsertedData(); // Ensure this method is implemented in DBHelper
    } catch (e) {
      log('Error inserting certificate indicators: $e');
    }
  }

//Method to fetch and print all records from the framework_certificate_indicators table
  // Future<void> printInsertedData() async {
  //   final db = await database; // Get the database instance

  //   try {
  //     final List<Map<String, dynamic>> records =
  //         await db.query('framework_certificate_indicators');

  //     for (var record in records) {
  //       log('Inserted Record: $record'); // Log each inserted record
  //     }
  //   } catch (e) {
  //     log('Error fetching inserted data: $e');
  //   }
  // }

  //*********************************************** */
  //==framework_corrective_action http://localhost:3000/api/v1/frameworks/getFrmCorrectiveActions

  Future<void> _createFrameworkCorrectiveActionTable(Database db) async {
    try {
      await db.execute(
        'CREATE TABLE framework_corrective_action ('
        'corrective_action_id INTEGER PRIMARY KEY AUTOINCREMENT, '
        'parent_id INTEGER NOT NULL, '
        'title TEXT NOT NULL, '
        'ca_code TEXT NOT NULL, '
        'ca_class INTEGER NOT NULL DEFAULT 1, '
        'ca_type TEXT, '
        'standard_ref TEXT, '
        'suggested_remedial TEXT, '
        'close_out_duration INTEGER, '
        'notes TEXT, '
        'ca_status INTEGER NOT NULL DEFAULT 1, '
        'created_by INTEGER NOT NULL, '
        'created_on TEXT NOT NULL, '
        'updated_by INTEGER NOT NULL, '
        'updated_on TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP, '
        'sync_date TEXT NOT NULL'
        ')',
      );
      log('framework_corrective_action table created successfully');
    } catch (e) {
      log('Error creating framework_corrective_action table: $e');
    }
  }

// Method to insert a list of corrective actions into the database in batch
  Future<void> insertFrameworkCorrectiveActions(
      List<FrameworkCorrectiveActionModel> correctiveActionsList) async {
    final db = await database; // Get the database instance

    try {
      // Use batch to group multiple insert operations
      Batch batch = db.batch();

      for (var correctiveAction in correctiveActionsList) {
        batch.insert(
          'framework_corrective_action',
          correctiveAction.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }

      // Commit the batch of operations to the database
      await batch.commit(
          noResult: true); // Use noResult: true for performance improvement
      log('Inserted ${correctiveActionsList.length} Corrective Action entries');

      // Optional: Print inserted data for verification
      //  await printInsertedData(); // Ensure this method is implemented in DBHelper
    } catch (e) {
      log('Error inserting corrective actions: $e');
    }
  }

// // Method to fetch and print all records from the framework_corrective_action table
//   Future<void> printInsertedData() async {
//     final db = await database; // Get the database instance

//     try {
//       final List<Map<String, dynamic>> records =
//           await db.query('framework_corrective_action');

//       for (var record in records) {
//         log('Inserted Record: $record'); // Log each inserted record
//       }
//     } catch (e) {
//       log('Error fetching inserted data: $e');
//     }
//   }

  //*******************************************framework_equipment_cert**************** */
  //framework_equipment_cert==http://localhost:3000/api/v1/frameworks/getFrmEquipmentCerts
  Future<void> _createFrameworkEquipmentCertTable(Database db) async {
    try {
      await db.execute(
        'CREATE TABLE framework_equipment_cert ('
        'cert_id INTEGER PRIMARY KEY AUTOINCREMENT, '
        'equipment_id INTEGER NOT NULL, '
        'frm_cert_id INTEGER NOT NULL, '
        'cert_title TEXT NOT NULL, '
        'valid_days INTEGER NOT NULL, '
        'valid_hours INTEGER NOT NULL, '
        'unexpirable INTEGER NOT NULL, '
        'cert_type INTEGER NOT NULL, '
        'created_by INTEGER NOT NULL, '
        'created_on TEXT NOT NULL, '
        'day_hour TEXT NOT NULL DEFAULT "d", '
        'sort INTEGER NOT NULL, '
        'updated_by INTEGER NOT NULL, '
        'updated_on TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP, '
        'status INTEGER NOT NULL DEFAULT 1, '
        'not_active INTEGER NOT NULL DEFAULT 0, '
        'maintenance_task INTEGER NOT NULL DEFAULT 0, '
        'sync_date TEXT NOT NULL'
        ')',
      );
      log('framework_equipment_cert table created successfully');
    } catch (e) {
      log('Error creating framework_equipment_cert table: $e');
    }
  }

// Method to insert a list of equipment certs into the database in batch
  Future<void> insertFrameworkEquipmentCert(
      List<FrameworkEquipmentCertModel> equipmentCertList) async {
    final db = await database; // Get the database instance

    try {
      // Use batch to group multiple insert operations
      Batch batch = db.batch();

      for (var equipmentCert in equipmentCertList) {
        batch.insert(
          'framework_equipment_cert',
          equipmentCert.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }

      // Commit the batch of operations to the database
      await batch.commit(
          noResult: true); // Use noResult: true for performance improvement
      log('Inserted ${equipmentCertList.length} Framework Equipment Cert entries');

      // Optional: Print inserted data for verification
      //await printInsertedData(); // Ensure this method is implemented in DBHelper
    } catch (e) {
      log('Error inserting framework equipment cert: $e');
    }
  }

// Method to fetch and print all records from the framework_equipment_cert table
  // Future<void> printInsertedData() async {
  //   final db = await database; // Get the database instance

  //   try {
  //     final List<Map<String, dynamic>> records =
  //         await db.query('framework_equipment_cert');

  //     for (var record in records) {
  //       log('Inserted Record: $record'); // Log each inserted record
  //     }
  //   } catch (e) {
  //     log('Error fetching inserted data: $e');
  //   }
  // }

  //************************************framework_equipment_ex************/
  //framework_equipment_ex==http://localhost:3000/api/v1/frameworks/getFrmEquipmentEx
  Future<void> _createFrameworkEquipmentExTable(Database db) async {
    try {
      await db.execute('''
      CREATE TABLE framework_equipment_ex (
        ex_id INTEGER PRIMARY KEY AUTOINCREMENT,
        equipment_id INTEGER NOT NULL,
        epl_atex_marking TEXT NOT NULL,
        ex_category TEXT NOT NULL,
        ex_division TEXT NOT NULL,
        ex_protection TEXT DEFAULT NULL,
        ex_gas_group TEXT NOT NULL,
        ex_ip_code TEXT NOT NULL,
        ex_standards TEXT DEFAULT NULL,
        ex_pmi TEXT DEFAULT NULL,
        ex_temp_class TEXT NOT NULL,
        ex_ambient_temp TEXT NOT NULL,
        ex_cert_no TEXT DEFAULT NULL,
        ex_notified_body TEXT DEFAULT NULL,
        ex_link_to_certificates TEXT DEFAULT NULL,
        ex_general_procedure TEXT DEFAULT NULL,
        ex_special_procedure TEXT DEFAULT NULL,
        created_by INTEGER NOT NULL,
        updated_by INTEGER NOT NULL,
        created_on TEXT NOT NULL,
        updated_on TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
        sync_date TEXT NOT NULL
      )
      ''');
      log('framework_equipment_ex table created successfully');
    } catch (e) {
      log('Error creating framework_equipment_ex table: $e');
    }
  }

  Future<void> insertFrameworkEquipmentEx(
      List<FrameworkEquipmentExModel> equipmentExList) async {
    final db = await database; // Get the database instance

    try {
      // Use batch to group multiple insert operations
      Batch batch = db.batch();

      for (var equipmentEx in equipmentExList) {
        batch.insert(
          'framework_equipment_ex',
          equipmentEx.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }

      // Commit the batch of operations to the database
      await batch.commit(
          noResult: true); // Use noResult: true for performance improvement
      log('Inserted ${equipmentExList.length} Framework Equipment Ex entries');

      // Optional: Print inserted data for verification
      // await printInsertedData(); // Ensure this method is implemented in DBHelper
    } catch (e) {
      log('Error inserting framework equipment ex: $e');
    }
  }

// // Method to fetch and print all records from the framework_equipment_ex table
//   Future<void> printInsertedData() async {
//     final db = await database; // Get the database instance

//     try {
//       final List<Map<String, dynamic>> records =
//           await db.query('framework_equipment_ex');

//       for (var record in records) {
//         log('Inserted Record: $record'); // Log each inserted record
//       }
//     } catch (e) {
//       log('Error fetching inserted data: $e');
//     }
//   }

//*******************************framework_equipment_standard******************* */
//framework_equipment_standard==http://localhost:3000/api/v1/frameworks/getFrmEquipmentStandard
  Future<void> _createFrameworkEquipmentStandardTable(Database db) async {
    try {
      await db.execute('''
      CREATE TABLE framework_equipment_standard (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        equipment_id INTEGER NOT NULL,
        international_standards TEXT DEFAULT NULL,
        regional_standards TEXT DEFAULT NULL,
        contractor_standards TEXT DEFAULT NULL,
        system_note_on_general TEXT DEFAULT NULL,
        drop_standards TEXT DEFAULT NULL,
        system_notes_on_drops TEXT DEFAULT NULL,
        international_standards_details TEXT DEFAULT NULL,
        regional_standards_details TEXT DEFAULT NULL,
        contractor_standards_details TEXT DEFAULT NULL,
        primary_fixing TEXT DEFAULT NULL,
        secondary_retention TEXT DEFAULT NULL,
        safety_securing TEXT DEFAULT NULL,
        drops_inspection_procedure TEXT DEFAULT NULL,
        ex_standard TEXT DEFAULT NULL,
        ex_system_notes TEXT DEFAULT NULL,
        ex_general_procedure TEXT DEFAULT NULL,
        ex_special_procedure TEXT DEFAULT NULL,
        drops_frequency TEXT DEFAULT NULL,
        standards TEXT DEFAULT NULL,
        standards_details TEXT DEFAULT NULL,
        register_update INTEGER NOT NULL DEFAULT 0,
        created_by INTEGER NOT NULL,
        created_on TEXT NOT NULL,
        updated_by INTEGER NOT NULL,
        updated_on TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
        sync_date TEXT NOT NULL
      )
      ''');
      log('framework_equipment_standard table created successfully');
    } catch (e) {
      log('Error creating framework_equipment_standard table: $e');
    }
  }

  Future<void> insertFrameworkEquipmentStandard(
      List<FrameworkEquipmentStandardModel> equipmentStandardList) async {
    final db = await database; // Get the database instance

    try {
      // Use batch to group multiple insert operations
      Batch batch = db.batch();

      for (var standard in equipmentStandardList) {
        batch.insert(
          'framework_equipment_standard',
          standard.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }

      // Commit the batch of operations to the database
      await batch.commit(
          noResult: true); // Use noResult: true for performance improvement
      log('Inserted ${equipmentStandardList.length} Framework Equipment Standard entries');

      // Optional: Print inserted data for verification
      //await printInsertedData(); // Ensure this method is implemented in DBHelper
    } catch (e) {
      log('Error inserting framework equipment standards: $e');
    }
  }

// // Method to fetch and print all records from the framework_equipment_standard table
//   Future<void> printInsertedData() async {
//     final db = await database; // Get the database instance

//     try {
//       final List<Map<String, dynamic>> records =
//           await db.query('framework_equipment_standard');

//       for (var record in records) {
//         log('Inserted Record: $record'); // Log each inserted record
//       }
//     } catch (e) {
//       log('Error fetching inserted data: $e');
//     }
//   }

  //*************************************framework_equipment_basic**************************************************** */
//framework_equipment_basic==http://localhost:3000/api/v1/frameworks/getFrameworkEquipments

  Future<void> _createFrameworkEquipmentBasicTable(Database db) async {
    try {
      await db.execute('''
      CREATE TABLE framework_equipment_basic (
        equipment_id INTEGER PRIMARY KEY,
        parent_id INTEGER NOT NULL,
        sort INTEGER NOT NULL DEFAULT 0,
        title TEXT NOT NULL,
        photo TEXT NOT NULL,
        status INTEGER NOT NULL,
        drops_frequency TEXT DEFAULT NULL,
        coc_valid_days INTEGER DEFAULT 0,
        coc_unexpirable INTEGER NOT NULL,
        in_service_valid_days INTEGER DEFAULT 0,
        in_service_unexpirable INTEGER NOT NULL,
        asset INTEGER NOT NULL,
        critical INTEGER NOT NULL,
        grouping INTEGER NOT NULL DEFAULT 0,
        eqgroups INTEGER NOT NULL DEFAULT 0,
        api INTEGER NOT NULL,
        engine INTEGER NOT NULL DEFAULT 0,
        hose INTEGER NOT NULL DEFAULT 0,
        capital_equipment INTEGER NOT NULL DEFAULT 0,
        manufacturer TEXT DEFAULT NULL,
        model TEXT DEFAULT NULL,
        weight TEXT DEFAULT NULL,
        SWL TEXT DEFAULT NULL,
        WLL TEXT DEFAULT NULL,
        test_load TEXT NOT NULL,
        visual_inspection_international_standards TEXT DEFAULT NULL,
        visual_inspection_system_notes TEXT DEFAULT NULL,
        ndt_inspection_international_standards TEXT DEFAULT NULL,
        ndt_inspection_system_notes TEXT DEFAULT NULL,
        drops_standards TEXT DEFAULT NULL,
        drops_primary_fixing TEXT DEFAULT NULL,
        drops_safety_securing TEXT DEFAULT NULL,
        ex_standards TEXT DEFAULT NULL,
        ex_general_procedure TEXT DEFAULT NULL,
        general_equipment_notes TEXT DEFAULT NULL,
        widget_type TEXT DEFAULT NULL,
        reginal_standards TEXT DEFAULT NULL,
        drops_system_notes TEXT DEFAULT NULL,
        secondary_retention TEXT DEFAULT NULL,
        drops_inspection_procedure TEXT DEFAULT NULL,
        ex_system_notes TEXT DEFAULT NULL,
        ex_special_procedure TEXT DEFAULT NULL,
        components TEXT DEFAULT NULL,
        consumables TEXT DEFAULT NULL,
        reg_widget INTEGER NOT NULL DEFAULT 0,
        cost REAL NOT NULL DEFAULT 0,
        selling_cost REAL NOT NULL DEFAULT 0,
        display_format REAL NOT NULL DEFAULT 0,
        sort_order TEXT DEFAULT NULL,
        dimension TEXT DEFAULT NULL,
        pattern_number TEXT NOT NULL,
        catalogue_number TEXT NOT NULL,
        code_rfid TEXT DEFAULT NULL,
        mro TEXT DEFAULT NULL,
        details TEXT DEFAULT NULL,
        system TEXT NOT NULL,
        updated_by INTEGER NOT NULL,
        updated_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        created_by INTEGER NOT NULL,
        created_on DATETIME NOT NULL,
        published INTEGER NOT NULL DEFAULT 1,
        sync_date DATETIME NOT NULL
      )
    ''');
      log('framework_equipment_basic table created successfully');
    } catch (e) {
      log('Error creating framework_equipment_basic table: $e');
    }
  }

  // Insert data using batch operation
  Future<void> insertFrameworkEquipmentBasic(
      List<FrameworkEquipmentBasicModel> equipmentBasicList) async {
    final db = await database; // Get the database instance

    try {
      // Use batch to group multiple insert operations
      Batch batch = db.batch();

      for (var basic in equipmentBasicList) {
        batch.insert(
          'framework_equipment_basic',
          basic
              .toJson(), // Convert model to a Map<String, dynamic> using toJson()
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
      log('Inserted ${equipmentBasicList.length} Framework Equipment Basic entries');

      // Commit the batch of operations to the database
      await batch.commit(
          noResult: true); // Use noResult: true for performance improvement

      //  await printInsertedData(); // Optional: Print inserted data for verification
    } catch (e) {
      log('Error inserting framework equipment basics: $e');
    }
  }

  // // Method to fetch and print all records from the framework_equipment_basic table
  // Future<void> printInsertedData() async {
  //   final db = await database; // Get the database instance

  //   try {
  //     final List<Map<String, dynamic>> records =
  //         await db.query('framework_equipment_basic');

  //     for (var record in records) {
  //       log('Inserted Record: $record'); // Log each inserted record
  //     }
  //   } catch (e) {
  //     log('Error fetching inserted data: $e');
  //   }
  // }
//********************************** task_equipment**********************/
//task_equipment==http://localhost:3000/api/v1/tasks/getTaskequipments/TUaDsUwXpkLKJYsC1
  Future<void> _createTaskEquipmentTable(Database db) async {
    try {
      await db.execute('''
      CREATE TABLE task_equipment (
        task_equipment_id INTEGER PRIMARY KEY AUTOINCREMENT,
        task_id INTEGER NOT NULL,
        task_equipment_key TEXT NOT NULL,
        task_key TEXT NOT NULL,
        equipment_type_id INTEGER NOT NULL,
        equipment_status TEXT NOT NULL,
        certificate_id INTEGER NOT NULL,
        created_by INTEGER NOT NULL,
        created_on DATETIME DEFAULT NULL,
        updated_by INTEGER NOT NULL,
        updated_on DATETIME DEFAULT NULL,
        status INTEGER NOT NULL DEFAULT 1,
        sync_date DATETIME NOT NULL
      )
    ''');
      log('task_equipment table created successfully');
    } catch (e) {
      log('Error creating task_equipment table: $e');
    }
  }

// Insert data using batch operation
  Future<void> insertTaskEquipment(
      List<TaskEquipmentModel> taskEquipmentList) async {
    final db = await database; // Get the database instance

    try {
      Batch batch = db.batch();

      for (var equipment in taskEquipmentList) {
        batch.insert(
          'task_equipment',
          equipment.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }

      log('Inserted ${taskEquipmentList.length} Task Equipment entries');
      //  await printInsertedData();
      await batch.commit(noResult: true); // For better performance
    } catch (e) {
      log('Error inserting task equipment: $e');
    }
  }

  //****************************** task_exipired_notification************************************** */
  // task_exipired_notification==http://localhost:3000/api/v1/tasks/getTaskExpiredNotifications
  Future<void> _createTaskExpiredNotificationTable(Database db) async {
    try {
      await db.execute('''
      CREATE TABLE task_exipired_notification (
        expire_notification_id INTEGER PRIMARY KEY AUTOINCREMENT,
        expire_notification_key TEXT NOT NULL,
        task_id INTEGER NOT NULL,
        task_key TEXT NOT NULL,
        expire_notification_msg TEXT NOT NULL,
        expire_days INTEGER NOT NULL,
        expire_assigne_user_id TEXT NOT NULL,
        notification_date TEXT NOT NULL,
        created_by INTEGER NOT NULL,
        created_on DATETIME NOT NULL,
        updated_by INTEGER NOT NULL,
        updated_on DATETIME NOT NULL,
        status INTEGER NOT NULL DEFAULT 1,
        sync_date DATETIME NOT NULL
      )
    ''');
      log('task_exipired_notification table created successfully');
    } catch (e) {
      log('Error creating task_exipired_notification table: $e');
    }
  }

  Future<void> insertTaskExpiredNotification(
      List<TaskExpiredNotificationModel> notificationList) async {
    final db = await database; // Get the database instance

    try {
      Batch batch = db.batch();

      for (var notification in notificationList) {
        batch.insert(
          'task_exipired_notification',
          notification.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }

      log('Inserted ${notificationList.length} Task Expired Notification entries');
      await batch.commit(noResult: true); // For better performance
      // await printInsertedData();
    } catch (e) {
      log('Error inserting task expired notification: $e');
    }
  }

  // Future<void> printInsertedData() async {
  //   final db = await database; // Get the database instance

  //   try {
  //     final List<Map<String, dynamic>> records =
  //         await db.query('task_exipired_notification');

  //     for (var record in records) {
  //       log('Inserted Record: $record'); // Log each inserted record
  //     }
  //   } catch (e) {
  //     log('Error fetching inserted data: $e');
  //   }
  // }

  //************************task_expiring_notification_send_dates************** */
  //task_expiring_notification_send_dates==http://localhost:3000/api/v1/tasks/getTaskExpiringNotifications
  Future<void> _createTaskExpiringNotificationSendDatesTable(
      Database db) async {
    try {
      await db.execute('''
      CREATE TABLE task_expiring_notification_send_dates (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        task_expiring_notification_send_dates_key TEXT NOT NULL,
        task_id INTEGER NOT NULL,
        task_key TEXT NOT NULL,
        notification_date TEXT NOT NULL,
        notification_enddate TEXT NOT NULL,
        expiring_notification_day_option INTEGER NOT NULL,
        status INTEGER DEFAULT 0, -- 0 - Disable, 1 Enable
        sync_date DATETIME NOT NULL
      )
    ''');
      log('task_expiring_notification_send_dates table created successfully');
    } catch (e) {
      log('Error creating task_expiring_notification_send_dates table: $e');
    }
  }

  Future<void> insertTaskExpiringNotificationSendDates(
      List<TaskExpiringNotificationSendDateModel> notificationList) async {
    final db = await database; // Get the database instance

    try {
      Batch batch = db.batch();

      for (var notification in notificationList) {
        batch.insert(
          'task_expiring_notification_send_dates',
          notification.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }

      log('Inserted ${notificationList.length} Task Expiring Notification Send Date entries');
      await batch.commit(noResult: true); // For better performance
      //  await printInsertedExpiringData();
    } catch (e) {
      log('Error inserting task expiring notification send dates: $e');
    }
  }

  // Future<void> printInsertedExpiringData() async {
  //   final db = await database; // Get the database instance

  //   try {
  //     final List<Map<String, dynamic>> records =
  //         await db.query('task_expiring_notification_send_dates');

  //     for (var record in records) {
  //       log('Inserted Record: $record'); // Log each inserted record
  //     }
  //   } catch (e) {
  //     log('Error fetching inserted expiring data: $e');
  //   }
  // }

  //********************************task_notification*********************************************** */
  //task_notification==http://localhost:3000/api/v1/tasks/getTaskNotifications

  Future<void> _createTaskNotificationTable(Database db) async {
    try {
      await db.execute('''
      CREATE TABLE task_notification (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        notification_key TEXT NOT NULL,
        task_id INTEGER NOT NULL,
        task_key TEXT NOT NULL,
        expire_notification_id INTEGER NOT NULL,
        notification TEXT NOT NULL,
        type TEXT NOT NULL,
        notification_date DATETIME NOT NULL,
        user_id INTEGER NOT NULL,
        read INTEGER NOT NULL,
        forward_to TEXT NOT NULL,
        assigned_to TEXT NOT NULL,
        updated_by INTEGER NOT NULL,
        updated_on DATETIME NOT NULL,
        status INTEGER NOT NULL,
        sync_date DATETIME NOT NULL
      )
    ''');
      log('task_notification table created successfully');
    } catch (e) {
      log('Error creating task_notification table: $e');
    }
  }

  Future<void> insertTaskNotification(
      List<TaskNotificationsModel> notificationList) async {
    final db = await database; // Get the database instance

    try {
      Batch batch = db.batch();

      for (var notification in notificationList) {
        batch.insert(
          'task_notification',
          notification.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }

      log('Inserted ${notificationList.length} Task Notification entries');
      await batch.commit(noResult: true); // For better performance
      // await printInsertedNotificationData();
    } catch (e) {
      log('Error inserting task notifications: $e');
    }
  }

  // Future<void> printInsertedNotificationData() async {
  //   final db = await database; // Get the database instance

  //   try {
  //     final List<Map<String, dynamic>> records =
  //         await db.query('task_notification');

  //     for (var record in records) {
  //       log('Inserted Record: $record'); // Log each inserted record
  //     }
  //   } catch (e) {
  //     log('Error fetching inserted notification data: $e');
  //   }
  // }

  //*******************************task_summary_doc********************** */
  //task_summary_doc==http://localhost:3000/api/v1/tasks/getTaskSummaryDocs/wdRwzBOuHJFE67lvA
  Future<void> _createTaskSummaryDocTable(Database db) async {
    try {
      await db.execute('''
      CREATE TABLE task_summary_doc (
        task_summary_doc_id INTEGER PRIMARY KEY AUTOINCREMENT,
        task_summary_doc_key TEXT NOT NULL,
        task_summary_id INTEGER NOT NULL,
        task_summary_key TEXT NOT NULL,
        doc_title TEXT NOT NULL,
        doc_name TEXT NOT NULL,
        status INTEGER NOT NULL,
        verification INTEGER NOT NULL DEFAULT 0,
        sync_date DATETIME NOT NULL
      )
    ''');
      log('task_summary_doc table created successfully');
    } catch (e) {
      log('Error creating task_summary_doc table: $e');
    }
  }

  Future<void> insertTaskSummaryDocs(List<TaskSummaryDocModel> docList) async {
    final db = await database; // Get the database instance

    try {
      Batch batch = db.batch();

      for (var doc in docList) {
        batch.insert(
          'task_summary_doc',
          doc.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }

      log('Inserted ${docList.length} Task Summary Document entries');
      await batch.commit(noResult: true); // For better performance
      // await printInsertedTaskSummaryDocData();
    } catch (e) {
      log('Error inserting task summary documents: $e');
    }
  }

  //*************************task_summary_status************************ */
  //task_summary_status==http://localhost:3000/api/v1/tasks/getTaskSummarys/2iWl8WhvhHjH8Wth8
  Future<void> _createTaskSummaryStatusTable(Database db) async {
    try {
      await db.execute('''
      CREATE TABLE task_summary_status (
        task_summary_id INTEGER PRIMARY KEY AUTOINCREMENT,
        task_summary_key TEXT NOT NULL,
        task_inspection_key TEXT NOT NULL,
        complete_date DATE NOT NULL,
        completed_by TEXT NOT NULL,
        reported_user_signature INTEGER NOT NULL DEFAULT 0,
        user_no_of_signature INTEGER NOT NULL DEFAULT 0,
        next_days DATE DEFAULT NULL,
        last_days DATE DEFAULT NULL,
        task_status INTEGER NOT NULL,
        task_id INTEGER NOT NULL,
        task_key TEXT NOT NULL,
        total_item INTEGER NOT NULL,
        pass INTEGER NOT NULL,
        fail INTEGER NOT NULL,
        not_found INTEGER NOT NULL,
        no_access INTEGER NOT NULL,
        corrective_action INTEGER NOT NULL DEFAULT 0,
        corrective INTEGER NOT NULL DEFAULT 0,
        assigned_to INTEGER NOT NULL DEFAULT 0,
        critical INTEGER NOT NULL DEFAULT 0,
        overdue_days REAL NOT NULL DEFAULT 0,
        overdue_hours REAL NOT NULL DEFAULT 0,
        status INTEGER NOT NULL,
        valid_days INTEGER NOT NULL DEFAULT 0,
        summary_date DATETIME NOT NULL,
        inspection_comment TEXT DEFAULT NULL,
        inspector_signature TEXT DEFAULT NULL,
        inspector_name TEXT DEFAULT NULL,
        approval_name TEXT DEFAULT NULL,
        approval_signature TEXT DEFAULT NULL,
        PIC TEXT DEFAULT NULL,
        PIC_no TEXT DEFAULT NULL,
        PTW_number TEXT DEFAULT NULL,
        task_inspection_type INTEGER NOT NULL DEFAULT 1,
        hours_on_completion REAL NOT NULL DEFAULT 0,
        next_completion_hrs REAL NOT NULL DEFAULT 0,
        location INTEGER NOT NULL DEFAULT 0,
        standard_ref TEXT DEFAULT NULL,
        verification INTEGER NOT NULL DEFAULT 3,
        sync_date DATETIME NOT NULL
      );
    ''');
      log('task_summary_status table created successfully');
    } catch (e) {
      log('Error creating task_summary_status table: $e');
    }
  }

  Future<void> insertTaskSummaryStatus(
      List<TaskSummaryStatusModel> statusList) async {
    final db = await database; // Get the database instance

    try {
      Batch batch = db.batch();

      for (var status in statusList) {
        batch.insert(
          'task_summary_status',
          status.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }

      log('Inserted ${statusList.length} Task Summary Status entries');
      await batch.commit(noResult: true); // For better performance
      // await printInsertedTaskSummaryStatusData();
    } catch (e) {
      log('Error inserting task summary status: $e');
    }
  }

  //*************************task_workscope_cert_indicator************************ */

  //task_workscope_cert_indicator==http://localhost:3000/api/v1/tasks/getTaskWorkscopeCertIndicator/IgJnkuf13yggQFI8R
  Future<void> _createTaskWorkscopeCertIndicatorTable(Database db) async {
    try {
      await db.execute('''
      CREATE TABLE task_workscope_cert_indicator (
        task_workscope_cert_indicator_id INTEGER PRIMARY KEY AUTOINCREMENT,
        task_workscope_cert_indicator_key TEXT NOT NULL,
        task_workscope_id INTEGER NOT NULL,
        task_workscope_key TEXT NOT NULL,
        equipment_id INTEGER NOT NULL,
        equipment_key TEXT NOT NULL,
        certificate_indicator_id INTEGER NOT NULL,
        measure REAL NOT NULL,
        comment TEXT NOT NULL,
        inspection_date DATETIME DEFAULT NULL,
        indicator_status INTEGER NOT NULL,
        inspection_by TEXT NOT NULL,
        status INTEGER NOT NULL,
        is_deleted INTEGER NOT NULL,
        sync_date DATETIME NOT NULL
      );
    ''');
      log('task_workscope_cert_indicator table created successfully');
    } catch (e) {
      log('Error creating task_workscope_cert_indicator table: $e');
    }
  }

// Insert Task Workscope Cert Indicator data
  Future<void> insertTaskWorkscopeCertIndicators(
      List<TaskWorkscopeCertIndicatorModel> indicatorList) async {
    final db = await database; // Get the database instance

    try {
      Batch batch = db.batch();

      for (var indicator in indicatorList) {
        batch.insert(
          'task_workscope_cert_indicator',
          indicator.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }

      log('Inserted ${indicatorList.length} Task Workscope Cert Indicator entries');
      //  await printInsertedTaskWorkscopeCertIndicatorData();
      await batch.commit(noResult: true); // For better performance
    } catch (e) {
      log('Error inserting task workscope cert indicator: $e');
    }
  }

  // // Print function for Task Workscope Cert Indicator data
  // Future<void> printInsertedTaskWorkscopeCertIndicatorData() async {
  //   final db = await database; // Get the database instance

  //   try {
  //     final List<Map<String, dynamic>> records =
  //         await db.query('task_workscope_cert_indicator');

  //     for (var record in records) {
  //       log('Inserted Task Workscope Cert Indicator Record: $record'); // Log each inserted record
  //     }
  //   } catch (e) {
  //     log('Error fetching inserted Task Workscope Cert Indicator data: $e');
  //   }
//**************************** task_workscope_item************************************************ */
// task_workscope_item==http://localhost:3000/api/v1/tasks/getTaskWorkscopeItems/13jiPDYTFqiYkE4pI
  Future<void> _createTaskWorkscopeItemTable(Database db) async {
    try {
      await db.execute('''
      CREATE TABLE task_workscope_item (
        task_workscope_id INTEGER PRIMARY KEY AUTOINCREMENT,
        task_workscope_key TEXT NOT NULL,
        task_equipment_id INTEGER NOT NULL,
        task_equipment_key TEXT NOT NULL,
        task_workscope_specific_id INTEGER NOT NULL,
        task_workscope_specific_key TEXT NOT NULL,
        task_id INTEGER NOT NULL,
        task_key TEXT NOT NULL,
        frm_equipment_id INTEGER NOT NULL,
        equipment_id INTEGER NOT NULL,
        equipment_key TEXT NOT NULL,
        cert_id INTEGER NOT NULL,
        equipment_cert_key TEXT NOT NULL,
        work_start_date DATETIME DEFAULT NULL,
        work_end_date DATETIME DEFAULT NULL,
        is_unexpirable INTEGER NOT NULL,
        is_approved INTEGER NOT NULL,
        approved_by INTEGER NOT NULL,
        is_deleted TINYINT NOT NULL,
        cert_checkbox INTEGER NOT NULL DEFAULT 0,
        corrective_id INTEGER NOT NULL DEFAULT 0,
        corrective_key TEXT DEFAULT NULL,
        created_by INTEGER NOT NULL,
        created_on DATETIME NOT NULL,
        updated_by INTEGER NOT NULL,
        updated_on DATETIME NOT NULL,
        sync_date DATETIME NOT NULL
      );
    ''');
      log('task_workscope_item table created successfully');
    } catch (e) {
      log('Error creating task_workscope_item table: $e');
    }
  }

  Future<void> insertTaskWorkscopeItems(
      List<TaskWorkscopeItemModel> itemList) async {
    final db = await database; // Get the database instance

    try {
      Batch batch = db.batch();

      for (var item in itemList) {
        batch.insert(
          'task_workscope_item',
          item.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }

      log('Inserted ${itemList.length} Task Workscope Items entries');
      //await printInsertedTaskWorkscopeItemData();
      await batch.commit(noResult: true); // For better performance
    } catch (e) {
      log('Error inserting task workscope items: $e');
    }
  }

  //***************************task_workscope_item_inspection************************** */
  //task_workscope_item_inspection== http://localhost:3000/api/v1/tasks/getTaskWorkscopeItemInspections
  Future<void> _createTaskWorkscopeItemInspectionTable(Database db) async {
    try {
      await db.execute('''
      CREATE TABLE task_workscope_item_inspection (
        task_workscope_item_inspection_id INTEGER PRIMARY KEY AUTOINCREMENT,
        task_workscope_item_inspection_key TEXT NOT NULL,
        task_workscope_id INTEGER NOT NULL,
        task_workscope_key TEXT NOT NULL,
        inspection_date DATETIME DEFAULT NULL,
        inspection_status INTEGER NOT NULL,
        indicator_status INTEGER NOT NULL DEFAULT 0, -- 0 = Not found, 1 = Pending, 2 = Pass, 3 = Reject
        comment TEXT NOT NULL,
        inspection_by TEXT NOT NULL,
        inspectionar_signature TEXT NOT NULL,
        is_published INTEGER NOT NULL,
        is_deleted INTEGER NOT NULL,
        sync_date DATETIME NOT NULL
      )
    ''');
      log('task_workscope_item_inspection table created successfully');
    } catch (e) {
      log('Error creating task_workscope_item_inspection table: $e');
    }
  }

  Future<void> insertTaskWorkscopeItemInspections(
      List<TaskWorkscopeItemInspectionModel> inspectionList) async {
    final db = await database; // Get the database instance

    try {
      Batch batch = db.batch();

      for (var inspection in inspectionList) {
        batch.insert(
          'task_workscope_item_inspection',
          inspection.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
      await printInsertedTaskWorkscopeItemInspectionData();
      await batch.commit(noResult: true); // For better performance
      log('Inserted ${inspectionList.length} Task Workscope Item Inspections');
    } catch (e) {
      log('Error inserting task workscope item inspections: $e');
    }
  }

  Future<void> printInsertedTaskWorkscopeItemInspectionData() async {
    final db = await database; // Get the database instance

    try {
      final List<Map<String, dynamic>> records =
          await db.query('task_workscope_item_inspection');

      for (var record in records) {
        log('Inserted Record: $record'); // Log each inserted record
      }
    } catch (e) {
      log('Error fetching inserted task workscope item inspection data: $e');
    }
  }

  //*************************task_workscope_specific_equipment************************ */
  // task_workscope_specific_equipment==http://localhost:3000/api/v1/tasks/getTaskWorkscopeSpecificEquipment/9f6YHLau8WVwvuGXF
  Future<void> _createTaskWorkscopeSpecificEquipmentTable(Database db) async {
    try {
      await db.execute('''
      CREATE TABLE task_workscope_specific_equipment (
        task_workscope_specific_id INTEGER PRIMARY KEY AUTOINCREMENT,
        task_workscope_specific_key TEXT NOT NULL,
        task_id INTEGER NOT NULL,
        task_key TEXT NOT NULL,
        workscope_specific_serial_rfid TEXT NOT NULL,
        equipment_id INTEGER NOT NULL,
        equipment_key TEXT NOT NULL,
        cert_id INTEGER NOT NULL,
        equipment_cert_key TEXT NOT NULL,
        created_by INTEGER NOT NULL,
        created_on DATETIME NOT NULL,
        updated_by INTEGER NOT NULL,
        updated_on DATETIME NOT NULL,
        status INTEGER NOT NULL DEFAULT 1,
        sync_date DATETIME NOT NULL
      );
    ''');
      log('task_workscope_specific_equipment table created successfully');
    } catch (e) {
      log('Error creating task_workscope_specific_equipment table: $e');
    }
  }

  Future<void> insertTaskWorkscopeSpecificEquipment(
      List<TaskWorkscopeSpecificEquipmentModel> equipmentList) async {
    final db = await database; // Get the database instance

    try {
      Batch batch = db.batch();

      for (var equipment in equipmentList) {
        batch.insert(
          'task_workscope_specific_equipment',
          equipment.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
      //await printInsertedTaskWorkscopeEquip();

      log('Inserted  ${equipmentList.length} Task Workscope Specific Equipment entries');
      await batch.commit(noResult: true); // For better performance
    } catch (e) {
      log('Error inserting task workscope specific equipment: $e');
    }
  }

  // // Print function for Task Workscope Cert Indicator data
  // Future<void> printInsertedTaskWorkscopeEquip() async {
  //   final db = await database; // Get the database instance

  //   try {
  //     final List<Map<String, dynamic>> records =
  //         await db.query('task_workscope_specific_equipment');

  //     for (var record in records) {
  //       log('Inserted Task Workscope specific equip******: $record'); // Log each inserted record
  //     }
  //   } catch (e) {
  //     log('Error fetching inserted specific equip: $e');
  //   }
  // }

  //******************************************** */
  // URL to fetch corrective actions
  // corrective_action == http://localhost:3000/api/v1/equipments/getCorrectiveActions/57
  Future<void> _createEquipmentCorrectiveActionTable(Database db) async {
    try {
      await db.execute('''
      CREATE TABLE corrective_action (
        corrective_id INTEGER PRIMARY KEY NOT NULL,
        corrective_key TEXT NOT NULL,
        equipment_id INTEGER NOT NULL,
        equipment_key TEXT NOT NULL,
        ca_type TEXT NOT NULL,
        ca_type_old TEXT DEFAULT NULL,
        ca_details TEXT NOT NULL,
        date_of_fail DATE NOT NULL,
        found_by TEXT NOT NULL,
        close_out_by DATE NOT NULL,
        ca_status INTEGER DEFAULT 1 CHECK (ca_status IN (1, 2, 3)),
        ca_status_old INTEGER NOT NULL DEFAULT 0,
        assigned_to INTEGER NOT NULL,
        closed_out DATE NOT NULL,
        approved TEXT NOT NULL,
        notes TEXT NOT NULL,
        rel_task_workscope_id INTEGER NOT NULL DEFAULT 0,
        created_by INTEGER NOT NULL,
        created_on DATETIME NOT NULL,
        updated_by INTEGER NOT NULL,
        updated_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        status INTEGER NOT NULL DEFAULT 1,
        verification INTEGER NOT NULL DEFAULT 3,
        stage TEXT NOT NULL,
        sync_date DATETIME NOT NULL
      );
    ''');
      log('corrective_action table created successfully');
    } catch (e) {
      log('Error creating corrective_action table: $e');
    }
  }

  Future<void> insertEquipmentCorrectiveAction(
      List<CorrectiveActionModel> actionList) async {
    final db = await database; // Get the database instance

    try {
      Batch batch = db.batch();

      for (var action in actionList) {
        batch.insert(
          'corrective_action',
          action.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }

      log('Inserted ${actionList.length} Corrective Action entries');
      await batch.commit(noResult: true); // For better performance
      //await printInsertedCorrectiveActionData();
    } catch (e) {
      log('Error inserting corrective action: $e');
    }
  }

  // Future<void> printInsertedCorrectiveActionData() async {
  //   final db = await database; // Get the database instance

  //   try {
  //     final List<Map<String, dynamic>> records =
  //         await db.query('corrective_action');

  //     for (var record in records) {
  //       log('Inserted Corrective Action Record: $record'); // Log each inserted record
  //     }
  //   } catch (e) {
  //     log('Error fetching inserted corrective action data: $e');
  //   }
  // }

  //****************************************888 */
  Future<void> _createEquipmentBasicTable(Database db) async {
    try {
      await db.execute('''
      CREATE TABLE equipment_basic (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        equipment_key TEXT NOT NULL,
        rfid TEXT DEFAULT NULL,
        status INTEGER NOT NULL,
        serial TEXT NOT NULL,
        equ_type TEXT NOT NULL,
        frm_equipment_id INTEGER NOT NULL,
        location INTEGER NOT NULL,
        position TEXT DEFAULT NULL,
        asset_number_sap TEXT NOT NULL,
        link_to_asset TEXT NOT NULL,
        dimension TEXT NOT NULL,
        swl_swp TEXT DEFAULT NULL,
        test_load TEXT DEFAULT NULL,
        wll_mawp TEXT DEFAULT NULL,
        factor_of_safety TEXT DEFAULT NULL,
        model TEXT NOT NULL,
        manufacturer TEXT DEFAULT NULL,
        date_of_manufacturer DATE DEFAULT NULL,
        weight TEXT NOT NULL,
        grid_ref TEXT DEFAULT NULL,
        access TEXT NOT NULL,
        height TEXT DEFAULT NULL,
        nfl INTEGER DEFAULT 0,
        drops INTEGER DEFAULT 0,
        ex INTEGER DEFAULT 0,
        critical INTEGER DEFAULT 0,
        eqgroups INTEGER NOT NULL DEFAULT 0,
        related_components TEXT DEFAULT NULL,
        third_party INTEGER NOT NULL DEFAULT 0,
        api INTEGER NOT NULL DEFAULT 0,
        engine INTEGER NOT NULL DEFAULT 0,
        hose INTEGER NOT NULL DEFAULT 0,
        asset INTEGER NOT NULL DEFAULT 0,
        audited INTEGER NOT NULL DEFAULT 0,
        capital_equipment INTEGER NOT NULL DEFAULT 0,
        confined_space INTEGER NOT NULL,
        current_hrs REAL NOT NULL DEFAULT 0,
        old_current_hrs REAL DEFAULT 0,
        last_current_hrs_reading_date DATE DEFAULT NULL,
        previous_current_hrs REAL NOT NULL DEFAULT 0,
        photo TEXT DEFAULT NULL,
        in_service_po_no TEXT DEFAULT NULL,
        in_service DATE DEFAULT NULL,
        mro TEXT DEFAULT NULL,
        in_service_remove DATE DEFAULT NULL,
        in_service_valid_days INTEGER DEFAULT NULL,
        in_service_is_unexpirable INTEGER DEFAULT NULL,
        lock_id TEXT NOT NULL,
        coc_no TEXT DEFAULT NULL,
        coc_verification INTEGER NOT NULL DEFAULT 3,
        coc_issue_date DATE DEFAULT NULL,
        coc_expiry_date DATE DEFAULT NULL,
        coc_valid_days INTEGER DEFAULT NULL,
        coc_is_unexpirable INTEGER DEFAULT NULL,
        comments TEXT NOT NULL,
        connect_a INTEGER NOT NULL DEFAULT 0,
        connect_b INTEGER NOT NULL DEFAULT 0,
        material TEXT NOT NULL,
        nominal_thickness_mm REAL NOT NULL DEFAULT 0,
        minimum_thickness_mm REAL NOT NULL DEFAULT 0,
        current_reading_mm REAL NOT NULL DEFAULT 0,
        coc_issuer TEXT DEFAULT NULL,
        parent_id INTEGER NOT NULL,
        detail TEXT DEFAULT NULL,
        system TEXT DEFAULT NULL,
        is_deleted INTEGER NOT NULL,
        created_by INTEGER NOT NULL,
        updated_by INTEGER NOT NULL,
        created_on DATETIME NOT NULL,
        updated_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        sync_date DATETIME NOT NULL
      );
    ''');
      log('equipment_basic table created successfully');
    } catch (e) {
      log('Error creating equipment_basic table: $e');
    }
  }

  Future<void> insertEquipmentBasic(
      List<EquipmentBasicModel> equipmentList) async {
    final db = await database; // Get the database instance

    try {
      Batch batch = db.batch();

      for (var equipment in equipmentList) {
        batch.insert(
          'equipment_basic',
          equipment.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }

      log('Inserted ${equipmentList.length} Equipment Basic entries');
      await batch.commit(noResult: true); // For better performance
      //  await printInsertedEquipmentBasicData();
    } catch (e) {
      log('Error inserting equipment basic: $e');
    }
  }

  // Future<void> printInsertedEquipmentBasicData() async {
  //   final db = await database; // Get the database instance

  //   try {
  //     final List<Map<String, dynamic>> records =
  //         await db.query('equipment_basic');

  //     for (var record in records) {
  //       log('Inserted Record: $record'); // Log each inserted record
  //     }
  //   } catch (e) {
  //     log('Error fetching inserted equipment basic data: $e');
  //   }
  // }

  //******************************equipment_certificate************ */
  //equipment_certificate==http://localhost:3000/api/v1/equipments/getEquipmentCerts/210
  Future<void> _createEquipmentCertificateTable(Database db) async {
    try {
      await db.execute('''
      CREATE TABLE equipment_certificate (
        cert_id INTEGER PRIMARY KEY AUTOINCREMENT,
        equipment_cert_key TEXT NOT NULL,
        equipment_id INTEGER NOT NULL,
        equipment_key TEXT NOT NULL,
        cert_title TEXT NOT NULL,
        frm_cert_id INTEGER NOT NULL,
        cert_type INTEGER NOT NULL,
        issue_date DATE DEFAULT NULL,
        expiry_date_old DATE DEFAULT NULL,
        expiry_date DATE DEFAULT NULL,
        current REAL NOT NULL DEFAULT 0,
        last REAL NOT NULL DEFAULT 0,
        remaining REAL NOT NULL DEFAULT 0,
        cert_valid_days TEXT DEFAULT NULL,
        day_hour TEXT NOT NULL DEFAULT 'd',
        is_unexpirable INTEGER NOT NULL,
        active INTEGER NOT NULL,
        maintenance_task INTEGER NOT NULL DEFAULT 0,
        cert_file TEXT NOT NULL,
        updated_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        updated_by INTEGER NOT NULL,
        status INTEGER NOT NULL DEFAULT 1,
        stage TEXT NOT NULL DEFAULT 'PENDING',
        verification INTEGER NOT NULL DEFAULT 3,
        is_deleted INTEGER NOT NULL,
        sync_date DATETIME NOT NULL
      );
    ''');
      log('equipment_certificate table created successfully');
    } catch (e) {
      log('Error creating equipment_certificate table: $e');
    }
  }

  Future<void> insertEquipmentCertificate(
      List<EquipmentCertificateModel> certList) async {
    final db = await database; // Get the database instance

    try {
      Batch batch = db.batch();

      for (var cert in certList) {
        batch.insert(
          'equipment_certificate',
          cert.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }

      log('Inserted ${certList.length} Equipment Certificate entries');
      await batch.commit(noResult: true); // For better performance
      // await printInsertedEquipmentCertificateData();
    } catch (e) {
      log('Error inserting equipment certificate: $e');
    }
  }

  // Future<void> printInsertedEquipmentCertificateData() async {
  //   final db = await database; // Get the database instance

  //   try {
  //     final List<Map<String, dynamic>> records =
  //         await db.query('equipment_certificate');

  //     for (var record in records) {
  //       log('Inserted Record: $record'); // Log each inserted record
  //     }
  //   } catch (e) {
  //     log('Error fetching inserted equipment certificate data: $e');
  //   }
  // }

//***********************equipment_ex******************* */
//equipment_ex==http://localhost:3000/api/v1/equipments/getEquipmentEx/210
  Future<void> _createEquipmentExTable(Database db) async {
    try {
      await db.execute('''
      CREATE TABLE equipment_ex (
        ex_id INTEGER PRIMARY KEY AUTOINCREMENT,
        ex_key TEXT NOT NULL,
        equipment_id INTEGER NOT NULL,
        equipment_key TEXT NOT NULL,
        ex_id_tag TEXT NOT NULL,
        ex_cable_tag TEXT NOT NULL,
        ex_no_glands TEXT NOT NULL,
        ex_zone TEXT NOT NULL,
        epl_atex_marking TEXT NOT NULL,
        ex_category TEXT NOT NULL,
        ex_division TEXT NOT NULL,
        ex_protection TEXT NOT NULL,
        ex_gas_group TEXT NOT NULL,
        ex_ip_code TEXT NOT NULL,
        ex_standards TEXT DEFAULT NULL,
        ex_pmi TEXT DEFAULT NULL,
        ex_temp_class TEXT NOT NULL,
        ex_ambient_temp TEXT NOT NULL,
        ex_exposure TEXT NOT NULL,
        ex_ESD TEXT NOT NULL,
        ex_cert_no TEXT DEFAULT NULL,
        ex_notified_body TEXT DEFAULT NULL,
        ex_link_to_certificates TEXT DEFAULT NULL,
        ex_general_procedure TEXT DEFAULT NULL,
        ex_special_procedure TEXT DEFAULT NULL,
        ex_image TEXT NOT NULL,
        created_by INTEGER NOT NULL,
        created_on DATETIME NOT NULL,
        updated_by INTEGER NOT NULL,
        updated_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        sync_date DATETIME NOT NULL
      );
    ''');
      log('equipment_ex table created successfully');
    } catch (e) {
      log('Error creating equipment_ex table: $e');
    }
  }

  Future<void> insertEquipmentEx(List<EquipmentExModel> equipmentList) async {
    final db = await database; // Get the database instance

    try {
      Batch batch = db.batch();

      for (var equipment in equipmentList) {
        batch.insert(
          'equipment_ex',
          equipment.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
      //await printInsertedEquipmentEX();
      log('Inserted ${equipmentList.length} Equipment ex entries');

      await batch.commit(noResult: true); // For better performance
    } catch (e) {
      log('Error inserting equipment_ex data: $e');
    }
  }

  // Future<void> printInsertedEquipmentEX() async {
  //   final db = await database; // Get the database instance

  //   try {
  //     final List<Map<String, dynamic>> records = await db.query('equipment_ex');

  //     for (var record in records) {
  //       log('Inserted Record: $record'); // Log each inserted record
  //     }
  //   } catch (e) {
  //     log('Error fetching inserted equipment EX data: $e');
  //   }
  // }

  // Method to create the equipment_standard table
  Future<void> _createEquipmentStandardTable(Database db) async {
    try {
      await db.execute('''
      CREATE TABLE equipment_standard (
        standard_id INTEGER PRIMARY KEY AUTOINCREMENT,
        standard_key TEXT NOT NULL,
        equipment_id INTEGER NOT NULL,
        equipment_key TEXT NOT NULL,
        international_standards TEXT DEFAULT NULL,
        regional_standards TEXT DEFAULT NULL,
        contractor_standards TEXT DEFAULT NULL,
        international_details TEXT DEFAULT NULL,
        regional_details TEXT DEFAULT NULL,
        contractor_details TEXT DEFAULT NULL,
        international_link_to_standard TEXT NOT NULL,
        regional_link_to_standard TEXT NOT NULL,
        contractor_link_to_standard TEXT NOT NULL,
        created_by INTEGER NOT NULL,
        created_on DATETIME NOT NULL,
        updated_by INTEGER NOT NULL,
        updated_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        published INTEGER NOT NULL,
        sync_date DATETIME NOT NULL
      );
    ''');
      log('equipment_standard table created successfully');
    } catch (e) {
      log('Error creating equipment_standard table: $e');
    }
  }

// Method to insert equipment standards
  Future<void> insertEquipmentStandard(
      List<EquipmentStandardModel> standardsList) async {
    final db = await database; // Get the database instance

    try {
      Batch batch = db.batch();

      for (var standard in standardsList) {
        batch.insert(
          'equipment_standard',
          standard.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }

      log('Inserted ${standardsList.length} Equipment Standards entries');
      await batch.commit(noResult: true); // For better performance
      // await printInsertedEquipmentStandardData();
    } catch (e) {
      log('Error inserting equipment standards: $e');
    }
  }

// Optional: Method to print inserted equipment standard data
  // Future<void> printInsertedEquipmentStandardData() async {
  //   final db = await database; // Get the database instance

  //   try {
  //     final List<Map<String, dynamic>> records =
  //         await db.query('equipment_standard');

  //     for (var record in records) {
  //       log('Inserted Record: $record'); // Log each inserted record
  //     }
  //   } catch (e) {
  //     log('Error fetching inserted equipment standard data: $e');
  //   }
  // }

//***********************equipment_drops************************* */
//equipment_drops==http://localhost:3000/api/v1/equipments/getEquipmentDrops/210
  // Function to create the equipment_drops table
  Future<void> _createEquipmentDropsTable(Database db) async {
    try {
      await db.execute('''
      CREATE TABLE equipment_drops (
        dropid INTEGER PRIMARY KEY AUTOINCREMENT,
        drop_key TEXT NOT NULL,
        equipment_id INTEGER NOT NULL,
        equipment_key TEXT NOT NULL,
        drop_id TEXT NOT NULL,
        drop_zone TEXT NOT NULL,
        drop_frequency TEXT NOT NULL,
        drop_standards TEXT NOT NULL,
        drop_primary_fixing TEXT DEFAULT NULL,
        drop_secondary_retention TEXT DEFAULT NULL,
        drop_safety_securing INTEGER NOT NULL,
        drop_safety_securing_other TEXT NOT NULL,
        drop_safety_securing_old TEXT DEFAULT NULL,
        drop_safety_securing_sn TEXT NOT NULL,
        drop_inspection_procedure TEXT DEFAULT NULL,
        drop_photo TEXT NOT NULL,
        created_by INTEGER NOT NULL,
        created_on DATETIME NOT NULL,
        updated_by INTEGER NOT NULL,
        updated_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        sync_date DATETIME NOT NULL
      );
    ''');
      log('equipment_drops table created successfully');
    } catch (e) {
      log('Error creating equipment_drops table: $e');
    }
  }

// Function to insert records into equipment_drops table
  Future<void> insertEquipmentDrops(List<EquipmentDropModel> dropsList) async {
    final db = await database; // Get the database instance

    try {
      Batch batch = db.batch();

      for (var drop in dropsList) {
        batch.insert(
          'equipment_drops',
          drop.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }

      log('Inserted ${dropsList.length} Equipment Drops entries');
      // await printInsertedEquipmentDropData();
      await batch.commit(noResult: true); // For better performance
    } catch (e) {
      log('Error inserting equipment drops: $e');
    }
  }

  // Future<void> printInsertedEquipmentDropData() async {
  //   final db = await database; // Get the database instance

  //   try {
  //     final List<Map<String, dynamic>> records =
  //         await db.query('equipment_drops');

  //     for (var record in records) {
  //       log('Inserted drops Record ********: $record'); // Log each inserted record
  //     }
  //   } catch (e) {
  //     log('Error fetching inserted equipment drops data: $e');
  //   }
  // }
}
