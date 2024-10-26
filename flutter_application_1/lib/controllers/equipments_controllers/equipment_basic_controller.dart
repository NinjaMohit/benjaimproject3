import 'package:flutter_application_1/models/equipments_models/equipment_basic_model.dart';
import 'package:get/get.dart';
import '../../database/db_helper.dart';
import '../../services/api_services.dart';

class EquipmentBasicController extends GetxController {
  var equipmentBasicList =
      <EquipmentBasicModel>[].obs; // Observable list of task equipment basics
  final DBHelper dbHelper = DBHelper(); // Database helper instance
  var isLoading = false.obs; // Loading indicator

  final ApiService apiService =
      ApiService(); // Create an instance of ApiService

  // Fetch task equipment basics from API and store them in local database
  Future<void> fetchEquipmentBasics() async {
    isLoading.value = true; // Set loading to true when fetching starts

    try {
      // Call the API service method to fetch task equipment basics
      final List<dynamic>? fetchedEquipment =
          await apiService.fetchEquipmentBasic();

      if (fetchedEquipment != null && fetchedEquipment.isNotEmpty) {
        equipmentBasicList.value = fetchedEquipment
            .map((json) =>
                EquipmentBasicModel.fromJson(json)) // Convert JSON to model
            .toList();

        // Insert fetched task equipment basics into the database in batch
        await dbHelper.insertEquipmentBasic(
            equipmentBasicList); // Method to insert into DB
      } else {
        throw Exception('No task equipment basics fetched');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load task equipment basics');
    } finally {
      isLoading.value = false; // Set loading to false after fetching is done
    }
  }
}
