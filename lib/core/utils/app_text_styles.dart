import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class CustomTextStyles {
  static TextStyle latoStyle16 = GoogleFonts.lato(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: const Color(0xff1E1E1E),
  );
  static TextStyle latoStyle36 = GoogleFonts.lato(
    fontSize: 36,
    fontWeight: FontWeight.w700,
    color: const Color(0xff1E1E1E),
  );

  static TextStyle latoStyle24 = GoogleFonts.lato(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: const Color(0xff1E1E1E),
  );
  static TextStyle poppinsStyle24 = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: const Color(0xffFFFFFF),
  );
  static TextStyle poppinsStyle16 = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: const Color(0xffFFFFFF),
  );
}
