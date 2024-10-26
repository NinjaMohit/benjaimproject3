import 'package:get/get.dart';
import '../../database/db_helper.dart';
import '../../models/task-models/task_workscope_item_inspection_model.dart';
import '../../services/api_services.dart';

class TaskWorkscopeItemInspectionController extends GetxController {
  var taskWorkscopeItemInspectionList = <TaskWorkscopeItemInspectionModel>[]
      .obs; // Observable list of task workscope item inspections
  final DBHelper dbHelper = DBHelper(); // Database helper instance
  var isLoading = false.obs; // Loading indicator

  final ApiService apiService =
      ApiService(); // Create an instance of ApiService

  // Fetch task workscope item inspections from API and store them in local database
  Future<void> fetchTaskWorkscopeItemInspections() async {
    isLoading.value = true; // Set loading to true when fetching starts

    try {
      // Call the API service method to fetch task workscope item inspections
      final List<dynamic>? fetchedInspections =
          await apiService.fetchTaskWorkscopeItemInspection();

      if (fetchedInspections != null && fetchedInspections.isNotEmpty) {
        taskWorkscopeItemInspectionList.value = fetchedInspections
            .map((json) => TaskWorkscopeItemInspectionModel.fromJson(json))
            .toList();

        // Insert fetched task workscope item inspections into the database in batch
        await dbHelper.insertTaskWorkscopeItemInspections(
            taskWorkscopeItemInspectionList);
      } else {
        throw Exception('No task workscope item inspections fetched');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load task workscope item inspections');
    } finally {
      isLoading.value = false; // Set loading to false after fetching is done
    }
  }

  // Print function to display inserted task workscope item inspections
  Future<void> printInsertedTaskWorkscopeItemInspectionData() async {
    final db = await dbHelper.database; // Get the database instance

    try {
      final List<Map<String, dynamic>> records =
          await db.query('task_workscope_item_inspection');

      for (var record in records) {
        print('Inserted Record: $record'); // Log each inserted record
      }
    } catch (e) {
      print('Error fetching inserted task workscope item inspection data: $e');
    }
  }
}
