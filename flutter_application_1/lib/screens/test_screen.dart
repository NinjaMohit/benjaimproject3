import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/equipments_controllers/equipment_certificate_controller.dart';
import 'package:flutter_application_1/controllers/equipments_controllers/equipment_corrective_action_controller.dart';
import 'package:flutter_application_1/controllers/equipments_controllers/equipment_drop_controller.dart';
import 'package:flutter_application_1/controllers/equipments_controllers/equipment_ex_controller.dart';
import 'package:flutter_application_1/controllers/equipments_controllers/equipment_standard_controller.dart';
import 'package:flutter_application_1/controllers/tasks-controllers/task_equipment_controller.dart';
import 'package:flutter_application_1/controllers/tasks-controllers/task_expired_notifications_controller.dart';
import 'package:flutter_application_1/controllers/tasks-controllers/task_expiring_notification_send_dates_controller.dart';
import 'package:flutter_application_1/controllers/tasks-controllers/task_notifications_controller.dart';
import 'package:flutter_application_1/controllers/tasks-controllers/task_summary_controller.dart';
import 'package:flutter_application_1/controllers/tasks-controllers/task_summary_status_controller.dart';
import 'package:flutter_application_1/controllers/tasks-controllers/task_workscope_Item_Inspection_controller.dart';
import 'package:flutter_application_1/controllers/tasks-controllers/task_workscope_cert_indicator_controller.dart';
import 'package:flutter_application_1/controllers/tasks-controllers/task_workscope_item_controller.dart';
import 'package:flutter_application_1/test/uiframework_certificate.dart';
import 'package:flutter_application_1/test/uiframeworkcertificateIndicator.dart';
import 'package:flutter_application_1/test/uiframeworkcorrectiveaction.dart';
import 'package:flutter_application_1/test/uiframeworkorganisation.dart';
import 'package:flutter_application_1/test/uitaskinspectiontype.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../controllers/equipments_controllers/equipment_basic_controller.dart';
import '../controllers/framework_controllers/framework_certificate_indicator_controller.dart';
import '../controllers/framework_controllers/framework_certificate_controller.dart';
import '../controllers/framework_controllers/framework_corrective_action_controller.dart';
import '../controllers/framework_controllers/framework_equipment_basic_controller.dart';
import '../controllers/framework_controllers/framework_equipment_certificate_controller.dart';
import '../controllers/framework_controllers/framework_equipment_standard_controller.dart';
import '../controllers/framework_controllers/framework_equipmet_ex_controller.dart';
import '../controllers/framework_controllers/framework_orgaisation_controller.dart';
import '../controllers/tasks-controllers/task_inspection_type_controller.dart';
import '../controllers/tasks-controllers/task_workscope_specific_equipment_controller.dart';

class CertificateView extends StatefulWidget {
  const CertificateView({super.key});

  @override
  State<CertificateView> createState() => _CertificateViewState();
}

class _CertificateViewState extends State<CertificateView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  final FrameworkCertController frameworkCertController =
      Get.put(FrameworkCertController());

  final FrameworkOrganisationController frameworkOrganisationController =
      Get.put(FrameworkOrganisationController());

  final FrameworkCorrectiveActionController
      frameworkCorrectiveActionController =
      Get.put(FrameworkCorrectiveActionController());
  final FrameworkCertificateIndicatorController
      frameworkCertificateIndicatorController =
      Get.put(FrameworkCertificateIndicatorController());

  final FrameworkEquipmentCertController frameworkEquipmentCertController =
      Get.put(FrameworkEquipmentCertController());

  final FrameworkEquipmentExController frameworkEquipmentExController =
      Get.put(FrameworkEquipmentExController());

  final FrameworkEquipmentStandardController
      frameworkEquipmentStandardController =
      Get.put(FrameworkEquipmentStandardController());

  final FrameworkEquipmentBasicController frameworkEquipmentBasicController =
      Get.put(FrameworkEquipmentBasicController());

  final TaskInspectionTypeController taskInspectionTypeController =
      Get.put(TaskInspectionTypeController());

  final TaskEquipmentController taskEquipmentController =
      Get.put(TaskEquipmentController());

  final TaskExpiredNotificationsController taskExpiredNotificationsController =
      Get.put(TaskExpiredNotificationsController());

  final TaskExpiringNotificationSendDateController
      taskExpiringNotificationSendDateController =
      Get.put(TaskExpiringNotificationSendDateController());

  final TaskNotificationController taskNotificationController =
      Get.put(TaskNotificationController());

  final TaskSummaryDocController taskSummaryDocController =
      Get.put(TaskSummaryDocController());
  final TaskSummaryStatusController taskSummaryStatusController =
      Get.put(TaskSummaryStatusController());

  final TaskWorkscopeCertIndicatorController
      taskWorkscopeCertIndicatorController =
      Get.put(TaskWorkscopeCertIndicatorController());
  final TaskWorkscopeItemController taskWorkscopeItemController =
      Get.put(TaskWorkscopeItemController());

  final TaskWorkscopeItemInspectionController
      taskWorkscopeItemInspectionController =
      Get.put(TaskWorkscopeItemInspectionController());
  final TaskWorkscopeSpecificEquipmentController
      taskWorkscopeSpecificEquipmentController =
      Get.put(TaskWorkscopeSpecificEquipmentController());

  final EquipmentCorrectiveActionController
      equipmentCorrectiveActionController =
      Get.put(EquipmentCorrectiveActionController());

  final EquipmentBasicController equipmentBasicController =
      Get.put(EquipmentBasicController());

  final EquipmentCertificateController equipmentCertificateController =
      Get.put(EquipmentCertificateController());
  final EquipmentExController equipmentExController =
      Get.put(EquipmentExController());
  final EquipmentStandardController equipmentStandardController =
      Get.put(EquipmentStandardController());

  final EquipmentDropController equipmentDropController =
      Get.put(EquipmentDropController());

  @override
  void initState() {
    super.initState();
    // Initialize the animation controller
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat(); // Repeat the animation

    // Fetch certificates when the view is initialized
    _fetchFrameworkCertificates();
    _fetchTaskInspectionType();
    _fetchFrameworkOrganisation();
    _fetchFrameworkCorrectiveAction(); // Add this line
    _fetchFrameworkCertificateIndicators();
    _fetchFrameworkEquipmentCert();
    _fetchFrameworkEquipmentEx();
    _fetchFrameworkEquipmentStandards();
    _fetchFrameworkEquipmentBasic();
    _fetchTaskEquipment();
    _fetchTaskExpiredNotifications();
    _taskExpiringNotificationSendDateControl();
    _taskNotifications();
    _taskSummaryDocs();
    _taskSummaryStatus();
    _taskWorkscopeCertIndicator();
    _taskWorkscopeItem();
    taskWorkscopeItemInspection();
    _taskWorkscopeSpecificEquipment();

    _equipmentCorrectiveAction();
    _equipmentBasic();
    _equipmentCertificate();
    _equipmentEx();
    _equipmentStandard();
    _equipmentDrops();
  }

  @override
  void dispose() {
    _animationController.dispose(); // Dispose of the controller when not needed
    super.dispose();
  }

  Future<void> _fetchFrameworkCertificates() async {
    frameworkCertController.isLoading.value = true; // Start loading
    await frameworkCertController.fetchCertificates();
    frameworkCertController.isLoading.value = false; // End loading
  }

  Future<void> _fetchTaskInspectionType() async {
    taskInspectionTypeController.isLoading.value = true; // Start loading
    await taskInspectionTypeController.fetchTaskInspectionTypes();
    taskInspectionTypeController.isLoading.value = false; // End loading
  }

  Future<void> _fetchFrameworkOrganisation() async {
    frameworkOrganisationController.isLoading.value = true; // Start loading
    await frameworkOrganisationController.fetchFrameworkOrganisations();
    frameworkOrganisationController.isLoading.value = false; // End loading
  }

  Future<void> _fetchFrameworkCorrectiveAction() async {
    frameworkCorrectiveActionController.isLoading.value = true;
    await frameworkCorrectiveActionController.fetchFrameworkCorrectiveActions();
    frameworkCorrectiveActionController.isLoading.value = false;
  }

  Future<void> _fetchFrameworkCertificateIndicators() async {
    frameworkCertificateIndicatorController.isLoading.value = true;
    await frameworkCertificateIndicatorController
        .fetchFrameworkCertificateIndicators();
    frameworkCertificateIndicatorController.isLoading.value = false;
  }

  Future<void> _fetchFrameworkEquipmentCert() async {
    frameworkEquipmentCertController.isLoading.value = true; // Start loading
    await frameworkEquipmentCertController.fetchFrameworkEquipmentCerts();
    frameworkEquipmentCertController.isLoading.value = false; // End loading
  }

  Future<void> _fetchFrameworkEquipmentEx() async {
    frameworkEquipmentExController.isLoading.value = true; // Start loading
    await frameworkEquipmentExController
        .fetchFrameworkEquipmentEx(); // Fetching equipment explosion proof details
    frameworkEquipmentExController.isLoading.value = false; // End loading
  }

  Future<void> _fetchFrameworkEquipmentStandards() async {
    frameworkEquipmentStandardController.isLoading.value =
        true; // Start loading
    await frameworkEquipmentStandardController
        .fetchFrameworkEquipmentStandards(); // Fetching equipment standards
    frameworkEquipmentStandardController.isLoading.value = false; // End loading
  }

  Future<void> _fetchFrameworkEquipmentBasic() async {
    frameworkEquipmentBasicController.isLoading.value = true; // Start loading
    await frameworkEquipmentBasicController.fetchFrameworkEquipmentBasics();
    frameworkEquipmentBasicController.isLoading.value = false; // End loading
  }

  Future<void> _fetchTaskEquipment() async {
    taskEquipmentController.isLoading.value = true; // Start loading
    await taskEquipmentController
        .fetchTaskEquipment(); // Fetching task equipment
    taskEquipmentController.isLoading.value = false; // End loading
  }

  Future<void> _fetchTaskExpiredNotifications() async {
    taskExpiredNotificationsController.isLoading.value = true; // Start loading
    await taskExpiredNotificationsController
        .fetchTaskExpiredNotifications(); // Fetching task equipment
    taskExpiredNotificationsController.isLoading.value = false; // End loading
  }

  Future<void> _taskExpiringNotificationSendDateControl() async {
    taskExpiringNotificationSendDateController.isLoading.value =
        true; // Start loading
    await taskExpiringNotificationSendDateController
        .fetchTaskExpiringNotificationsSendDates();
    // Fetching task equipment
    taskExpiringNotificationSendDateController.isLoading.value =
        false; // End loading
  }

  Future<void> _taskNotifications() async {
    taskNotificationController.isLoading.value = true; // Start loading
    await taskNotificationController
        .fetchTaskNotifications(); // Fetching task equipment
    taskNotificationController.isLoading.value = false; // End loading
  }

  Future<void> _taskSummaryDocs() async {
    taskSummaryDocController.isLoading.value = true; // Start loading
    await taskSummaryDocController.fetchTaskSummaryDocs();
    // Fetching task equipment
    taskSummaryDocController.isLoading.value = false; // End loading
  }

  Future<void> _taskSummaryStatus() async {
    taskSummaryStatusController.isLoading.value = true; // Start loading
    await taskSummaryStatusController.fetchTaskSummaryStatus();
    // Fetching task equipment
    taskSummaryStatusController.isLoading.value = false; // End loading
  }

  Future<void> _taskWorkscopeCertIndicator() async {
    taskWorkscopeCertIndicatorController.isLoading.value =
        true; // Start loading
    await taskWorkscopeCertIndicatorController
        .fetchTaskWorkscopeCertIndicator();
    // Fetching task equipment
    taskWorkscopeCertIndicatorController.isLoading.value = false; // End loading
  }

  //taskWorkscopeItemController
  Future<void> _taskWorkscopeItem() async {
    taskWorkscopeItemController.isLoading.value = true; // Start loading
    await taskWorkscopeItemController.fetchTaskWorkscopeItems();
    // Fetching task equipment
    taskWorkscopeItemController.isLoading.value = false; // End loading
  }

//
  Future<void> taskWorkscopeItemInspection() async {
    taskWorkscopeItemInspectionController.isLoading.value =
        true; // Start loading
    await taskWorkscopeItemInspectionController
        .fetchTaskWorkscopeItemInspections();
    // Fetching task equipment
    taskWorkscopeItemInspectionController.isLoading.value =
        false; // End loading
  }

// taskWorkscopeSpecificEquipmentController
  Future<void> _taskWorkscopeSpecificEquipment() async {
    taskWorkscopeSpecificEquipmentController.isLoading.value =
        true; // Start loading
    await taskWorkscopeSpecificEquipmentController
        .fetchTaskWorkscopeSpecificEquipments();

    // Fetching task equipment
    taskWorkscopeSpecificEquipmentController.isLoading.value =
        false; // End loading
  }

  //   equipmentCorrectiveActionController =

  Future<void> _equipmentCorrectiveAction() async {
    equipmentCorrectiveActionController.isLoading.value = true; // Start loading
    await equipmentCorrectiveActionController.fetchEquipmentCorrectiveActions();

    // Fetching task equipment
    equipmentCorrectiveActionController.isLoading.value = false; // End loading
  }

  Future<void> _equipmentBasic() async {
    equipmentBasicController.isLoading.value = true; // Start loading
    await equipmentBasicController.fetchEquipmentBasics();

    // Fetching task equipment
    equipmentBasicController.isLoading.value = false; // End loading
  }

  Future<void> _equipmentCertificate() async {
    equipmentCertificateController.isLoading.value = true; // Start loading
    await equipmentCertificateController.fetchEquipmentCertificates();

    // Fetching task equipment
    equipmentCertificateController.isLoading.value = false; // End loading
  }

  Future<void> _equipmentEx() async {
    equipmentExController.isLoading.value = true; // Start loading
    await equipmentExController.fetchEquipmentEx();

    // Fetching task equipment
    equipmentExController.isLoading.value = false; // End loading
  }

  Future<void> _equipmentStandard() async {
    equipmentStandardController.isLoading.value = true; // Start loading
    await equipmentStandardController.fetchEquipmentStandards();

    // Fetching task equipment
    equipmentStandardController.isLoading.value = false; // End loading
  }

  Future<void> _equipmentDrops() async {
    equipmentDropController.isLoading.value = true; // Start loading
    await equipmentDropController.fetchEquipmentDrops();

    // Fetching task equipment
    equipmentDropController.isLoading.value = false; // End loading
  }

  @override
  Widget build(BuildContext context) {
    var widthm = MediaQuery.of(context).size.width;
    var heightm = MediaQuery.of(context).size.height;

    double width = widthm / 100;
    double height = heightm / 100;

    return Scaffold(
      appBar: AppBar(title: const Text('Certificates')),
      body: Obx(() {
        if (frameworkCertController.isLoading.value &&
            taskInspectionTypeController.isLoading.value &&
            frameworkCorrectiveActionController.isLoading.value &&
            frameworkCertificateIndicatorController.isLoading.value &&
            frameworkEquipmentCertController.isLoading.value &&
            frameworkEquipmentExController.isLoading.value &&
            frameworkEquipmentBasicController.isLoading.value &&
            taskEquipmentController.isLoading.value &&
            taskExpiredNotificationsController.isLoading.value &&
            taskExpiringNotificationSendDateController.isLoading.value &&
            taskNotificationController.isLoading.value &&
            taskSummaryDocController.isLoading.value &&
            taskSummaryStatusController.isLoading.value) {
          return Center(
            child: Column(
              children: [
                SizedBox(
                  height: height * 32,
                ),
                RotationTransition(
                  turns: Tween<double>(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                      parent: _animationController,
                      curve: Curves.linear,
                    ),
                  ),
                  child: const Icon(
                    Icons.settings,
                    size: 100,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Loading",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )
              ],
            ),
          );
        }

        if (frameworkCertController.certificatesList.isEmpty &&
            taskInspectionTypeController.taskInspectionTypesList.isEmpty &&
            frameworkCorrectiveActionController.correctiveActionsList.isEmpty &&
            frameworkCertificateIndicatorController
                .certificateIndicatorsList.isEmpty &&
            frameworkEquipmentCertController.equipmentCertsList.isEmpty &&
            frameworkEquipmentExController.equipmentExList.isEmpty &&
            frameworkEquipmentBasicController.equipmentBasicList.isEmpty) {
          return Center(
            child: ElevatedButton(
              onPressed: () => frameworkCertController.fetchCertificates(),
              child: const Text('Load Certificates'),
            ),
          );
        }
        return Center(
          child: Column(
            children: [
              SizedBox(
                height: height * 12,
              ),
              GestureDetector(
                onTap: () async {
                  Get.to(() => UiframeworkCertificate());
                },
                child: Container(
                  alignment: Alignment.center,
                  height: height * 5,
                  width: width * 80,
                  decoration: BoxDecoration(
                    color: HexColor("#FFCA11"),
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                        color: HexColor("4c4c4c"), // Shadow color
                        spreadRadius: 0, // How much the shadow spreads
                        blurRadius: 2,
                        // The blur effect for the shadow
                        offset: const Offset(0, 4), // Position of the shadow
                      ),
                    ],
                  ),
                  child: Text(
                    'Framework_certifcates table',
                    style: GoogleFonts.inter(
                        fontSize: 20,
                        color: HexColor("#FFFFFF"),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: height * 3,
              ),
              GestureDetector(
                onTap: () async {
                  Get.to(() => UiTaskinspectiontype());
                },
                child: Container(
                  alignment: Alignment.center,
                  height: height * 5,
                  width: width * 80,
                  decoration: BoxDecoration(
                    color: HexColor("#FFCA11"),
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                        color: HexColor("4c4c4c"), // Shadow color
                        spreadRadius: 0, // How much the shadow spreads
                        blurRadius: 2,
                        // The blur effect for the shadow
                        offset: const Offset(0, 4), // Position of the shadow
                      ),
                    ],
                  ),
                  child: Text(
                    'TaskInspectionType table',
                    style: GoogleFonts.inter(
                        fontSize: 20,
                        color: HexColor("#FFFFFF"),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: height * 3,
              ),
              GestureDetector(
                onTap: () async {
                  Get.to(() => UiframeworkOrganisation());
                },
                child: Container(
                  alignment: Alignment.center,
                  height: height * 5,
                  width: width * 80,
                  decoration: BoxDecoration(
                    color: HexColor("#FFCA11"),
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                        color: HexColor("4c4c4c"), // Shadow color
                        spreadRadius: 0, // How much the shadow spreads
                        blurRadius: 2,
                        // The blur effect for the shadow
                        offset: const Offset(0, 4), // Position of the shadow
                      ),
                    ],
                  ),
                  child: Text(
                    'Framework Organisation',
                    style: GoogleFonts.inter(
                        fontSize: 20,
                        color: HexColor("#FFFFFF"),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: height * 3,
              ),
              GestureDetector(
                onTap: () async {
                  Get.to(() => UiFrameworkCorrectiveAction());
                },
                child: Container(
                  alignment: Alignment.center,
                  height: height * 5,
                  width: width * 80,
                  decoration: BoxDecoration(
                    color: HexColor("#FFCA11"),
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                        color: HexColor("4c4c4c"), // Shadow color
                        spreadRadius: 0, // How much the shadow spreads
                        blurRadius: 2,
                        // The blur effect for the shadow
                        offset: const Offset(0, 4), // Position of the shadow
                      ),
                    ],
                  ),
                  child: Text(
                    'framework_corrective_action',
                    style: GoogleFonts.inter(
                        fontSize: 20,
                        color: HexColor("#FFFFFF"),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: height * 3,
              ),
              GestureDetector(
                onTap: () async {
                  Get.to(() => UiFrameworkCertificateIndicator());
                },
                child: Container(
                  alignment: Alignment.center,
                  height: height * 5,
                  width: width * 80,
                  decoration: BoxDecoration(
                    color: HexColor("#FFCA11"),
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                        color: HexColor("4c4c4c"), // Shadow color
                        spreadRadius: 0, // How much the shadow spreads
                        blurRadius: 2,
                        // The blur effect for the shadow
                        offset: const Offset(0, 4), // Position of the shadow
                      ),
                    ],
                  ),
                  child: Text(
                    'framework_certificate_indicators',
                    style: GoogleFonts.inter(
                        fontSize: 20,
                        color: HexColor("#FFFFFF"),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: height * 3,
              ),
            ],
          ),
        );
      }),
    );
  }
}
