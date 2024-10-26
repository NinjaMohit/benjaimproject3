import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/activeobs_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class ArchiveObsScreen extends StatefulWidget {
  const ArchiveObsScreen({super.key});

  @override
  State<ArchiveObsScreen> createState() => _ArchiveObsScreenState();
}

class _ArchiveObsScreenState extends State<ArchiveObsScreen> {
  List cardData = [1, 2];
  List color = ["#C4C4C4", "#3AAEFC"];
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
          'Archive Observation',
          style: GoogleFonts.inter(
            fontSize: 18,
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
                "assets/images/Vector.png",
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: height * 1.5, left: width * 5),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ActiveObsScreen()));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: height * 7,
                    width: width * 42,
                    decoration: BoxDecoration(
                      color: HexColor("3AAEFC"),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(width: 0.5, color: Colors.black),
                      boxShadow: [
                        BoxShadow(
                          color: HexColor("4c4c4c"),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Text(
                      'Make Active',
                      style: GoogleFonts.inter(
                          fontSize: 20,
                          color: HexColor("#FFFFFF"),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(width: width * 5),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: height * 7,
                    width: width * 42,
                    decoration: BoxDecoration(
                      color: HexColor("#FFCA11"),
                      border: Border.all(width: 0.5),
                      borderRadius: BorderRadius.circular(2),
                      boxShadow: [
                        BoxShadow(
                          color: HexColor("4c4c4c"),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Text(
                      'Create Report',
                      style: GoogleFonts.inter(
                          fontSize: 20,
                          color: HexColor("#FFFFFF"),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 1.5,
          ),
          Container(
            margin: EdgeInsets.only(top: height * 1.5, left: width * 5),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: height * 7,
                    width: width * 42,
                    decoration: BoxDecoration(
                      color: HexColor("#FFCA11"),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(width: 0.5, color: Colors.black),
                      boxShadow: [
                        BoxShadow(
                          color: HexColor("4c4c4c"),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Text(
                      'Active',
                      style: GoogleFonts.inter(
                          fontSize: 20,
                          color: HexColor("#FFFFFF"),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(width: width * 5),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: height * 7,
                    width: width * 42,
                    decoration: BoxDecoration(
                      color: HexColor("#00C620"),
                      border: Border.all(width: 3, color: HexColor("#3AAEFC")),
                      borderRadius: BorderRadius.circular(2),
                      boxShadow: [
                        BoxShadow(
                          color: HexColor("4c4c4c"),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Text(
                      'Archive',
                      style: GoogleFonts.inter(
                          fontSize: 20,
                          color: HexColor("#FFFFFF"),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 3,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cardData.length,
              itemBuilder: (context, index) {
                return Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: height * 0,
                        bottom: height * 0,
                        left: width * 3,
                        right: height * 1),
                    child: Card(
                      elevation: 7.5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: const BorderSide(color: Colors.black, width: 0.8),
                      ),
                      child: SizedBox(
                        height: height * 15.6, // Responsive height
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
                                  Flexible(
                                    child: Text(
                                      'Title',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        color: HexColor("#000000"),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          height * 1.5), // Responsive spacing
                                  Flexible(
                                    child: Text(
                                      'ID',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        color: HexColor("#000000"),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: height * 1.5),
                                  Flexible(
                                    child: Text(
                                      'Date Found',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        color: HexColor("#000000"),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: width * 3),
                            Padding(
                              padding: EdgeInsets.only(
                                top: height * 1.7,
                                left: width * 2,
                                bottom: height * 1,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(''),
                                  SizedBox(height: height * 1.5),
                                  Flexible(
                                    child: Text(
                                      'Location',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        color: HexColor("#000000"),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: height * 1.5),
                                  Flexible(
                                    child: Text(
                                      'Criticality',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        color: HexColor("#000000"),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Container(
                              padding: EdgeInsets.only(
                                  top: height * 1.5,
                                  bottom: height * 1,
                                  right: width * 2),
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  const Text(''),
                                  SizedBox(height: height * 1.5),
                                  const Text(''),
                                  SizedBox(height: height * 0.9),
                                  Icon(
                                    Icons.camera_alt,
                                    size: 27,
                                    color: cardData[index] % 2 == 1
                                        ? HexColor("#000000")
                                        : Colors.black26,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: height * 15, // Responsive height
                              width: 1,
                              color: Colors.black,
                            ),
                            Container(
                              height: height * 15.6, // Responsive height
                              width: width * 17, // Responsive width
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: cardData[index] % 2 == 1
                                    ? HexColor("#C4C4C4")
                                    : HexColor("#3AAEFC"),
                                border: Border.all(width: 1),
                              ),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Add more content here if needed
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
