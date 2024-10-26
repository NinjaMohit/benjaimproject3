import 'package:get/get.dart';
import '../../database/db_helper.dart';
import '../../models/task-models/task_summary_status_model.dart';
import '../../services/api_services.dart';

class TaskSummaryStatusController extends GetxController {
  var taskSummaryStatusList = <TaskSummaryStatusModel>[]
      .obs; // Observable list of task summary statuses
  final DBHelper dbHelper = DBHelper(); // Database helper instance
  var isLoading = false.obs; // Loading indicator

  final ApiService apiService =
      ApiService(); // Create an instance of ApiService

  // Fetch task summary status from API and store them in local database
  Future<void> fetchTaskSummaryStatus() async {
    isLoading.value = true; // Set loading to true when fetching starts

    try {
      // Call the API service method to fetch task summary statuses
      final List<dynamic>? fetchedStatuses =
          await apiService.fetchTaskSummaryStatus();

      if (fetchedStatuses != null && fetchedStatuses.isNotEmpty) {
        taskSummaryStatusList.value = fetchedStatuses
            .map((json) => TaskSummaryStatusModel.fromJson(json))
            .toList();

        // Insert fetched task summary statuses into the database in batch
        await dbHelper.insertTaskSummaryStatus(taskSummaryStatusList);
      } else {
        throw Exception('No task summary statuses fetched');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load task summary statuses');
    } finally {
      isLoading.value = false; // Set loading to false after fetching is done
    }
  }
}
