import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/doublelogin_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class SuccessForgetpass extends StatefulWidget {
  const SuccessForgetpass({super.key});

  @override
  State<SuccessForgetpass> createState() => _SuccessForgetpassState();
}

class _SuccessForgetpassState extends State<SuccessForgetpass> {
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
                  SizedBox(height: height * 6),
                  Transform.scale(
                    scale: 1.2,
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: height * 13,
                      width: width * 45,
                    ),
                  ),
                  SizedBox(height: height * 1),
                  SizedBox(
                    height:
                        height * 50, // Adjusted height to better fit content
                    width: width * 100,
                    child: Flexible(
                      child: AlertDialog(
                        backgroundColor: HexColor("#F0F0F0"),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        title: Center(
                          child: Flexible(
                            child: Text(
                              'Success',
                              style: GoogleFonts.inter(
                                fontSize: 22,
                                color: HexColor("#000000"),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),

                        contentPadding:
                            EdgeInsets.symmetric(horizontal: width * 6),
                        content: Column(
                          mainAxisSize:
                              MainAxisSize.min, // Minimize height usage
                          children: [
                            SizedBox(
                              height: height * 1,
                            ),
                            Flexible(
                              child: Text(
                                'If your email address is registered, your login information has been sent to your email.',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  color: HexColor("#000000"),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        actionsPadding: EdgeInsets.fromLTRB(0, width * 3, 0,
                            0), // Remove extra space between content and button
                        actions: [
                          Center(
                            child: Flexible(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const DoubleloginScreen()));
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: height * 7,
                                  width: width * 30,
                                  decoration: BoxDecoration(
                                    color: HexColor("#8F8F8F"),
                                    borderRadius: BorderRadius.circular(2),
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
                                    'Close',
                                    style: GoogleFonts.inter(
                                      fontSize: 20,
                                      color: HexColor("#FFFFFF"),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 2,
                          )
                        ],
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
