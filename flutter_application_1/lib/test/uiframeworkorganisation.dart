import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/framework_controllers/framework_orgaisation_controller.dart';

class UiframeworkOrganisation extends StatefulWidget {
  const UiframeworkOrganisation({super.key});

  @override
  State<UiframeworkOrganisation> createState() =>
      _UiframeworkOrganisationState();
}

class _UiframeworkOrganisationState extends State<UiframeworkOrganisation> {
  final FrameworkOrganisationController frameworkOrganisationController =
      Get.put(FrameworkOrganisationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Framework Organisations'),
      ),
      body: Obx(
        () => frameworkOrganisationController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator()) // Show loading indicator
            : ListView.builder(
                itemCount: frameworkOrganisationController
                    .frameworkOrganisationsList.length,
                itemBuilder: (context, index) {
                  final organisation = frameworkOrganisationController
                      .frameworkOrganisationsList[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0), // Margin around the card
                    elevation: 4, // Elevation for shadow effect
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Rounded corners
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
                                  'Organisation ID: ${organisation.organisationId}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text('Title: ${organisation.title}'),
                                Text(
                                    'Location Key: ${organisation.locationKey}'),
                                Text('City: ${organisation.city}'),
                                Text('Status: ${organisation.status}'),
                                Text(
                                    'Created On: ${organisation.createdOn}'), // Handle nullable field
                              ],
                            ),
                          ),
                          SizedBox(width: 16), // Space between the columns
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'ParentID: ${organisation.parentId.toString()}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                // Convert int to String
                                Text(
                                  'Node Code: ${organisation.nodeCode}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                Text('Country: ${organisation.country}'),
                                Text('Created By: ${organisation.createdBy}'),
                                Text(
                                    'Updated On: ${organisation.updatedOn}'), // Handle nullable field
                                Text(
                                    'Sync Date: ${organisation.syncDate}'), // Handle nullable field
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
