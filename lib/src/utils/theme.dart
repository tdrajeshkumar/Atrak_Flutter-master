import 'package:flutter/material.dart';

class AtrakTheme {
  static Color gradientStartColor = Color(0xFF36D1DC);
  static Color gradientEndColor = Color(0xFF2948FF);
  static Color greyColor = Color(0xFF999999);
  static Color darkGreyColor = Color(0xFF4D4D4D);
  static Color backgroundColor = Color(0xFFEEF0F2);
  static Color backArrowColor = Color(0xFF35c4e0);
  static Color iconColor = Colors.white;
  static Color textIndicatorColor = Color(0xFF19BCF4);
  static Color dividerColor = Color(0xFFD5D5D5);

  /// SlideBar Color
  static Color slideBarCheckInColor = Color(0xFF39B54A);
  static Color slideBarCheckOutColor = Color(0xFFF7931E);
  static Color slideBarTextColor = Color(0xFFAFAFAF);
  static Color slideBarBackgroundColor = Color(0xFFF2F2F2);

  /// Attendace Marker Color
  static Color leaveColor = Color(0xFFF15A24);
  static Color holidayColor = Color(0xFF00DF93);

  /// FormField Text Style
  static TextStyle formFieldStyle = TextStyle(
      fontFamily: 'WorkSanks',
      color: greyColor,
      fontSize: 16.0,
      fontWeight: FontWeight.normal);

  static get theme {
    final originalTextTheme = ThemeData.light().textTheme;
    final originalBody1 = originalTextTheme.body1;
    final originalBody2 = originalTextTheme.body2;

    return ThemeData.light().copyWith(
        primaryColor: gradientStartColor,
        accentColor: gradientEndColor,
        backgroundColor: backgroundColor,
        primaryColorLight: gradientStartColor,
        scaffoldBackgroundColor: backgroundColor,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.green,
          textTheme: ButtonTextTheme.primary,
        ),
        textTheme: originalTextTheme.copyWith(
          headline: TextStyle(
            fontFamily: 'WorkSanks',
            color: AtrakTheme.darkGreyColor,
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
          ),
          title: TextStyle(
              fontFamily: 'WorkSanks',
              color: AtrakTheme.greyColor,
              fontWeight: FontWeight.w700,
              fontSize: 24.0),
          button: TextStyle(
            fontFamily: 'WorkSanks',
            fontWeight: FontWeight.w400,
            fontSize: 22.0,
          ),
          subtitle: TextStyle(
              fontFamily: 'WorkSanks',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal,
              color: darkGreyColor,
              fontSize: 16),
          display1: TextStyle(
              fontFamily: 'WorkSanks',
              fontStyle: FontStyle.normal,
              color: darkGreyColor),
          display2: TextStyle(
              fontFamily: 'WorkSanks',
              fontWeight: FontWeight.w200,
              color: darkGreyColor),
          display3: TextStyle(
              fontFamily: 'WorkSanks',
              fontWeight: FontWeight.w600,
              color: darkGreyColor),
        ));
  }
}
