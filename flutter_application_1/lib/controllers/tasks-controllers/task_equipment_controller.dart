// import 'package:get/get.dart';

// import '../../database/db_helper.dart';
// import '../../models/task-models/task_equipment_model.dart';
// import '../../services/api_services.dart';

// class TaskEquipmentController extends GetxController {
//   var taskEquipmentList =
//       <TaskEquipmentModel>[].obs; // Observable list of task equipment
//   final DBHelper dbHelper = DBHelper(); // Database helper instance
//   var isLoading = false.obs; // Loading indicator

//   final ApiService apiService =
//       ApiService(); // Create an instance of ApiService

//   // Fetch task equipment from API and store in local database
//   Future<void> fetchTaskEquipment() async {
//     isLoading.value = true; // Set loading to true when fetching starts

//     try {
//       // Call the fetchTaskEquipment method from ApiService
//       final List<dynamic>? fetchedTaskEquipment =
//           await apiService.fetchTaskEquipment();

//       if (fetchedTaskEquipment != null && fetchedTaskEquipment.isNotEmpty) {
//         // Parse the fetched equipment data and map to model
//         taskEquipmentList.value = fetchedTaskEquipment
//             .map((json) => TaskEquipmentModel.fromJson(json))
//             .toList();

//         // Insert fetched task equipment into the database in batch
//         await dbHelper.insertTaskEquipment(taskEquipmentList);
//       } else {
//         throw Exception('No task equipment fetched');
//       }
//     } catch (e) {
//       print('Error: $e');
//       throw Exception('Failed to load task equipment');
//     } finally {
//       isLoading.value = false; // Set loading to false after fetching is done
//     }
//   }
// }
