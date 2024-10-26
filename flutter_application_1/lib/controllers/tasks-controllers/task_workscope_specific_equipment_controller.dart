import 'package:get/get.dart';
import '../../database/db_helper.dart';
import '../../models/task-models/task_workscope_specific_equipment_model.dart';
import '../../services/api_services.dart';

class TaskWorkscopeSpecificEquipmentController extends GetxController {
  var taskWorkscopeSpecificEquipments =
      <TaskWorkscopeSpecificEquipmentModel>[].obs; // Observable list
  final DBHelper dbHelper = DBHelper(); // Database helper instance
  final ApiService apiService = ApiService(); // API service instance
  var isLoading = false.obs; // Loading indicator

  // Fetch task workscope specific equipment data from API and store it in the local database
  Future<void> fetchTaskWorkscopeSpecificEquipments() async {
    isLoading.value = true; // Set loading to true when fetching starts

    try {
      // Fetch data from the API
      final List<dynamic>? fetchedEquipments =
          await apiService.fetchTaskWorkscopeSpecificEquipment();

      if (fetchedEquipments != null && fetchedEquipments.isNotEmpty) {
        // Map fetched data to TaskWorkscopeSpecificEquipmentModel instances
        taskWorkscopeSpecificEquipments.value = fetchedEquipments
            .map((json) => TaskWorkscopeSpecificEquipmentModel.fromJson(json))
            .toList();

        // Insert the fetched data into the database in batch
        await dbHelper.insertTaskWorkscopeSpecificEquipment(
            taskWorkscopeSpecificEquipments);
      } else {
        throw Exception('No Task Workscope Specific Equipments fetched');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load Task Workscope Specific Equipments');
    } finally {
      isLoading.value = false; // Set loading to false after fetching is done
    }
  }
}
