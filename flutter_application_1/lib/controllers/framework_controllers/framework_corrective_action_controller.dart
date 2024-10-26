import 'package:get/get.dart';

import '../../database/db_helper.dart';
import '../../models/framework-models/framework_corrective_action_model.dart';
import '../../services/api_services.dart';

class FrameworkCorrectiveActionController extends GetxController {
  var correctiveActionsList = <FrameworkCorrectiveActionModel>[]
      .obs; // Observable list of corrective actions
  final DBHelper dbHelper = DBHelper(); // Database helper instance
  var isLoading = false.obs; // Loading indicator

  final ApiService apiService =
      ApiService(); // Create an instance of ApiService

  // Fetch corrective actions from API and store in local database
  Future<void> fetchFrameworkCorrectiveActions() async {
    isLoading.value = true;

    try {
      // Call the fetchCorrectiveActions method from ApiService
      final List<dynamic>? fetchedActions =
          await apiService.fetchFrameworkCorrectiveActions();

      if (fetchedActions != null) {
        correctiveActionsList.value = fetchedActions
            .map((json) => FrameworkCorrectiveActionModel.fromJson(json))
            .toList();

        // Insert fetched corrective actions into the database in batch
        await dbHelper.insertFrameworkCorrectiveActions(correctiveActionsList);
      } else {
        throw Exception('No corrective actions fetched');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load corrective actions');
    } finally {
      isLoading.value = false;
    }
  }
}
