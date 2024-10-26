import 'package:get/get.dart';
import '../../database/db_helper.dart';
import '../../models/task-models/task_workscope_cert_indicator_model.dart';
import '../../services/api_services.dart';

class TaskWorkscopeCertIndicatorController extends GetxController {
  var taskWorkscopeCertIndicatorList = <TaskWorkscopeCertIndicatorModel>[]
      .obs; // Observable list of task work scope cert indicators
  final DBHelper dbHelper = DBHelper(); // Database helper instance
  var isLoading = false.obs; // Loading indicator

  final ApiService apiService =
      ApiService(); // Create an instance of ApiService

  // Fetch task work scope cert indicators from API and store them in local database
  Future<void> fetchTaskWorkscopeCertIndicator() async {
    isLoading.value = true; // Set loading to true when fetching starts

    try {
      // Call the API service method to fetch task work scope cert indicators
      final List<dynamic>? fetchedIndicators =
          await apiService.fetchTaskWorkscopeCertIndicators();

      if (fetchedIndicators != null && fetchedIndicators.isNotEmpty) {
        taskWorkscopeCertIndicatorList.value = fetchedIndicators
            .map((json) => TaskWorkscopeCertIndicatorModel.fromJson(json))
            .toList();

        // Insert fetched task work scope cert indicators into the database in batch
        await dbHelper
            .insertTaskWorkscopeCertIndicators(taskWorkscopeCertIndicatorList);
      } else {
        throw Exception('No task work scope cert indicators fetched');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load task work scope cert indicators');
    } finally {
      isLoading.value = false; // Set loading to false after fetching is done
    }
  }

  // You can add additional methods for other functionalities such as
  // adding, updating, or deleting task work scope cert indicators as needed
}
