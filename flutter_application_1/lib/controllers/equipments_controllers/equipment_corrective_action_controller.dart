import 'package:get/get.dart';
import '../../database/db_helper.dart';
import '../../models/equipments_models/equipment_corrective_action_model.dart';
import '../../services/api_services.dart';

class EquipmentCorrectiveActionController extends GetxController {
  var correctiveActionList =
      <CorrectiveActionModel>[].obs; // Observable list of corrective actions
  final DBHelper dbHelper = DBHelper(); // Database helper instance
  var isLoading = false.obs; // Loading indicator

  final ApiService apiService =
      ApiService(); // Create an instance of ApiService

  // Fetch corrective actions from API and store them in the local database
  Future<void> fetchEquipmentCorrectiveActions() async {
    isLoading.value = true; // Set loading to true when fetching starts

    try {
      // Call the API service method to fetch corrective actions
      final List<dynamic>? fetchedActions =
          await apiService.fetchEquipmetCorrectiveAction();

      if (fetchedActions != null && fetchedActions.isNotEmpty) {
        correctiveActionList.value = fetchedActions
            .map((json) => CorrectiveActionModel.fromJson(json))
            .toList();

        // Insert fetched corrective actions into the database in batch
        await dbHelper.insertEquipmentCorrectiveAction(correctiveActionList);
      } else {
        throw Exception('No corrective actions fetched');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load corrective actions');
    } finally {
      isLoading.value = false; // Set loading to false after fetching is done
    }
  }
}
