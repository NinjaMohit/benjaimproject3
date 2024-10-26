import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/workscopetitle_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class ThinksafetyScreen extends StatefulWidget {
  const ThinksafetyScreen({super.key});

  @override
  State<ThinksafetyScreen> createState() => _ThinksafetyScreenState();
}

class _ThinksafetyScreenState extends State<ThinksafetyScreen> {
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
            SizedBox(
              height: height * 5,
            ),
            SingleChildScrollView(
              child: Stack(
                clipBehavior:
                    Clip.none, // This ensures that the button is not clipped

                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        left: 8, top: 10, bottom: 10, right: 8),
                    height: height * 45,
                    width: width * 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        border:
                            Border.all(width: 7, color: HexColor("B20202"))),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Think Safety!",
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: HexColor("#000000"),
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * 0.8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Permit required?",
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: HexColor("#000000"),
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * 0.8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Lock Out Tag Out?",
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: HexColor("#000000"),
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * 0.8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Hazardous Zone?",
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: HexColor("#000000"),
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * 0.8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Working at Height?",
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: HexColor("#000000"),
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * 0.8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Dropped Objects?",
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: HexColor("#000000"),
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * 0.8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Moving Equipment / Lifting?",
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: HexColor("#000000"),
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * 0.8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Check Equipment and Fixings",
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: HexColor("#000000"),
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * 0.8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Housekeeping",
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: HexColor("#000000"),
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * 0.8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "STOP Work Authority / Cards",
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: HexColor("#000000"),
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: -height * 4,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const WorkscopetitleScreen()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: height * 7,
                        width: width * 42,
                        decoration: BoxDecoration(
                          color: HexColor("#3AAEFC"),
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
                          'Continue',
                          style: GoogleFonts.inter(
                              fontSize: 20,
                              color: HexColor("#FFFFFF"),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
