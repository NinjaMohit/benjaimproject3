import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class Workscopetitle3dialogScreen extends StatefulWidget {
  const Workscopetitle3dialogScreen({super.key});
  @override
  State<Workscopetitle3dialogScreen> createState() =>
      _Workscopetitle3dialogScreenState();
}

class _Workscopetitle3dialogScreenState
    extends State<Workscopetitle3dialogScreen> {
  void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 20),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Transform.scale(
                            scale: 1.2,
                            child: Image.asset(
                              "assets/images/backarrow.png",
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "Serial Number  /  Type",
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: Text(
                        "Dimension  /  SWL",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 45,
                ),
                TextButton(
                  onPressed: () {
                    // Handle Corrective Action button pressed
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: double.infinity,
                      color: HexColor(
                          "00C620"), // Yellow color for Corrective Action
                      child: Text(
                        "PASS",
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {
                    // Handle FAIL button pressed
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: double.infinity,
                      color: HexColor("E52C12"), // Red color for FAIL
                      child: Text(
                        "Fail",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 90,
                  width: 210,
                  decoration: BoxDecoration(
                    color: HexColor("D9D9D9"),
                  ),
                  child: TextFormField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      filled: true,
                      hintText: "Comments",
                      hintStyle: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: HexColor("#000000"),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    keyboardType: TextInputType.name,
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Container(
                  height: 90,
                  width: 210,
                  decoration: BoxDecoration(
                    color: HexColor("D9D9D9"),
                  ),
                  child: TextFormField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      filled: true,
                      hintText: "Position",
                      hintStyle: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: HexColor("#000000"),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    keyboardType: TextInputType.name,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
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
        title: Column(
          children: [
            Text(
              'Workscope',
              style: GoogleFonts.inter(
                fontSize: 16,
                color: HexColor("#FFFFFF"),
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Task title',
              style: GoogleFonts.inter(
                fontSize: 16,
                color: HexColor("#FFFFFF"),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
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
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 0),
        child: Column(
          children: [
            SizedBox(
              height: height * 2,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: height * 9.3,
                    width: width * 17.8,
                    decoration: BoxDecoration(
                      color: HexColor("#000000"),
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          color: HexColor("4c4c4c"),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 54,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: width * 4),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: height * 9.3,
                    width: width * 21.2,
                    decoration: BoxDecoration(
                      color: HexColor("9A9A9A"),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pending',
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: HexColor("FFFFFF")),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: width * 4),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: height * 9.3,
                    width: width * 17.8,
                    decoration: BoxDecoration(
                      color: HexColor("EBCB25"),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'CA',
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              color: HexColor("#FFFFFF"),
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: width * 4),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: height * 9.3,
                    width: width * 24.5,
                    decoration: BoxDecoration(
                      color: HexColor("3AAEFC"),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Complete',
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              color: HexColor("#D9D9D9"),
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Task',
                          style: GoogleFonts.inter(
                              fontSize: 13,
                              color: HexColor("#D9D9D9"),
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 2.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    showCustomDialog(context);
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 7),
                    height: height * 7,
                    width: width * 73,
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
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        "Search Serial/Type",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: HexColor("#000000"),
                        ),
                      ),
                    ),
                    // child: TextFormField(
                    //   decoration: InputDecoration(
                    //     fillColor: Colors.transparent,
                    //     filled: true,
                    //     hintText: "Search Serial/Type",
                    //     hintStyle: GoogleFonts.inter(
                    //       fontSize: 16,
                    //       fontWeight: FontWeight.w400,
                    //       color: HexColor("#000000"),
                    //     ),
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(6),
                    //       borderSide: BorderSide.none,
                    //     ),
                    //   ),
                    //   keyboardType: TextInputType.emailAddress,
                    // ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                // Transform.scale(
                //   scale: 1.2,
                //   child: Container(
                //     padding: EdgeInsets.only(right: width * 4),
                //     child: Image.asset(
                //       "assets/images/blackimg.png",
                //     ),
                //   ),
                // ),
                Icon(
                  Icons.cast_connected,
                  size: (width + height) /
                      2 *
                      12, // Adjust the multiplier to get the desired size
                ),
              ],
            ),
            SizedBox(
              height: height * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Transform.scale(
                //   scale: 1.2,
                //   child: Container(
                //     padding: EdgeInsets.only(left: 6, right: 6),
                //     child: Image.asset(
                //       "assets/images/Rectangle 98.png",
                //     ),
                //   ),
                // ),

                Container(
                  padding: const EdgeInsets.only(left: 7, right: 8),
                  child: Transform.scale(
                    scale: 1.2,
                    child: Image.asset(
                      "assets/images/Rectangle 98.png",
                      height: height * 6.16,
                      width: width * 18.21,
                      // Set your desired width

                      fit: BoxFit
                          .contain, // Optional: adjust how the image fits within the dimensions
                    ),
                  ),
                ),
                Container(
                  height: height * 7.2,
                  width: width * 56.5,
                  padding: const EdgeInsets.only(left: 12),
                  decoration: BoxDecoration(
                    color: HexColor("#C4C4C4"),
                    border: Border.all(width: 1),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          "Drops ID / Type / Position",
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: HexColor("#000000"),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: height * 7.2,
                  width: width * 17,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    size: height * 6,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Transform.scale(
                //   scale: 1.2,
                //   child: Container(
                //     padding: EdgeInsets.only(left: 6, right: 6),
                //     child: Image.asset(
                //       "assets/images/Rectangle 98.png",
                //     ),
                //   ),
                // ),

                Container(
                  padding: const EdgeInsets.only(left: 7, right: 8),
                  child: Transform.scale(
                    scale: 1.2,
                    child: Image.asset(
                      "assets/images/Rectangle 98.png",
                      height: height * 6.16,
                      width: width * 18.21,
                      // Set your desired width

                      fit: BoxFit
                          .contain, // Optional: adjust how the image fits within the dimensions
                    ),
                  ),
                ),
                Container(
                  height: height * 7.2,
                  width: width * 56.5,
                  padding: const EdgeInsets.only(left: 12),
                  decoration: BoxDecoration(
                    color: HexColor("#C4C4C4"),
                    border: Border.all(width: 1),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          "Drops ID / Type / Position",
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: HexColor("#000000"),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: height * 7.2,
                  width: width * 17,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    size: height * 6,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Transform.scale(
                //   scale: 1.2,
                //   child: Container(
                //     padding: EdgeInsets.only(left: 6, right: 6),
                //     child: Image.asset(
                //       "assets/images/Rectangle 98.png",
                //     ),
                //   ),
                // ),

                Container(
                  padding: const EdgeInsets.only(left: 7, right: 8),
                  child: Transform.scale(
                    scale: 1.2,
                    child: Image.asset(
                      "assets/images/Rectangle 98.png",
                      height: height * 6.16,
                      width: width * 18.21,
                      // Set your desired width

                      fit: BoxFit
                          .contain, // Optional: adjust how the image fits within the dimensions
                    ),
                  ),
                ),
                Container(
                  height: height * 7.2,
                  width: width * 56.5,
                  padding: const EdgeInsets.only(left: 12),
                  decoration: BoxDecoration(
                    color: HexColor("#C4C4C4"),
                    border: Border.all(width: 1),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          "Drops ID / Type / Position",
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: HexColor("#000000"),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: height * 7.2,
                  width: width * 17,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    size: height * 6,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.3,
            ),
          ],
        ),
      ),
    );
  }
}
