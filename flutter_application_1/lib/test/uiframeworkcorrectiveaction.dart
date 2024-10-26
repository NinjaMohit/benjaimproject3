import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/framework_controllers/framework_corrective_action_controller.dart';

class UiFrameworkCorrectiveAction extends StatefulWidget {
  const UiFrameworkCorrectiveAction({super.key});

  @override
  State<UiFrameworkCorrectiveAction> createState() =>
      _UiFrameworkCorrectiveActionState();
}

class _UiFrameworkCorrectiveActionState
    extends State<UiFrameworkCorrectiveAction> {
  final FrameworkCorrectiveActionController
      frameworkCorrectiveActionController =
      Get.put(FrameworkCorrectiveActionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => ListView.builder(
            itemCount: frameworkCorrectiveActionController
                .correctiveActionsList.length,
            itemBuilder: (context, index) {
              final correctiveAction = frameworkCorrectiveActionController
                  .correctiveActionsList[index];
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
                              correctiveAction.correctiveActionId.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              correctiveAction.parentId.toString(),
                            ),
                            Text(
                              correctiveAction.correctiveActionId.toString(),
                            ),
                            Text('Action Title: ${correctiveAction.title}'),
                            Text('Action Code: ${correctiveAction.caCode}'),
                          ],
                        ),
                      ),
                      SizedBox(width: 20), // Space between the columns
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              correctiveAction.createdOn, // Handle null values
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Status: ${correctiveAction.caStatus}',
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              'Class: ${correctiveAction.caClass}',
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
