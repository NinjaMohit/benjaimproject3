import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/framework_controllers/framework_certificate_indicator_controller.dart';

class UiFrameworkCertificateIndicator extends StatefulWidget {
  const UiFrameworkCertificateIndicator({super.key});

  @override
  State<UiFrameworkCertificateIndicator> createState() =>
      _UiFrameworkCertificateIndicatorState();
}

class _UiFrameworkCertificateIndicatorState
    extends State<UiFrameworkCertificateIndicator> {
  final FrameworkCertificateIndicatorController
      frameworkCertificateIndicatorController =
      Get.put(FrameworkCertificateIndicatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => ListView.builder(
            itemCount: frameworkCertificateIndicatorController
                .certificateIndicatorsList.length,
            itemBuilder: (context, index) {
              final indicator = frameworkCertificateIndicatorController
                  .certificateIndicatorsList[index];
              return Card(
                margin: const EdgeInsets.symmetric(
                    vertical: 8.0, horizontal: 16.0), // Margin around the card
                elevation: 4, // Elevation for shadow effect
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                child: Container(
                  padding:
                      const EdgeInsets.all(16.0), // Padding inside the card
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Align text to the start
                          children: [
                            Text(
                              indicator.id.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              indicator.frameworkCertificateId.toString(),
                            ),
                            Text(
                                'Indicator ID: ${indicator.indicatorUniqueId}'),
                            Text('Title: ${indicator.title}'),
                          ],
                        ),
                      ),
                      SizedBox(width: 20), // Space between the columns
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              indicator.createdOn != null
                                  ? indicator.createdOn!
                                  : 'No date available', // Handle null values
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Min: ${indicator.min}',
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              'Max: ${indicator.max}',
                              style: const TextStyle(
                                fontSize: 12,
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
          )),
    );
  }
}
