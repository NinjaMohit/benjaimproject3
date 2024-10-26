import 'package:get/get.dart';
import '../../database/db_helper.dart';
import '../../models/task-models/task_notifications_model.dart';
import '../../services/api_services.dart';

class TaskNotificationController extends GetxController {
  var taskNotificationList =
      <TaskNotificationsModel>[].obs; // Observable list of task notifications
  final DBHelper dbHelper = DBHelper(); // Database helper instance
  var isLoading = false.obs; // Loading indicator

  final ApiService apiService =
      ApiService(); // Create an instance of ApiService

  // Fetch task notifications from API and store in local database
  Future<void> fetchTaskNotifications() async {
    isLoading.value = true; // Set loading to true when fetching starts

    try {
      // Call the fetchTaskExpiringNotificationsSendDates method from ApiService
      final List<dynamic>? fetchedNotifications =
          await apiService.fetchTaskExpiringNotificationsSendDates();

      if (fetchedNotifications != null && fetchedNotifications.isNotEmpty) {
        taskNotificationList.value = fetchedNotifications
            .map((json) => TaskNotificationsModel.fromJson(json))
            .toList();

        // Insert fetched task notifications into the database in batch
        await dbHelper.insertTaskNotification(taskNotificationList);
      } else {
        throw Exception('No task notifications fetched');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load task notifications');
    } finally {
      isLoading.value = false; // Set loading to false after fetching is done
    }
  }
}
