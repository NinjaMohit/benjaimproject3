import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/test_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../controllers/account_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool? isChecked = true;

  String? dropdownvalue;

  // List of items in our dropdown menu

  @override
  Widget build(BuildContext context) {
    var widthm = MediaQuery.of(context).size.width;
    var heightm = MediaQuery.of(context).size.height;

    print(widthm);
    print(heightm);

    double width = widthm / 100;
    double height = heightm / 100;
    print(width);
    print(height);

    final accountController = Get.put(AccountController());

    void clear() {
      usernameController.clear();
      passwordController.clear();
      accountController
          .setSelectedAccount(null); // Clear the dropdown selection
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: HexColor("005E9D"),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Container(
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
                    //stops: const [0, 53, 100],
                    stops: const [0, 20, 100],
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(
                      left: width * 8, top: 0, bottom: 0, right: width * 8),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 6,
                      ),
                      Transform.scale(
                        scale: 1.2,
                        child: Image.asset(
                          "assets/images/logo.png",
                          height: height * 13,
                          width: width * 45,
                        ),
                      ),
                      SizedBox(
                        height: height * 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Obx(() {
                            return Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: height * 2),
                              height: height * 8,
                              width: width * 80,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    HexColor("b4b4b4"),
                                    HexColor("#FAFAFA"),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  stops: const [0.0, 0.15],
                                ),
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                    color: HexColor("4c4c4c"),
                                    spreadRadius: 0,
                                    blurRadius: 2,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: height * 0),
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  icon: const SizedBox.shrink(),
                                  underline: const SizedBox.shrink(),
                                  value: accountController
                                          .selectedAccountSlug.value.isNotEmpty
                                      ? accountController
                                          .selectedAccountSlug.value
                                      : null,
                                  hint: Text(
                                    "Select Account",
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: HexColor("#000000"),
                                    ),
                                  ),
                                  items:
                                      accountController.accounts.map((account) {
                                    return DropdownMenuItem<String>(
                                      value: account.accountSlug,
                                      child: Text(account.instanceName),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    accountController
                                        .setSelectedAccount(newValue);
                                  },
                                ),
                              ),
                            );
                          }),

                          // child: Padding(
                          //   padding: EdgeInsets.only(left: height * 0),
                          //   child: DropdownButton<String>(
                          //     isExpanded: true,
                          //     icon: const SizedBox.shrink(),
                          //     underline: const SizedBox.shrink(),
                          //     value: dropdownvalue, // Your selected value
                          //     hint: Text(
                          //       "Select Account",
                          //       style: GoogleFonts.inter(
                          //         fontSize: 16,
                          //         fontWeight: FontWeight.w400,
                          //         color: HexColor("#000000"),
                          //       ),
                          //     ),
                          //     items: items.map((String item) {
                          //       return DropdownMenuItem<String>(
                          //         value: item,
                          //         child: Text(item),
                          //       );
                          //     }).toList(),
                          //     onChanged: (String? newValue) {
                          //       setState(() {
                          //         dropdownvalue =
                          //             newValue; // Update the selected value
                          //       });
                          //       print(
                          //           "Selected account: $newValue"); // Debug statement
                          //     },
                          //   ),
                          // ),

                          SizedBox(
                            height: height * 3.5,
                          ),
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
                                  stops: const [0.0, 0.15]),
                              color: HexColor("#FAFAFA"), //

                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                  color: HexColor("4c4c4c"), // Shadow color
                                  spreadRadius:
                                      0, // How much the shadow spreads
                                  blurRadius: 2,
                                  // The blur effect for the shadow
                                  offset: const Offset(
                                      0, 4), // Position of the shadow
                                ),
                              ],
                            ),
                            child: TextFormField(
                              textAlign: TextAlign
                                  .start, // Correct usage here, outside of InputDecoration

                              controller: usernameController,
                              decoration: InputDecoration(
                                hintText: 'Username',
                                hintStyle: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: HexColor("#000000")),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: BorderSide
                                      .none, // No border to avoid overlap with Container border
                                ),
                              ),
                              keyboardType: TextInputType.name,
                            ),
                          ),
                          SizedBox(
                            height: height * 3.5,
                          ),
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
                                  stops: const [0.0, 0.15]),
                              color: HexColor("#FAFAFA"), // Background color
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                  color: HexColor("4c4c4c"), // Shadow color
                                  spreadRadius:
                                      0, // How much the shadow spreads
                                  blurRadius: 2,
                                  blurStyle: BlurStyle.normal,
                                  // The blur effect for the shadow
                                  offset: const Offset(
                                      0, 4), // Position of the shadow
                                ),
                              ],
                            ),
                            child: TextFormField(
                              textAlign: TextAlign.start,
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                fillColor: Colors
                                    .transparent, // This should be transparent because the Container provides the background color
                                filled: true,
                                hintText: "Password",
                                hintStyle: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: HexColor("#000000")),

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: BorderSide
                                      .none, // No border to avoid overlap with Container border
                                ),
                              ),
                              keyboardType: TextInputType.name,
                            ),
                          ),
                          SizedBox(
                            height: height * 4,
                          ),
                        ],
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Transform.scale(
                                scale: 1.8,
                                child: Checkbox(
                                  activeColor: HexColor("#D9D9D9"),
                                  side: BorderSide(color: HexColor("#D9D9D9")),
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 2,
                            ),
                            Flexible(
                              child: Text(
                                "Remember me",
                                style: GoogleFonts.inter(
                                    fontSize: 14,
                                    color: HexColor("#FFFFFF"),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 3,
                      ),
                      Expanded(
                        child: Text(
                          "Forget Password?",
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              color: HexColor("#FFFFFF"),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: height * 4,
                      ),
                      GestureDetector(
                        onTap: () async {
                          // if (usernameController.text.isNotEmpty &&
                          //     passwordController.text.isNotEmpty &&
                          //     accountController
                          //         .selectedAccountSlug.value.isNotEmpty) {
                          //   accountController.login(
                          //     usernameController.text,
                          //     passwordController.text,
                          //     true,
                          //   );
                          //   Get.to(() => const TestScreen());
                          //   clear();
                          // } else {
                          //   Get.snackbar(
                          //     'Error',
                          //     'Please fill all fields!',
                          //     snackPosition: SnackPosition.BOTTOM,
                          //   );
                          // }
                          // if (usernameController.text.isNotEmpty &&
                          //     passwordController.text.isNotEmpty &&
                          //     accountController
                          //         .selectedAccountSlug.value.isNotEmpty &&
                          //     usernameController.text.length >= 8 &&
                          //     passwordController.text.length >= 5) {
                          //   accountController.login(
                          //     usernameController.text,
                          //     passwordController.text,
                          //   );

                          Get.to(() => CertificateView());

                          clear();
                          // } else {
                          //   Get.snackbar(
                          //     'Error',
                          //     'Invalid login credentials!',
                          //     snackPosition: SnackPosition.BOTTOM,
                          //   );
                          // }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: height * 7,
                          width: width * 60,
                          decoration: BoxDecoration(
                            color: HexColor("#FFCA11"),
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: [
                              BoxShadow(
                                color: HexColor("4c4c4c"), // Shadow color
                                spreadRadius: 0, // How much the shadow spreads
                                blurRadius: 2,
                                // The blur effect for the shadow
                                offset: const Offset(
                                    0, 4), // Position of the shadow
                              ),
                            ],
                          ),
                          child: Text(
                            'LOGIN',
                            style: GoogleFonts.inter(
                                fontSize: 20,
                                color: HexColor("#FFFFFF"),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 17,
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
