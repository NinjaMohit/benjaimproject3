import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/thinksafety_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class Inspectionsummary extends StatefulWidget {
  const Inspectionsummary({super.key});

  @override
  State<Inspectionsummary> createState() => _InspectionsummaryScreenState();
}

class _InspectionsummaryScreenState extends State<Inspectionsummary> {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 5, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tasks title',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: HexColor("#000000"),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: height * 0.6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Location',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: HexColor("#000000"),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Due Date',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: HexColor("#000000"),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Remaining',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: HexColor("#000000"),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.6),
              Container(
                height: 6,
                width: double.infinity,
                color: HexColor("#FFCA11"),
              ),
              SizedBox(height: height * 2),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Last Inspection',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: HexColor("#000000"),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: height * 0.3),
                        Container(
                          height: height * 6,
                          width: width * 43,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                width: 1, color: HexColor("#02609F")),
                            color: HexColor("#C4C4C4"),
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            decoration: InputDecoration(
                              fillColor: Colors.transparent,
                              filled: true,
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
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: width * 2), // Adjust space between columns
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Validity',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: HexColor("#000000"),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: height * 0.3),
                        Container(
                          height: height * 6,
                          width: width * 43,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                width: 1, color: HexColor("#02609F")),
                            color: HexColor("#C4C4C4"),
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            decoration: InputDecoration(
                              fillColor: Colors.transparent,
                              filled: true,
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
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.5,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: HexColor("#000000"),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: height * 0.3),
                        Container(
                          height: height * 6,
                          width: width * 43,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                width: 1, color: HexColor("#02609F")),
                            color: HexColor("#C4C4C4"),
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            decoration: InputDecoration(
                              fillColor: Colors.transparent,
                              filled: true,
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
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: width * 2), // Adjust space between columns
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Standard referenced',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: HexColor("#000000"),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: height * 0.3),
                        Container(
                          height: height * 6,
                          width: width * 43,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                width: 1, color: HexColor("#02609F")),
                            gradient: LinearGradient(
                              colors: [
                                HexColor("#555356"),
                                HexColor("#FAFAFA"),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: const [0.0, 0.15],
                            ),
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            decoration: InputDecoration(
                              fillColor: Colors.transparent,
                              filled: true,
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
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 2,
              ),
              Text(
                'Task Comments',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: HexColor("#000000"),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: height * 1),
              Container(
                height: height * 19,
                width: width * 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1, color: HexColor("#02609F")),
                  gradient: LinearGradient(
                    colors: [
                      HexColor("#555356"),
                      HexColor("#FAFAFA"),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.0, 0.05],
                  ),
                ),
                child: TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    filled: true,
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
              SizedBox(
                height: height * 2.5,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  height: height * 6.2,
                  width: width * 90,
                  decoration: BoxDecoration(
                    color: HexColor("#FFCA11"),
                    border: Border.all(width: 0.9),
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
                    'Start',
                    style: GoogleFonts.inter(
                        fontSize: 19,
                        color: HexColor("#FFFFFF"),
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(
                height: height * 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Inspection Summary',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      color: HexColor("#000000"),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.3),
              Container(
                height: 6,
                width: double.infinity,
                color: HexColor("#FFCA11"),
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: HexColor("#000000"),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Pending',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: HexColor("#000000"),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: height * 0.3),
                      Container(
                        height: height * 5,
                        width: width * 16,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(width: 1, color: HexColor("#02609F")),
                          color: HexColor("#C4C4C4"),
                        ),
                        child: TextFormField(
                          maxLines: 1,
                          decoration: InputDecoration(
                            fillColor: Colors.transparent,
                            filled: true,
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
                    ],
                  ),
                  SizedBox(
                    width: width * 2.5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: HexColor("#000000"),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Pass',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: HexColor("#000000"),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: height * 0.3),
                      Container(
                        height: height * 5,
                        width: width * 16,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(width: 1, color: HexColor("#02609F")),
                          color: HexColor("#C4C4C4"),
                        ),
                        child: TextFormField(
                          maxLines: 1,
                          decoration: InputDecoration(
                            fillColor: Colors.transparent,
                            filled: true,
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
                    ],
                  ),
                  SizedBox(
                    width: width * 2.5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: HexColor("#000000"),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Fail',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: HexColor("#000000"),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: height * 0.3),
                      Container(
                        height: height * 5,
                        width: width * 16,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(width: 1, color: HexColor("#02609F")),
                          color: HexColor("#C4C4C4"),
                        ),
                        child: TextFormField(
                          maxLines: 1,
                          decoration: InputDecoration(
                            fillColor: Colors.transparent,
                            filled: true,
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
                    ],
                  ),
                  SizedBox(
                    width: width * 2.5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '   Not ',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: HexColor("#000000"),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Found',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: HexColor("#000000"),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: height * 0.3),
                      Container(
                        height: height * 5,
                        width: width * 16,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(width: 1, color: HexColor("#02609F")),
                          color: HexColor("#C4C4C4"),
                        ),
                        child: TextFormField(
                          maxLines: 1,
                          decoration: InputDecoration(
                            fillColor: Colors.transparent,
                            filled: true,
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
                    ],
                  ),
                  SizedBox(
                    width: width * 2.5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'No ',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: HexColor("#000000"),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Access',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: HexColor("#000000"),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: height * 0.5),
                      Container(
                        height: height * 5,
                        width: width * 16,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(width: 1, color: HexColor("#02609F")),
                          color: HexColor("#C4C4C4"),
                        ),
                        child: TextFormField(
                          maxLines: 1,
                          decoration: InputDecoration(
                            fillColor: Colors.transparent,
                            filled: true,
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
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: height * 2,
              ),
              Text(
                'Inspection Comments',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: HexColor("#000000"),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: height * 1),
              Container(
                height: height * 17,
                width: width * 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1, color: HexColor("#02609F")),
                  gradient: LinearGradient(
                    colors: [
                      HexColor("#555356"),
                      HexColor("#FAFAFA"),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.0, 0.05],
                  ),
                ),
                child: TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    filled: true,
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
              SizedBox(
                height: height * 2.5,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ThinksafetyScreen()));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: height * 6.2,
                  width: width * 90,
                  decoration: BoxDecoration(
                    color: HexColor("#00C620"),
                    border: Border.all(width: 0.9),
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
                    'Complete',
                    style: GoogleFonts.inter(
                        fontSize: 19,
                        color: HexColor("#FFFFFF"),
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
