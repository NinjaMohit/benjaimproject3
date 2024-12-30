import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/inspectionsummary.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../controllers/tasks-controllers/task_controller.dart';
import '../models/task-models/task_model.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  TaskController taskController = Get.put(TaskController());

  TextEditingController searchController = TextEditingController();

  // Method to filter the task list based on search input
  List<TaskModel> get filteredTaskList {
    final query = searchController.text.toLowerCase();
    if (query.isEmpty) {
      return taskController.taskList
          .toList(); // Return full task list when search is empty
    }
    return taskController.taskList
        .where((task) => (task.title.toLowerCase() ?? '')
            .contains(query)) // Safely handle null values
        .toList();
  }

  Map<int, Map<String, dynamic>> taskStatusDetails = {
    1: {"label": "Pending", "color": Colors.orange},
    2: {"label": "Completed", "color": Colors.green},
    3: {"label": "Overdue", "color": Colors.red},
    4: {"label": "Expiring", "color": Colors.yellow},
  };

  String getTaskStatusLabel(int? status) {
    return taskStatusDetails[status]?["label"] ?? "Unknown";
  }

  Color getTaskStatusColor(int? status) {
    return taskStatusDetails[status]?["color"] ?? Colors.grey;
  }

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      taskController.updateSearchKeyword(searchController.text);
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var widthm = MediaQuery.of(context).size.width;
    var heightm = MediaQuery.of(context).size.height;

    double width = widthm / 100;
    double height = heightm / 100;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 10,
        centerTitle: true,
        backgroundColor: HexColor("02609F"),
        title: Text(
          'Tasks',
          style: GoogleFonts.inter(
            fontSize: 16,
            color: HexColor("#FFFFFF"),
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Transform.scale(
          scale: 1.2,
          child: Container(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/images/backarrow.png",
            ),
          ),
        ),
        actions: [
          Transform.scale(
            scale: 1.2,
            child: Container(
              padding: EdgeInsets.only(right: width * 4),
              child: Image.asset(
                "assets/images/homeicon.png",
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: height * 25.5,
              width: width * 100,
              padding: const EdgeInsets.only(left: 33, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 2,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 7),
                      height: height * 7,
                      width: width * 80,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            HexColor("#555356"),
                            HexColor("#FAFAFA"),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: const [0.0, 0.15],
                        ),
                        color: HexColor("#FAFAFA"),
                        borderRadius: BorderRadius.circular(3),
                        boxShadow: [
                          BoxShadow(
                            color: HexColor("#12669d"),
                            spreadRadius: 0,
                            blurRadius: 2,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: searchController,
                        onChanged: (value) {
                          taskController.updateSearchKeyword(value);
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          filled: true,
                          hintText: "Search title",
                          hintStyle: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: HexColor("#000000"),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 2,
                  ),
                  SizedBox(
                    width: width * 80,
                  ),
                  // child: Row(
                  //   children: [
                  //     // Dropdown for Task Status

                  //     Expanded(
                  //       child: Obx(
                  //         () => Container(
                  //           height: height * 6.3,
                  //           padding:
                  //               const EdgeInsets.symmetric(horizontal: 8),
                  //           decoration: BoxDecoration(
                  //             gradient: LinearGradient(
                  //               colors: [
                  //                 HexColor("#555356"),
                  //                 HexColor("#FAFAFA"),
                  //               ],
                  //               begin: Alignment.topCenter,
                  //               end: Alignment.bottomCenter,
                  //               stops: const [0.0, 0.15],
                  //             ),
                  //             color: HexColor("#FAFAFA"),
                  //             borderRadius: BorderRadius.circular(3),
                  //             boxShadow: [
                  //               BoxShadow(
                  //                 color: HexColor("#12669d"),
                  //                 spreadRadius: 0,
                  //                 blurRadius: 2,
                  //                 offset: const Offset(0, 5),
                  //               ),
                  //             ],
                  //           ),
                  //           child: DropdownButton<String>(
                  //             isExpanded: true,
                  //             value: taskController.selectedType.value,
                  //             hint: Text(
                  //               "Search Type",
                  //               style: GoogleFonts.inter(
                  //                 fontSize: 16,
                  //                 fontWeight: FontWeight.w400,
                  //                 color: HexColor("#000000"),
                  //               ),
                  //             ),
                  //             items: taskController.taskTypes.entries
                  //                 .map((entry) => DropdownMenuItem<String>(
                  //                       value: entry.key,
                  //                       child: Text(
                  //                         entry.value,
                  //                         style: GoogleFonts.inter(
                  //                           fontSize: 16,
                  //                           fontWeight: FontWeight.w400,
                  //                           color: HexColor("#000000"),
                  //                         ),
                  //                       ),
                  //                     ))
                  //                 .toList(),
                  //             onChanged: (value) {
                  //               if (value != null) {
                  //                 taskController.updateType(value);
                  //               }
                  //             },
                  //             icon: const SizedBox.shrink(),
                  //             underline: const SizedBox.shrink(),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     SizedBox(width: width * 5),

                  //     Expanded(
                  //       child: Obx(
                  //         () => Container(
                  //           height: height * 6.3,
                  //           padding:
                  //               const EdgeInsets.symmetric(horizontal: 8),
                  //           margin: EdgeInsets.only(),
                  //           decoration: BoxDecoration(
                  //             gradient: LinearGradient(
                  //               colors: [
                  //                 HexColor("#555356"),
                  //                 HexColor("#FAFAFA"),
                  //               ],
                  //               begin: Alignment.topCenter,
                  //               end: Alignment.bottomCenter,
                  //               stops: const [0.0, 0.15],
                  //             ),
                  //             color: HexColor("#FAFAFA"),
                  //             borderRadius: BorderRadius.circular(3),
                  //             boxShadow: [
                  //               BoxShadow(
                  //                 color: HexColor("#12669d"),
                  //                 spreadRadius: 0,
                  //                 blurRadius: 2,
                  //                 offset: const Offset(0, 5),
                  //               ),
                  //             ],
                  //           ),
                  //           child: DropdownButton<String>(
                  //             isExpanded: true,
                  //             icon: const SizedBox.shrink(),
                  //             underline: const SizedBox.shrink(),
                  //             value: taskController.selectedStatus.value,
                  //             hint: Text(
                  //               "Search Status",
                  //               style: GoogleFonts.inter(
                  //                 fontSize: 16,
                  //                 fontWeight: FontWeight.w400,
                  //                 color: HexColor("#000000"),
                  //               ),
                  //             ),
                  //             items: taskController.taskStatus.entries
                  //                 .map((entry) => DropdownMenuItem<String>(
                  //                       value: entry.key,
                  //                       child: Text(
                  //                         entry.value,
                  //                         style: GoogleFonts.inter(
                  //                           fontSize: 16,
                  //                           fontWeight: FontWeight.w400,
                  //                           color: HexColor("#000000"),
                  //                         ),
                  //                       ),
                  //                     ))
                  //                 .toList(),
                  //             onChanged: (value) {
                  //               if (value != null) {
                  //                 taskController.updateStatus(value);
                  //               }
                  //             },
                  //           ),
                  //         ),
                  //       ),
                  //     ), // Dropdown for Task Type
                  //   ],
                  // ),
                  SizedBox(
                    width: width * 80,
                    child: Row(
                      children: [
                        // Dropdown for Task Status
                        Expanded(
                          flex: 1,
                          child: Obx(
                            () => Container(
                              width: width * 30, // 40% of the screen width
                              height: height * 6.3,
                              margin: const EdgeInsets.symmetric(vertical: 4),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    HexColor("#555356"),
                                    HexColor("#FAFAFA"),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  stops: const [0.0, 0.15],
                                ),
                                color: HexColor("#FAFAFA"),
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: [
                                  BoxShadow(
                                    color: HexColor("#12669d"),
                                    spreadRadius: 0,
                                    blurRadius: 2,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              alignment: Alignment
                                  .center, // Center the text vertically
                              child: DropdownButton<String>(
                                isExpanded: true,
                                icon: const SizedBox.shrink(),
                                underline: const SizedBox.shrink(),
                                value:
                                    taskController.selectedStatus.value.isEmpty
                                        ? null
                                        : taskController.selectedStatus.value,
                                hint: Text(" Search Status",
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: HexColor("#000000"),
                                    )),
                                items: taskController.taskStatus.entries
                                    .map((entry) => DropdownMenuItem<String>(
                                          value: entry.key,
                                          child: Text(
                                            entry.value,
                                            style: GoogleFonts.inter(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: HexColor("#000000"),
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  if (value != null) {
                                    taskController.updateStatus(value);
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                            width: width * 3), // Add spacing between dropdowns
                        // Dropdown for Task Type
                        Expanded(
                          flex: 1,
                          child: Obx(
                            () => Container(
                              width: width * 30, // 40% of the screen width
                              height: height * 6.3,
                              margin: const EdgeInsets.symmetric(vertical: 4),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    HexColor("#555356"),
                                    HexColor("#FAFAFA"),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  stops: const [0.0, 0.15],
                                ),
                                color: HexColor("#FAFAFA"),
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: [
                                  BoxShadow(
                                    color: HexColor("#12669d"),
                                    spreadRadius: 0,
                                    blurRadius: 2,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              alignment: Alignment
                                  .center, // Center the text vertically
                              child: DropdownButton<String>(
                                isExpanded: true,
                                icon: const SizedBox.shrink(),
                                underline: const SizedBox.shrink(),
                                value: taskController.selectedType.value.isEmpty
                                    ? null
                                    : taskController.selectedType.value,
                                hint: Text(" Search Type",
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: HexColor("#000000"),
                                    )),
                                items: taskController.taskTypes.entries
                                    .map((entry) => DropdownMenuItem<String>(
                                          value: entry.key,
                                          child: Text(
                                            entry.value,
                                            style: GoogleFonts.inter(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: HexColor("#000000"),
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  if (value != null) {
                                    taskController.updateType(value);
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: height * 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          "Tasks",
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: HexColor("#000000"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.2,
                  ),
                  Container(
                    height: 5,
                    width: width * 100,
                    color: HexColor("#FFCA11"),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(
                () {
                  // Show loading indicator while data is being fetched
                  if (taskController.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  }

                  // Use filtered list for display
                  final tasks = taskController.filteredTaskList;

                  // Check if the task list is empty
                  if (tasks.isEmpty) {
                    return Center(
                      child: Text(
                        "No tasks found",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: HexColor("#000000"),
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = taskController.filteredTaskList[index];

                      return Padding(
                        padding: EdgeInsets.only(
                            top: height * 0,
                            bottom: height * 0,
                            left: width * 4,
                            right: height * 2),
                        child: Card(
                          elevation: 10,
                          shadowColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: SizedBox(
                            height: height * 16, // Responsive height
                            width: width * 80, // Responsive width
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: height * 1.3,
                                      left: width * 2,
                                      bottom: height * 1,
                                    ),
                                    child: SizedBox(
                                      width: width * 50,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            task.title,
                                            style: GoogleFonts.inter(
                                              fontSize: 13,
                                              color: HexColor("#000000"),
                                              fontWeight: FontWeight.w600,
                                            ),
                                            maxLines: 4,
                                            overflow: TextOverflow
                                                .ellipsis, // Optional: Handle overflow if the text doesn't fit
                                          ),
                                          const Spacer(), // Responsive spacing
                                          Text(
                                            task.title != null
                                                ? task.nextDays ?? 'Due Date'
                                                : 'Due Date',
                                            style: GoogleFonts.inter(
                                              fontSize: 13,
                                              color: HexColor("#000000"),
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * 0.5,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: height * 1.7,
                                      left: width * 2,
                                      bottom: height * 1,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Spacer(),
                                        Text(
                                          // ignore: unnecessary_null_comparison
                                          task.title != null
                                              ? (task.nextDays ??
                                                  'Remaining Days')
                                              : 'Remaining Days',
                                          style: GoogleFonts.inter(
                                            fontSize: 13,
                                            color: HexColor("#000000"),
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * 0.5,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.all(3),
                                  height: height * 14, // Responsive height
                                  width: width * 23, // Responsive width
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: getTaskStatusColor(
                                        task.taskStatus), // Dynamic color
                                  ),
                                  child: Text(
                                    getTaskStatusLabel(
                                        task.taskStatus), // Dynamic label
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      color: Colors
                                          .white, // Adjust contrast for readability
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Inspectionsummary()));
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 24),
                  height: height * 8,
                  width: width * 80,
                  decoration: BoxDecoration(
                    color: HexColor("#FAFAFA"),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: HexColor("4c4c4c"),
                        spreadRadius: 0,
                        blurRadius: 2,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Text(
                    'Next Page',
                    style: GoogleFonts.inter(
                      fontSize: 19,
                      color: HexColor("#000000"),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
