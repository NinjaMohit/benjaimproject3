import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/observation_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
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
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 5),
                      height: height * 7,
                      width: width * 80,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            HexColor("#b4b4b4"),
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
                            color: HexColor("4c4c4c"),
                            spreadRadius: 0,
                            blurRadius: 2,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          filled: true,
                          hintText: "Location",
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
                    height: height * 3.5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Container(
                          margin: EdgeInsets.only(left: width * 20),
                          child: Text(
                            'Inspection Type',
                            style: GoogleFonts.inter(
                              fontSize: 22,
                              color: HexColor("#FFFFFF"),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 2.5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ObservationScreen()));
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
                        'Dropped Objects',
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
                        'Fall Protection',
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
                        'Lifting gear',
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
                        'EX',
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
