import 'package:flutter_application_1/models/equipments_models/equipment_certificate_model.dart';
import 'package:get/get.dart';
import '../../database/db_helper.dart';
import '../../services/api_services.dart';

class EquipmentCertificateController extends GetxController {
  var equipmentCertificateList = <EquipmentCertificateModel>[]
      .obs; // Observable list of EquipmentCertificate
  final DBHelper dbHelper = DBHelper(); // Database helper instance
  var isLoading = false.obs; // Loading indicator

  final ApiService apiService =
      ApiService(); // Create an instance of ApiService

  // Fetch equipment certificates from API and store them in the local database
  Future<void> fetchEquipmentCertificates() async {
    isLoading.value = true; // Set loading to true when fetching starts

    try {
      // Call the API service method to fetch equipment certificates
      final List<dynamic>? fetchedCertificates =
          await apiService.fetchEquipmentCertificate();

      if (fetchedCertificates != null && fetchedCertificates.isNotEmpty) {
        equipmentCertificateList.value = fetchedCertificates
            .map((json) => EquipmentCertificateModel.fromJson(json))
            .toList();

        // Insert fetched equipment certificates into the database in batch
        await dbHelper.insertEquipmentCertificate(equipmentCertificateList);
      } else {
        throw Exception('No equipment certificates fetched');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load equipment certificates');
    } finally {
      isLoading.value = false; // Set loading to false after fetching is done
    }
  }
}
