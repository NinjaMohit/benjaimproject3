import 'package:get/get.dart';
import '../../models/task-models/task_expired_notification_model.dart';
import '../../services/api_services.dart';
import '../../database/db_helper.dart';

class TaskExpiredNotificationsController extends GetxController {
  var taskExpiredNotificationList =
      <TaskExpiredNotificationModel>[].obs; // Observable list of notifications
  final DBHelper dbHelper = DBHelper(); // Database helper instance
  var isLoading = false.obs; // Loading indicator

  final ApiService apiService =
      ApiService(); // Create an instance of ApiService

  // Fetch task equipment notifications from API
  Future<void> fetchTaskExpiredNotifications() async {
    isLoading.value = true; // Set loading to true when fetching starts

    try {
      // Call the fetchTaskExpiredNotifications method from ApiService
      final List<dynamic>? fetchedNotifications =
          await apiService.fetchTaskExpiredNotifications();

      if (fetchedNotifications != null && fetchedNotifications.isNotEmpty) {
        // Parse the fetched notifications data and map to model
        taskExpiredNotificationList.value = fetchedNotifications
            .map((json) => TaskExpiredNotificationModel.fromJson(json))
            .toList();

        // Optionally, insert fetched notifications into the database if needed
        await dbHelper
            .insertTaskExpiredNotification(taskExpiredNotificationList);
      } else {
        throw Exception('No task equipment notifications fetched');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load task equipment notifications');
    } finally {
      isLoading.value = false; // Set loading to false after fetching is done
    }
  }
}
