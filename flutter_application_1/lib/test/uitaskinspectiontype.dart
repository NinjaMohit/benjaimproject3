import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/tasks-controllers/task_inspection_type_controller.dart';

class UiTaskinspectiontype extends StatefulWidget {
  const UiTaskinspectiontype({super.key});

  @override
  State<UiTaskinspectiontype> createState() => _UiTaskinspectiontypeState();
}

class _UiTaskinspectiontypeState extends State<UiTaskinspectiontype> {
  final TaskInspectionTypeController taskInspectionTypeController =
      Get.put(TaskInspectionTypeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => ListView.builder(
            itemCount:
                taskInspectionTypeController.taskInspectionTypesList.length,
            itemBuilder: (context, index) {
              final inspectionType =
                  taskInspectionTypeController.taskInspectionTypesList[index];
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
                              inspectionType.inspectionId.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                                'inspection_title: ${inspectionType.inspectionTitle}'),
                          ],
                        ),
                      ),
                      SizedBox(width: 20), // Space between the columns
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              inspectionType.createdAt != null
                                  ? inspectionType.createdAt!
                                  : 'No date available', // Handle null values
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
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
