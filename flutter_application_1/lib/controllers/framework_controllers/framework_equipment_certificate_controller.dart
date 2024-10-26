import 'package:get/get.dart';

import '../../database/db_helper.dart';
import '../../models/framework-models/framework_equipment_certificate_model.dart';
import '../../services/api_services.dart';

class FrameworkEquipmentCertController extends GetxController {
  var equipmentCertsList =
      <FrameworkEquipmentCertModel>[].obs; // Observable list of equipment certs
  final DBHelper dbHelper = DBHelper(); // Database helper instance
  var isLoading = false.obs; // Loading indicator

  final ApiService apiService =
      ApiService(); // Create an instance of ApiService

  // Fetch equipment certifications from API and store in local database
  Future<void> fetchFrameworkEquipmentCerts() async {
    isLoading.value = true;

    try {
      // Call the fetchFrameworkEquipmentCert method from ApiService
      final List<dynamic>? fetchedCerts =
          await apiService.fetchFrameworkEquipmentCert();

      if (fetchedCerts != null) {
        equipmentCertsList.value = fetchedCerts
            .map((json) => FrameworkEquipmentCertModel.fromJson(json))
            .toList();

        // Insert fetched equipment certifications into the database in batch
        await dbHelper.insertFrameworkEquipmentCert(equipmentCertsList);
        print(equipmentCertsList.length);
      } else {
        throw Exception('No equipment certifications fetched');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load equipment certifications');
    } finally {
      isLoading.value = false;
    }
  }
}
