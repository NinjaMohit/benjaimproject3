import 'package:get/get.dart';

import '../../database/db_helper.dart';
import '../../models/framework-models/framework_equipment_basic_model.dart';
import '../../services/api_services.dart';

class FrameworkEquipmentBasicController extends GetxController {
  var equipmentBasicList = <FrameworkEquipmentBasicModel>[]
      .obs; // Observable list for basic equipment
  final DBHelper dbHelper = DBHelper(); // Database helper instance
  var isLoading = false.obs; // Loading state

  final ApiService apiService =
      ApiService(); // Create an instance of ApiService

  Future<void> fetchFrameworkEquipmentBasics() async {
    isLoading.value = true; // Set loading to true

    try {
      // Call the fetchFrameworkEquipmentBasics method from ApiService
      final List<dynamic>? fetchedBasics =
          await apiService.fetchFrameworkEquipmentBasic();

      if (fetchedBasics != null) {
        equipmentBasicList.value = fetchedBasics
            .map((json) => FrameworkEquipmentBasicModel.fromJson(json))
            .toList();

        // Insert fetched equipment basics into the database in bulk
        await dbHelper.insertFrameworkEquipmentBasic(equipmentBasicList);
      } else {
        throw Exception('No equipment basics fetched');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load equipment basics');
    } finally {
      isLoading.value = false; // Set loading to false
    }
  }
}
