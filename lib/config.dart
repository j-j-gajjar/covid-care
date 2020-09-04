import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Config {
  // App Colors
  static final Color primaryColor = Color(0XFF0C0B52);
  static final Color redColor = Color(0XFFEE716C);
  static final Color orangeColor = Color(0XFFFDB268);
  static final Color blueColor = Color(0XFF487EFA);
  static final Color greenColor = Color(0XFF51D16A);
  static final Color scaffoldColor = Color(0XFFFEFFFF);

  //Text Styles
  static final TextStyle titleStyle = GoogleFonts.poppins(
    fontSize: 18,
    color: Config.primaryColor,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle serviceStyle = GoogleFonts.poppins(
    color: Config.primaryColor.withOpacity(.8),
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle statsTitleStyle = GoogleFonts.poppins(
      color: Config.primaryColor.withOpacity(.8),
      fontSize: 14,
      fontWeight: FontWeight.w600);
  static final TextStyle infectedStyle =
      statsTitleStyle.copyWith(color: redColor);
  static final TextStyle curedStyle =
      statsTitleStyle.copyWith(color: greenColor);
  static final TextStyle deadStyle =
      statsTitleStyle.copyWith(color: Colors.grey[600]);
  static final TextStyle activeStyle =
      statsTitleStyle.copyWith(color: Colors.deepOrange);
}
