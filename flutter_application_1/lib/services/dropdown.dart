// services/account_service.dart
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/account.dart';

class AccountService {
  static const String apiUrl =
      "https://example.com/api/accounts"; // Replace with your API URL

  Future<List<Account>> fetchAccounts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Account.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load accounts');
    }
  }
}
