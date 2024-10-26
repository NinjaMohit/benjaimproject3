import 'package:get/get.dart';

import '../../database/db_helper.dart';
import '../../models/framework-models/framework_certificate_model.dart';
import '../../services/api_services.dart';

class FrameworkCertController extends GetxController {
  var certificatesList =
      <FrameworkCertModel>[].obs; // Observable list for certificates
  final DBHelper dbHelper = DBHelper(); // Database helper instance
  var isLoading = false.obs; // Loading state

  final ApiService apiService =
      ApiService(); // Create an instance of ApiService

  Future<void> fetchCertificates() async {
    isLoading.value = true; // Set loading to true

    try {
      // Call the fetchCertificates method from ApiService
      final List<dynamic>? fetchedCertificates =
          await apiService.fetchCertificates();

      if (fetchedCertificates != null) {
        certificatesList.value = fetchedCertificates
            .map((json) => FrameworkCertModel.fromJson(json))
            .toList();

        // Insert fetched certificates into the database in batch
        await dbHelper.insertFrameworkCertificates(certificatesList);
      } else {
        throw Exception('No certificates fetched');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load certificates');
    } finally {
      isLoading.value = false; // Set loading to false
    }
  }
}
