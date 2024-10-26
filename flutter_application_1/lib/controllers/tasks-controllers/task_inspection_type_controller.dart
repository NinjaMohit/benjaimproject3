import 'package:get/get.dart';

import '../../database/db_helper.dart';
import '../../models/task-models/task_inspectiontype_model.dart';
import '../../services/api_services.dart';

class TaskInspectionTypeController extends GetxController {
  var taskInspectionTypesList = <TaskInspectionTypeModel>[]
      .obs; // Observable list of task inspection types
  final DBHelper dbHelper = DBHelper(); // Database helper instance
  var isLoading = false.obs; // Loading indicator

  final ApiService apiService =
      ApiService(); // Create an instance of ApiService

  // Fetch task inspection types from API and store in local database
  Future<void> fetchTaskInspectionTypes() async {
    isLoading.value = true; // Set loading to true when fetching starts

    try {
      // Call the fetchTaskInspectionTypes method from ApiService
      final List<dynamic>? fetchedInspectionTypes =
          await apiService.fetchTaskInspectionTypes();

      if (fetchedInspectionTypes != null && fetchedInspectionTypes.isNotEmpty) {
        taskInspectionTypesList.value = fetchedInspectionTypes
            .map((json) => TaskInspectionTypeModel.fromJson(json))
            .toList();

        // Insert fetched task inspection types into the database in batch
        await dbHelper.insertTaskInspectionType(taskInspectionTypesList);
      } else {
        throw Exception('No task inspection types fetched');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load task inspection types');
    } finally {
      isLoading.value = false; // Set loading to false after fetching is done
    }
  }
}
