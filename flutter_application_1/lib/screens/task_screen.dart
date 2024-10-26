import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/inspectionsummary.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List cardData = [1, 2, 3];
  List color = [
    const Color.fromARGB(255, 218, 40, 28),
    const Color.fromRGBO(233, 151, 28, 1),
    const Color.fromARGB(255, 83, 193, 86)
  ];
  List data = ["Overdue", "Expiring", "Complete"];
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
                            HexColor("##555356"),
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
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 2.5,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 0),
                          height: height * 6.3,
                          width: width * 37.3,
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
                            decoration: InputDecoration(
                              fillColor: Colors.transparent,
                              filled: true,
                              hintText: "Search Type",
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
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 5,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 0),
                          height: height * 6.3,
                          width: width * 37.3,
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
                            decoration: InputDecoration(
                              fillColor: Colors.transparent,
                              filled: true,
                              hintText: "Filter Status",
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
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          "Tasks",
                          style: GoogleFonts.inter(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: HexColor("#000000"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 1,
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
              child: ListView.builder(
                itemCount: cardData.length,
                itemBuilder: (context, index) {
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
                        height: height * 15, // Responsive height
                        width: width * 80, // Responsive width
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: height * 1.7,
                                left: width * 2,
                                bottom: height * 1,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tasks title',
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      color: HexColor("#000000"),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const Spacer(), // Responsive spacing
                                  Text(
                                    'Due Date',
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      color: HexColor("#000000"),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 1,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: width * 7),
                            Padding(
                              padding: EdgeInsets.only(
                                top: height * 1.7,
                                left: width * 2,
                                bottom: height * 1,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Spacer(),
                                  Text(
                                    'Remainings Days',
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      color: HexColor("#000000"),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 1,
                                  )
                                ],
                              ),
                            ),
                            const Spacer(),
                            Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.all(3),
                                height: height * 14, // Responsive height
                                width: width * 23, // Responsive width
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: color[index]),
                                child: Text(
                                  data[index],
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    color: HexColor("#000000"),
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
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
