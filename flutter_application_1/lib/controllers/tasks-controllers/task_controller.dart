// import 'dart:developer';

// import 'package:get/get.dart';
// import '../../database/db_helper.dart';
// import '../../models/task-models/task_model.dart';
// import '../../services/api_services.dart';

// class TaskController extends GetxController {
//   var taskList = <TaskModel>[].obs; // Observable list of tasks
//   var filteredTaskList =
//       <TaskModel>[].obs; // Observable list for filtered tasks
//   var isLoading = false.obs; // Loading indicator
//   var searchKeyword = ''.obs; // Observable search keyword

//   final DBHelper dbHelper = DBHelper(); // Database helper instance
//   final ApiService apiService = ApiService(); // API service instance

//   // Task status and type maps
//   final Map<String, String> taskStatus = {
//     "1": "Pending",
//     "2": "Completed",
//     "3": "Overdue",
//     "4": "Expiring",
//   };

//   final Map<String, String> taskTypes = {
//     "1": "Inspection",
//     "2": "Auto Maintenance",
//     "3": "Maintenance",
//     "4": "Preservation",
//     "5": "System Alert",
//     "6": "Repair",
//   };

//   var selectedStatus = "1".obs;
//   var selectedType = "1".obs;

//   // Update selected status or type
//   void updateStatus(String value) => selectedStatus.value = value;
//   void updateType(String value) => selectedType.value = value;

//   // Fetch tasks from API and store in SQLite database
//   Future<void> fetchTasks() async {
//     isLoading.value = true;
//     try {
//       final List<dynamic>? fetchedTasks = await apiService.fetchTask();
//       if (fetchedTasks != null && fetchedTasks.isNotEmpty) {
//         final tasks =
//             fetchedTasks.map((json) => TaskModel.fromJson(json)).toList();
//         taskList.value = tasks;
//         await dbHelper.insertTasks(taskList); // Store in local DB
//         await loadLocalTask();
//       } else {
//         taskList.clear();
//         throw Exception('No tasks fetched');
//       }
//     } catch (e) {
//       print('Error: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   // Fetch all task inspection types from the local database
//   Future<void> loadLocalTask() async {
//     final List<TaskModel> localTask = await dbHelper.getAllTask();
//     taskList.value = localTask;
//     filterTasksByTitle(); // Ensure filtered task list is updated when loading tasks
//     print("Fetched task inspection types from local database:");
//     for (var task in taskList) {
//       log("----------------------------------------+${task.toJson()}");
//     }
//     log("${taskList.length}");
//   }

//   // Filter tasks based on the search keyword
//   void filterTasksByTitle() {
//     if (searchKeyword.value.isEmpty) {
//       filteredTaskList.value = taskList; // Show all tasks if no search input
//     } else {
//       filteredTaskList.value = taskList
//           .where((task) => task.title
//               .toLowerCase()
//               .contains(searchKeyword.value.toLowerCase()))
//           .toList();
//     }
//   }

//   // Update search keyword and filter tasks
//   void updateSearchKeyword(String keyword) {
//     searchKeyword.value = keyword;
//     filterTasksByTitle(); // Call filter whenever searchKeyword changes
//   }

//   @override
//   void onInit() {
//     super.onInit();
//     // Set up listener for searchKeyword to trigger filtering
//     searchKeyword.listen((_) {
//       filterTasksByTitle();
//     });
//   }
// }
import 'dart:developer';

import 'package:get/get.dart';
import '../../database/db_helper.dart';
import '../../models/task-models/task_model.dart';
import '../../services/api_services.dart';

class TaskController extends GetxController {
  // Observable lists
  var taskList = <TaskModel>[].obs; // All tasks
  var filteredTaskList = <TaskModel>[].obs; // Filtered tasks

  // Loading indicator
  var isLoading = false.obs;

  // Observables for search keyword and dropdown filters
  var searchKeyword = ''.obs;
  var selectedStatus = ''.obs; // Selected task status
  var selectedType = ''.obs; // Selected task type

  // Task status and type maps
  final Map<String, String> taskStatus = {
    "1": "Pending",
    "2": "Completed",
    "3": "Overdue",
    "4": "Expiring",
  };

  final Map<String, String> taskTypes = {
    "1": "Inspection",
    "2": "Auto Maintenance",
    "3": "Maintenance",
    "4": "Preservation",
    "5": "System Alert",
    "6": "Repair",
  };

  final DBHelper dbHelper = DBHelper(); // Database helper
  final ApiService apiService = ApiService(); // API service instance

  // Fetch tasks from API and store in SQLite
  Future<void> fetchTasks() async {
    isLoading.value = true;
    try {
      final List<dynamic>? fetchedTasks = await apiService.fetchTask();
      if (fetchedTasks != null && fetchedTasks.isNotEmpty) {
        final tasks =
            fetchedTasks.map((json) => TaskModel.fromJson(json)).toList();
        taskList.value = tasks;
        await dbHelper.insertTasks(taskList); // Store tasks in local DB
        await loadLocalTask(); // Load from local DB for filtering
      } else {
        taskList.clear();
        throw Exception('No tasks fetched');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Load tasks from local database
  Future<void> loadLocalTask() async {
    final List<TaskModel> localTask = await dbHelper.getAllTask();
    taskList.value = localTask;
    applyFilters(); // Apply filters on loading tasks
    print("Fetched tasks from local database:");
    for (var task in taskList) {
      log("----------------------------------------+${task.toJson()}");
    }
    log("${taskList.length}");
  }

  // Apply all filters (search, status, and type)
  void applyFilters() {
    filteredTaskList.value = taskList.where((task) {
      // Match title (if searchKeyword is not empty)
      final matchesTitle = searchKeyword.value.isEmpty ||
          task.title.toLowerCase().contains(searchKeyword.value.toLowerCase());

      // Match status (if selectedStatus is not empty)
      final matchesStatus = selectedStatus.value.isEmpty ||
          task.taskStatus.toString() == selectedStatus.value;

      // Match type (if selectedType is not empty)
      final matchesType = selectedType.value.isEmpty ||
          task.taskType.toString() == selectedType.value;

      // Return true only if all conditions match
      return matchesTitle && matchesStatus && matchesType;
    }).toList();
  }

  // Update search keyword and reapply filters
  void updateSearchKeyword(String keyword) {
    searchKeyword.value = keyword;
    applyFilters();
  }

  // Update selected task status and reapply filters
  void updateStatus(String status) {
    selectedStatus.value = status;
    applyFilters();
  }

  // Update selected task type and reapply filters
  void updateType(String type) {
    selectedType.value = type;
    applyFilters();
  }

  @override
  void onInit() {
    super.onInit();
    // Set up listeners to trigger filtering on observable changes
    searchKeyword.listen((_) => applyFilters());
    selectedStatus.listen((_) => applyFilters());
    selectedType.listen((_) => applyFilters());
  }
}
