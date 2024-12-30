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
        await loadLocalTaskInspectionTypes();
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

  // Fetch all task inspection types from the local database
  Future<void> loadLocalTaskInspectionTypes() async {
    final List<TaskInspectionTypeModel> localInspectionTypes =
        await dbHelper.getAllTaskInspectionTypes();
    taskInspectionTypesList.value = localInspectionTypes;
    // print("Fetched task inspection types from local database:");
    // for (var inspectionType in taskInspectionTypesList) {
    //   log("----------------------------------------+${inspectionType.toJson()}");
    // }
    // log("${taskInspectionTypesList.length}");
  }

  // Insert a single inspection type
  Future<void> addTaskInspectionType(
      TaskInspectionTypeModel inspectionType) async {
    await dbHelper.insertSingleTaskInspectionType(inspectionType);
    taskInspectionTypesList.add(inspectionType); // Update the observable list
  }

  // Update an existing inspection type
  Future<void> updateTaskInspectionType(
      TaskInspectionTypeModel inspectionType) async {
    // Ensure idNo is not null and update the correct instance
    if (inspectionType.idNo != null) {
      try {
        await dbHelper.updateTaskInspectionType(inspectionType);
        int index = taskInspectionTypesList
            .indexWhere((element) => element.idNo == inspectionType.idNo);
        if (index != -1) {
          taskInspectionTypesList[index] =
              inspectionType; // Update the observable list
        }
      } catch (e) {
        print('Update Error: $e'); // Log the error for debugging
        throw Exception('Failed to update task inspection type');
      }
    }
  }

  // Delete an inspection type by id
  Future<void> removeTaskInspectionType(int idNo) async {
    await dbHelper.deleteTaskInspectionType(idNo);
    taskInspectionTypesList.removeWhere((element) => element.idNo == idNo);
    // Update the observable list
  }
}
