import 'package:get/get.dart';

import '../../database/db_helper.dart';
import '../../models/framework-models/framework_certificate_indicator_model.dart';
import '../../services/api_services.dart';

class FrameworkCertificateIndicatorController extends GetxController {
  var certificateIndicatorsList = <FrameworkCertIndicatorModel>[]
      .obs; // Observable list of certificate indicators
  final DBHelper dbHelper = DBHelper(); // Database helper instance
  var isLoading = false.obs; // Loading indicator

  final ApiService apiService =
      ApiService(); // Create an instance of ApiService

  // Fetch certificate indicators from API and store in local database
  Future<void> fetchFrameworkCertificateIndicators() async {
    isLoading.value = true;

    try {
      // Call the fetchFrameworkCertificateIndicators method from ApiService
      final List<dynamic>? fetchedIndicators =
          await apiService.fetchFrameworkCertificateIndicators();

      if (fetchedIndicators != null && fetchedIndicators.isNotEmpty) {
        certificateIndicatorsList.value = fetchedIndicators
            .map((json) => FrameworkCertIndicatorModel.fromJson(json))
            .toList();

        // Insert fetched certificate indicators into the database in batch
        await dbHelper.insertCertificateIndicators(certificateIndicatorsList);
      } else {
        throw Exception('No certificate indicators fetched');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load certificate indicators');
    } finally {
      isLoading.value = false;
    }
  }
}
