import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({super.key});

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var widthm = MediaQuery.of(context).size.width;
    var heightm = MediaQuery.of(context).size.height;

    double width = widthm / 100;
    double height = heightm / 100;
    print(width);
    print(height);

    return Scaffold(
      resizeToAvoidBottomInset:
          false, // Allow the Scaffold to adjust when the keyboard appears
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height * 10),
              Transform.scale(
                scale: 1.2,
                child: Image.asset(
                  "assets/images/logo.png",
                  height: height * 13,
                  width: width * 45,
                ),
              ),
              SizedBox(
                height: height * 7,
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  return SizedBox(
                    width: width * 100,
                    child: AlertDialog(
                      backgroundColor: HexColor("#F0F0F0"),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      title: Text(
                        textAlign: TextAlign.center,
                        'Forgot Password',
                        style: GoogleFonts.inter(
                          fontSize: 22,
                          color: HexColor("#000000"),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      content: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Submit email address for administrator action',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: HexColor("#000000"),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: height * 2),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: height * 1),
                              height: height * 7.5,
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
                                borderRadius: BorderRadius.circular(6),
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
                                controller: emailController,
                                decoration: InputDecoration(
                                  fillColor: Colors.transparent,
                                  filled: true,
                                  hintText: "Email Address",
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
                            SizedBox(height: height * 2),
                          ],
                        ),
                      ),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed('/successforgetpass');
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: height * 7,
                                  width: width * 29,
                                  decoration: BoxDecoration(
                                    color: HexColor("#FFCA11"),
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
                                    'Submit',
                                    style: GoogleFonts.inter(
                                        fontSize: 20,
                                        color: HexColor("#FFFFFF"),
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: width * 1),
                            Flexible(
                              child: GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: height * 7,
                                  width: width * 29,
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
                                    'Cancel',
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
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
