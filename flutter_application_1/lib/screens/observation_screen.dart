import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/setting_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class ObservationScreen extends StatefulWidget {
  const ObservationScreen({super.key});

  @override
  State<ObservationScreen> createState() => _ObservationScreenState();
}

class _ObservationScreenState extends State<ObservationScreen> {
  @override
  Widget build(BuildContext context) {
    var widthm = MediaQuery.of(context).size.width;
    var heightm = MediaQuery.of(context).size.height;

    double width = widthm / 100;
    double height = heightm / 100;

    return Scaffold(
      backgroundColor: HexColor("#3B96D2"),
      body: Container(
        height: height * 100,
        width: width * 100,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              HexColor("005E9D"),
              // HexColor("3B96D2"),
              HexColor("#00BFFF"),
              //  HexColor("3AAFFD"),
              HexColor("#00BFFF")
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0, 53, 100],
          ),
        ),
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Transform.scale(
                        scale: 1.2,
                        child: Container(
                          padding:
                              EdgeInsets.only(top: height * 2, left: width * 4),
                          child: Image.asset(
                            "assets/images/backarrow.png",
                          ),
                        ),
                      ),
                      const Spacer(),
                      Transform.scale(
                        scale: 1.2,
                        child: Container(
                          padding: EdgeInsets.only(
                              top: height * 2, right: width * 4),
                          child: Image.asset(
                            "assets/images/Vector.png",
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 1),
                  Transform.scale(
                    scale: 1.1,
                    child: Container(
                      child: Image.asset(
                        "assets/images/logo.png",
                        height: height * 13,
                        width: width * 45,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 5),
                  SizedBox(
                    height: height * 2.5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SettingScreen()));
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
                        'Observation',
                        style: GoogleFonts.inter(
                          fontSize: 19,
                          color: HexColor("#000000"),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 2.5,
                  ),
                  GestureDetector(
                    onTap: () {},
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
                        'Settings',
                        style: GoogleFonts.inter(
                          fontSize: 19,
                          color: HexColor("#000000"),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
