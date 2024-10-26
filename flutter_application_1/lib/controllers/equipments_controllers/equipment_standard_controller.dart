import 'package:get/get.dart';
import '../../database/db_helper.dart';
import '../../models/equipments_models/equipment_standart_model.dart';
import '../../services/api_services.dart';

class EquipmentStandardController extends GetxController {
  var equipmentStandardList =
      <EquipmentStandardModel>[].obs; // Observable list of equipment standards
  final DBHelper dbHelper = DBHelper(); // Database helper instance
  var isLoading = false.obs; // Loading indicator

  final ApiService apiService =
      ApiService(); // Create an instance of ApiService

  // Fetch equipment standards from API and store them in local database
  Future<void> fetchEquipmentStandards() async {
    isLoading.value = true; // Set loading to true when fetching starts

    try {
      // Call the API service method to fetch equipment standards
      final List<dynamic>? fetchedStandards =
          await apiService.fetchEquipmentStandard();

      if (fetchedStandards != null && fetchedStandards.isNotEmpty) {
        equipmentStandardList.value = fetchedStandards
            .map((json) => EquipmentStandardModel.fromJson(json))
            .toList();

        // Insert fetched equipment standards into the database in batch
        await dbHelper.insertEquipmentStandard(equipmentStandardList);
      } else {
        throw Exception('No equipment standards fetched');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load equipment standards');
    } finally {
      isLoading.value = false; // Set loading to false after fetching is done
    }
  }
}
