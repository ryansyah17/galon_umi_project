import 'package:flutter/material.dart';
import 'package:galon_umi_project/infrastructure/theme/constant/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle heading1 = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static TextStyle bodyText = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );
  static TextStyle subBodyText = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.black,
  );

  static TextStyle buttonText = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
}
