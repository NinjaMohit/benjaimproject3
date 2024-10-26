import 'package:get/get.dart';
import '../../database/db_helper.dart';
import '../../models/task-models/task_workscope_item_model.dart';
import '../../services/api_services.dart';

class TaskWorkscopeItemController extends GetxController {
  var taskWorkscopeItemList =
      <TaskWorkscopeItemModel>[].obs; // Observable list of task workscope items
  final DBHelper dbHelper = DBHelper(); // Database helper instance
  var isLoading = false.obs; // Loading indicator

  final ApiService apiService = ApiService(); // API service instance

  // Fetch task workscope items from API and store them in local database
  Future<void> fetchTaskWorkscopeItems() async {
    isLoading.value = true; // Start loading

    try {
      // Fetch task workscope items from the API
      final List<dynamic>? fetchedItems =
          await apiService.fetchTaskWorkscopeItem();

      if (fetchedItems != null && fetchedItems.isNotEmpty) {
        taskWorkscopeItemList.value = fetchedItems
            .map((json) => TaskWorkscopeItemModel.fromJson(json))
            .toList();

        // Insert the fetched items into the local database
        await dbHelper.insertTaskWorkscopeItems(taskWorkscopeItemList);
      } else {
        throw Exception('No task workscope items fetched');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load task workscope items');
    } finally {
      isLoading.value = false; // Stop loading
    }
  }
}
