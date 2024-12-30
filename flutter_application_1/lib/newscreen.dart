import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/forgot_pass.dart';
import 'package:get/get.dart';
import '../../models/task-models/task_inspectiontype_model.dart';
import 'controllers/tasks-controllers/task_inspection_type_controller.dart';

class TaskInspectionTypeScreen extends StatelessWidget {
  final TaskInspectionTypeController controller =
      Get.put(TaskInspectionTypeController());
  final TextEditingController inspectionTitleController =
      TextEditingController();
  final TextEditingController inspectionIdController = TextEditingController();
  final TextEditingController inspectionImageController =
      TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController idNoController = TextEditingController();

  TaskInspectionTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Inspection Types'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: controller.taskInspectionTypesList.length,
          itemBuilder: (context, index) {
            final inspectionType = controller.taskInspectionTypesList[index];
            return ListTile(
              title: Text("Primary key :${inspectionType.idNo.toString()}"),
              subtitle: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(inspectionType.inspectionTitle,
                        style: TextStyle(fontSize: 15)),
                    Text(
                      'ID: ${inspectionType.inspectionId}, Status: ${inspectionType.status}',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      _populateEditFields(inspectionType);
                      _showEditDialog(context, inspectionType);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      controller.removeTaskInspectionType(inspectionType.idNo!);
                    },
                  ),
                ],
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _clearInputFields();
          _showAddDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Inspection Type'),
          content: _buildDialogContent(),
          actions: [
            TextButton(
              onPressed: () {
                final newInspectionType = TaskInspectionTypeModel(
                  inspectionId: int.parse(inspectionIdController.text),
                  inspectionTitle: inspectionTitleController.text,
                  inspectionTypeImage: inspectionImageController.text,
                  status: int.parse(statusController.text),
                );
                controller.addTaskInspectionType(newInspectionType);
                Get.back(); // Close the dialog
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ForgetPass()));
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () => Get.back(),
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _showEditDialog(
      BuildContext context, TaskInspectionTypeModel inspectionType) {
    _populateEditFields(inspectionType); // Populate fields with existing data
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Inspection Type'),
          content: _buildDialogContent(),
          actions: [
            TextButton(
              onPressed: () {
                final updatedInspectionType = TaskInspectionTypeModel(
                  idNo: inspectionType.idNo, // Retain the ID
                  inspectionId: int.parse(inspectionIdController.text),
                  inspectionTitle: inspectionTitleController.text,
                  inspectionTypeImage: inspectionImageController.text,
                  status: int.parse(statusController.text),
                );
                controller.updateTaskInspectionType(updatedInspectionType);
                Get.back(); // Close the dialog
              },
              child: Text('Update'),
            ),
            TextButton(
              onPressed: () => Get.back(),
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _clearInputFields() {
    inspectionIdController.clear();
    inspectionTitleController.clear();
    inspectionImageController.clear();
    statusController.clear();
  }

  void _populateEditFields(TaskInspectionTypeModel inspectionType) {
    inspectionIdController.text = inspectionType.inspectionId.toString();
    inspectionTitleController.text = inspectionType.inspectionTitle;
    inspectionImageController.text = inspectionType.inspectionTypeImage ?? '';
    statusController.text = inspectionType.status.toString();
  }

  Widget _buildDialogContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: inspectionIdController,
          decoration: InputDecoration(labelText: 'Inspection id'),
        ),
        TextField(
          controller: inspectionTitleController,
          decoration: InputDecoration(labelText: 'Inspection Title'),
        ),
        TextField(
          controller: inspectionImageController,
          decoration: InputDecoration(labelText: 'Inspection Image URL'),
        ),
        TextField(
          controller: statusController,
          decoration: InputDecoration(labelText: 'Status'),
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }
}
