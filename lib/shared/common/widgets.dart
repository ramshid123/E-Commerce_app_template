import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Widget kText({
  required String text,
  Color color = Colors.black,
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.normal,
  int maxLines = 10,
}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    style: GoogleFonts.poppins(
      color: color,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
    ),
  );
}

Widget kHeight(double height) {
  return SizedBox(
    height: height,
  );
}

Widget kWidth(double width) {
  return SizedBox(
    width: width,
  );
}
