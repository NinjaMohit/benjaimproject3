import 'package:get/get.dart';

import '../../database/db_helper.dart';
import '../../models/framework-models/framework_equipment_standard_model.dart';
import '../../services/api_services.dart';

class FrameworkEquipmentStandardController extends GetxController {
  var equipmentStandardList = <FrameworkEquipmentStandardModel>[]
      .obs; // Observable list for equipment standards
  final DBHelper dbHelper = DBHelper(); // Database helper instance
  var isLoading = false.obs; // Loading state

  final ApiService apiService =
      ApiService(); // Create an instance of ApiService

  Future<void> fetchFrameworkEquipmentStandards() async {
    isLoading.value = true; // Set loading to true

    try {
      // Call the fetchFrameworkEquipmentStandards method from ApiService
      final List<dynamic>? fetchedStandards =
          await apiService.fetchFrameworkEquipmentStandards();

      if (fetchedStandards != null) {
        equipmentStandardList.value = fetchedStandards
            .map((json) => FrameworkEquipmentStandardModel.fromJson(json))
            .toList();

        // Insert fetched equipment standards into the database
        await dbHelper.insertFrameworkEquipmentStandard(
            equipmentStandardList); // Use batch insert method
      } else {
        throw Exception('No equipment standards fetched');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load equipment standards');
    } finally {
      isLoading.value = false; // Set loading to false
    }
  }
}
