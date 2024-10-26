import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/archiveobsscreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class Emptyscreen extends StatefulWidget {
  const Emptyscreen({super.key});

  @override
  State<Emptyscreen> createState() => _EmptyScreenState();
}

class _EmptyScreenState extends State<Emptyscreen> {
  @override
  Widget build(BuildContext context) {
    var widthm = MediaQuery.of(context).size.width;
    var heightm = MediaQuery.of(context).size.height;

    double width = widthm / 100;
    double height = heightm / 100;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("02609F"),
        toolbarHeight: height * 10,
        leading: Transform.scale(
          scale: 1.2,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(),
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
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ArchiveObsScreen()));
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
    );
  }
}
