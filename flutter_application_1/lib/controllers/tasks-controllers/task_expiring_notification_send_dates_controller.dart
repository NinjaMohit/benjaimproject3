import 'package:get/get.dart';
import '../../database/db_helper.dart';
import '../../models/task-models/task_expiring_notification_send_dates.dart';
import '../../services/api_services.dart';

class TaskExpiringNotificationSendDateController extends GetxController {
  var taskExpiringNotificationSendDatesList =
      <TaskExpiringNotificationSendDateModel>[]
          .obs; // Observable list of task expiring notification send dates
  final DBHelper dbHelper = DBHelper(); // Database helper instance
  var isLoading = false.obs; // Loading indicator

  final ApiService apiService =
      ApiService(); // Create an instance of ApiService

  // Fetch task expiring notification send dates from API and store in local database
  Future<void> fetchTaskExpiringNotificationsSendDates() async {
    isLoading.value = true; // Set loading to true when fetching starts

    try {
      // Call the fetchTaskExpiringNotificationsSendDates method from ApiService
      final List<dynamic>? fetchedSendDates =
          await apiService.fetchTaskExpiringNotificationsSendDates();

      if (fetchedSendDates != null && fetchedSendDates.isNotEmpty) {
        taskExpiringNotificationSendDatesList.value = fetchedSendDates
            .map((json) => TaskExpiringNotificationSendDateModel.fromJson(json))
            .toList();

        // Insert fetched task expiring notification send dates into the database in batch
        await dbHelper.insertTaskExpiringNotificationSendDates(
            taskExpiringNotificationSendDatesList);
      } else {
        throw Exception('No task expiring notification send dates fetched');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load task expiring notification send dates');
    } finally {
      isLoading.value = false; // Set loading to false after fetching is done
    }
  }
}
