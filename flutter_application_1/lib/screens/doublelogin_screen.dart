import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/location_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class DoubleloginScreen extends StatefulWidget {
  const DoubleloginScreen({super.key});

  @override
  State<DoubleloginScreen> createState() => _DoubleloginScreenState();
}

class _DoubleloginScreenState extends State<DoubleloginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool? isChecked = true;

  String? dropdownvalue;

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: HexColor("#3B96D2"),
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
                    // stops: const [0, 53, 100],
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
                      Image.asset(
                        "assets/images/logo.png",
                        height: height * 13,
                        width: width * 45,
                      ),
                      SizedBox(
                        height: height * 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(
                              left: 5,
                            ),
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
                                  stops: const [0.0, 0.15]),
                              color: HexColor("#FAFAFA"), // Background color
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
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: DropdownButton(
                                isExpanded: true,
                                // Initial Value
                                icon: const SizedBox.shrink(),
                                underline: const SizedBox.shrink(),

                                value: dropdownvalue,
                                hint: Text(
                                  "Select Account",
                                  style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: HexColor("#000000")),
                                ),

                                // Array list of items
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownvalue = newValue!;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 3.5,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(left: 5),
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
                            padding: const EdgeInsets.only(left: 5),
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
                            height: height * 2,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 1,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: width * 8,
                            top: 0,
                            bottom: 0,
                            right: width * 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Flexible(
                              child: Text(
                                "Forget Password?",
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const LocationScreen()));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: height * 7,
                          width: width * 60,
                          decoration: BoxDecoration(
                            color: HexColor("#FFCA11"),
                            borderRadius: BorderRadius.circular(2),
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
