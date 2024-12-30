// import 'package:get/get.dart';
// import '../../database/db_helper.dart';
// import '../../models/task-models/task_summary_doc_model.dart';
// import '../../services/api_services.dart';

// class TaskSummaryDocController extends GetxController {
//   var taskSummaryDocList =
//       <TaskSummaryDocModel>[].obs; // Observable list of task summary docs
//   final DBHelper dbHelper = DBHelper(); // Database helper instance
//   var isLoading = false.obs; // Loading indicator

//   final ApiService apiService =
//       ApiService(); // Create an instance of ApiService

//   // Fetch task summary documents from API and store them in local database
//   Future<void> fetchTaskSummaryDocs() async {
//     isLoading.value = true; // Set loading to true when fetching starts

//     try {
//       // Call the API service method to fetch task summary documents
//       final List<dynamic>? fetchedDocs = await apiService.fetchTaskSummaryDoc();

//       if (fetchedDocs != null && fetchedDocs.isNotEmpty) {
//         taskSummaryDocList.value = fetchedDocs
//             .map((json) => TaskSummaryDocModel.fromJson(json))
//             .toList();

//         // Insert fetched task summary documents into the database in batch
//         await dbHelper.insertTaskSummaryDocs(taskSummaryDocList);
//       } else {
//         throw Exception('No task summary documents fetched');
//       }
//     } catch (e) {
//       print('Error: $e');
//       throw Exception('Failed to load task summary documents');
//     } finally {
//       isLoading.value = false; // Set loading to false after fetching is done
//     }
//   }
// }
