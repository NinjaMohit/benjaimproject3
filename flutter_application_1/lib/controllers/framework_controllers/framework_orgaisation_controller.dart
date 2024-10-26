import 'package:get/get.dart';

import '../../database/db_helper.dart';
import '../../models/framework-models/framework_organisation_model.dart';
import '../../services/api_services.dart';

class FrameworkOrganisationController extends GetxController {
  var frameworkOrganisationsList = <FrameworkOrganisationModel>[]
      .obs; // Observable list of framework organisations
  final DBHelper dbHelper = DBHelper(); // Database helper instance
  var isLoading = false.obs; // Loading indicator

  final ApiService apiService =
      ApiService(); // Create an instance of ApiService

  // Fetch framework organisations from API and store in local database
  Future<void> fetchFrameworkOrganisations() async {
    isLoading.value = true; // Set loading to true when fetching starts

    try {
      // Call the fetchFrameworkOrganisations method from ApiService
      final List<dynamic>? fetchedOrganisations =
          await apiService.fetchFrameworkOrganisations();

      if (fetchedOrganisations != null && fetchedOrganisations.isNotEmpty) {
        frameworkOrganisationsList.value = fetchedOrganisations
            .map((json) => FrameworkOrganisationModel.fromJson(json))
            .toList();

        // Insert fetched framework organisations into the database in batch
        await dbHelper.insertFrameworkOrganisation(frameworkOrganisationsList);
      } else {
        throw Exception('No framework organisations fetched');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load framework organisations');
    } finally {
      isLoading.value = false; // Set loading to false after fetching is done
    }
  }
}
