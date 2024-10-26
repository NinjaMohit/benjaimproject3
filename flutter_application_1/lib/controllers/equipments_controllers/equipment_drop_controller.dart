import 'package:get/get.dart';
import '../../database/db_helper.dart';
import '../../models/equipments_models/equipment_drop_model.dart';
import '../../services/api_services.dart';

class EquipmentDropController extends GetxController {
  var equipmentDropList =
      <EquipmentDropModel>[].obs; // Observable list of equipment drops
  final DBHelper dbHelper = DBHelper(); // Database helper instance
  var isLoading = false.obs; // Loading indicator

  final ApiService apiService = ApiService(); // API service instance

  // Fetch equipment drop data from API and store in local database
  Future<void> fetchEquipmentDrops() async {
    isLoading.value = true; // Set loading to true when fetching starts

    try {
      // Call the API service method to fetch equipment drop data
      final List<dynamic>? fetchedDrops =
          await apiService.fetchEquipmentDrops();

      if (fetchedDrops != null && fetchedDrops.isNotEmpty) {
        equipmentDropList.value = fetchedDrops
            .map((json) => EquipmentDropModel.fromJson(json))
            .toList();

        // Insert fetched equipment drops into the database in batch
        await dbHelper.insertEquipmentDrops(equipmentDropList);
      } else {
        throw Exception('No equipment drops fetched');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load equipment drops');
    } finally {
      isLoading.value = false; // Set loading to false after fetching is done
    }
  }
}
