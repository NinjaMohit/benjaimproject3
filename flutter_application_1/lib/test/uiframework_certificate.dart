import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/framework_controllers/framework_certificate_controller.dart';

class UiframeworkCertificate extends StatefulWidget {
  const UiframeworkCertificate({super.key});

  @override
  State<UiframeworkCertificate> createState() => _UiframeworkCertificateState();
}

class _UiframeworkCertificateState extends State<UiframeworkCertificate> {
  final FrameworkCertController frameworkCertController =
      Get.put(FrameworkCertController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: frameworkCertController.certificatesList.length,
        itemBuilder: (context, index) {
          final certificate = frameworkCertController.certificatesList[index];
          return Card(
            margin: const EdgeInsets.symmetric(
                vertical: 8.0, horizontal: 16.0), // Margin around the card
            elevation: 4, // Elevation for shadow effect
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Rounded corners
            ),
            child: Container(
              padding: const EdgeInsets.all(16.0), // Padding inside the card
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Align text to the start
                      children: [
                        Text(
                          certificate.id.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text('Group: ${certificate.certGroup}'),
                      ],
                    ),
                  ),
                  SizedBox(width: 16), // Space between the columns
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          certificate.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
