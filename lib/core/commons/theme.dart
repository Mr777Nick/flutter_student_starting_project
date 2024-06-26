import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_lecture_app/core/commons/colors_const.dart';
import 'package:student_lecture_app/presentation/widgets/organisms/ui_helper.dart';

class AppTheme {
  AppTheme._();
  static ThemeData theme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: ColorConstant.whiteColor,
    brightness: Brightness.light,
    primaryColor: ColorConstant.black,
    textTheme: textTheme,
    primaryTextTheme: textTheme.apply(
      bodyColor: ColorConstant.black,
      displayColor: ColorConstant.black,
      decorationColor: ColorConstant.black,
    ),
    appBarTheme: AppBarTheme(
      scrolledUnderElevation: 0,
      toolbarHeight: UIHelper.setSp(70),
      color: Colors.white,
      actionsIconTheme: const IconThemeData(color: Colors.black),
      iconTheme: const IconThemeData(color: Colors.black),
      titleTextStyle: GoogleFonts.poppins().copyWith(
        color: ColorConstant.black,
        fontWeight: FontWeight.bold,
        fontSize: UIHelper.setSp(17),
      ),
      shadowColor: ColorConstant.lightGrey.withOpacity(0.2),
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
      size: UIHelper.setSp(15),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) {
            return ColorConstant.primary; // Disabled color
          }
          return ColorConstant.primary; // Regular color
        }),
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) {
            return ColorConstant.grey; // Disabled color
          }
          return ColorConstant.lightBlue; // Regular color
        }),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(UIHelper.padding(vertical: 12, horizontal: 50)),
        elevation: MaterialStateProperty.all<double>(0),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(UIHelper.setSp(10)),
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) {
            return ColorConstant.lightGrey; // Disabled color
          }
          return ColorConstant.primary; // Regular color
        }),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
      ),
    ),
    dividerTheme: DividerThemeData(
      color: ColorConstant.grey.withOpacity(0.5),
    ),
  );

  static TextTheme textTheme = TextTheme(
    displayLarge: GoogleFonts.poppins().copyWith(
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: GoogleFonts.poppins().copyWith(
      fontSize: 18.sp,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: GoogleFonts.poppins().copyWith(
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
    ),
    headlineLarge: GoogleFonts.poppins().copyWith(
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: GoogleFonts.poppins().copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
    ),
    headlineSmall: GoogleFonts.poppins().copyWith(
      fontSize: 12.sp,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: GoogleFonts.poppins().copyWith(
      fontSize: 10.sp,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: GoogleFonts.poppins().copyWith(fontSize: 14.sp),
    bodyMedium: GoogleFonts.poppins().copyWith(fontSize: 16.sp),
    titleMedium: GoogleFonts.poppins(fontSize: 18.sp),
    titleSmall: GoogleFonts.poppins(fontSize: 20.sp),
    bodySmall: GoogleFonts.poppins(fontSize: 12.sp),
    labelLarge: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.bold),
    labelMedium: GoogleFonts.poppins(fontSize: 12.sp),
    labelSmall: GoogleFonts.poppins(
      fontSize: 10.sp,
      letterSpacing: 0.0,
    ),
  ).apply(
    bodyColor: Colors.black,
    displayColor: Colors.black,
    decorationColor: Colors.black,
  );

  static List<BoxShadow> defaultBoxShadow = [
    BoxShadow(
      color: Colors.grey.withOpacity(0.2),
      spreadRadius: 5,
      blurRadius: 5,
      offset: const Offset(0, 1), // changes position of shadow
    ),
  ];
}
