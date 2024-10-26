import 'package:flutter/material.dart';

import 'package:flutter_application_1/screens/forgot_pass.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:get/get.dart';

import 'database/db_helper.dart';
import 'screens/success_forgetpass.dart';

Future<void> main() async {
  // Initialize FFI for database
  WidgetsFlutterBinding.ensureInitialized();

  // Now initialize your database after setting up databaseFactory
  await DBHelper().database;

  // Run the app after everything is initialized
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/loginscreen', page: () => const LoginScreen()),
        GetPage(name: '/forgetpass', page: () => const ForgetPass()),
        GetPage(
            name: '/successforgetpass', page: () => const SuccessForgetpass()),
      ],
    );
  }
}
