import 'dart:convert';
import 'package:get/get.dart';
import '../database/db_helper.dart';
import '../models/account.dart';

class AccountController extends GetxController {
  var accounts = <Account>[].obs; // Observable list of accounts
  var selectedAccountSlug = ''.obs; // Selected account slug
  final DBHelper dbHelper = DBHelper(); // Initialize DBHelper
  var isLoading = false.obs; // Loading state

  @override
  void onInit() {
    super.onInit();
    fetchAccounts();
    // Fetch accounts when the controller is initialized
  }

  Future<void> fetchAccounts() async {
    String jsonResponse = '''
    [
      {"instance_id": "1", "instance_name": "Account One", "account_slug": "account-one"},
      {"instance_id": "2", "instance_name": "Account Two", "account_slug": "account-two"},
      {"instance_id": "3", "instance_name": "Account Three", "account_slug": "account-three"}
    ]''';

    List<dynamic> jsonData = json.decode(jsonResponse);
    accounts.value = jsonData.map((json) => Account.fromJson(json)).toList();
  }

  void setSelectedAccount(String? accountSlug) {
    selectedAccountSlug.value = accountSlug ?? '';
  }

  // Method to login the user based on selected account
  Future<bool> login(String username, String password) async {
    String slug = selectedAccountSlug.value;
    if (slug.isEmpty) {
      Get.snackbar('Error', 'Please select an account!');
      return false; // Login failed
    }

    final userCredentials = await dbHelper.getUserCredentials(slug);

    // Check if user exists and passwords match
    if (userCredentials != null) {
      if (userCredentials['username'] == username &&
          userCredentials['password'] == password) {
        // Successful login
        //Get.to(() => CertificateView());

        return true; // Login successful
      } else {
        // Invalid username or password
        await dbHelper.insertUser(
            username, password, slug); // Insert user into database
        Get.snackbar('Success', 'New user added to database!');

// Indicate new user added
        return false; // Login failed
      }
    } else {
      // No user found for the selected account
      await dbHelper.insertUser(
          username, password, slug); // Insert user into database

      Get.snackbar(
          'Success', 'New user added to database!'); // Indicate new user added
      return false; // Login failed
    }
  }
}
