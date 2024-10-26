import 'package:flutter_application_1/models/equipments_models/equipment_ex_model.dart';
import 'package:get/get.dart';
import '../../database/db_helper.dart';
import '../../services/api_services.dart';

class EquipmentExController extends GetxController {
  var equipmentExList =
      <EquipmentExModel>[].obs; // Observable list of EquipmentEx
  final DBHelper dbHelper = DBHelper(); // Database helper instance
  var isLoading = false.obs; // Loading indicator

  final ApiService apiService =
      ApiService(); // Create an instance of ApiService

  // Fetch equipment data from API and store it in the local database
  Future<void> fetchEquipmentEx() async {
    isLoading.value = true; // Set loading to true when fetching starts

    try {
      // Call the API service method to fetch equipment data
      final List<dynamic>? fetchedEquipment =
          await apiService.fetchEquipmentEx();

      if (fetchedEquipment != null && fetchedEquipment.isNotEmpty) {
        equipmentExList.value = fetchedEquipment
            .map((json) => EquipmentExModel.fromJson(json))
            .toList();

        // Insert fetched equipment data into the database in batch
        await dbHelper.insertEquipmentEx(equipmentExList);
      } else {
        throw Exception('No equipment data fetched');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load equipment data');
    } finally {
      isLoading.value = false; // Set loading to false after fetching is done
    }
  }
}
