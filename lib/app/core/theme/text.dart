import 'package:flutter/material.dart';

class AppThemeText {
  static appTextTheme() => const TextTheme(
        headline5: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'ReadexPro',
          height: 1.2,
        ), //app bar title
        headline4: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
          fontFamily: 'ReadexPro',
          height: 1.2,
        ),
        headline3: TextStyle(
          fontSize: 16.0,
          // fontWeight: FontWeight.w600,
          fontFamily: 'ReadexPro',
          height: 1.2,
        ),
        headline2: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w700,
          height: 1.2,
        ),
        headline1: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w300,
          fontFamily: 'ReadexPro',
          height: 1.2,
        ),
        subtitle1: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          fontFamily: 'ReadexPro',
          height: 1.2,
        ),
        headline6: TextStyle(
          fontSize: 13.0,
          fontWeight: FontWeight.w600,
          fontFamily: 'ReadexPro',
          height: 1.2,
        ),
        bodyText2: TextStyle(
          fontSize: 14.0,
          fontFamily: 'ReadexPro',
          height: 1.2,
        ),
        bodyText1: TextStyle(
          fontSize: 14.0,
          fontFamily: 'ReadexPro',
          height: 1.2,
        ), //price
        caption: TextStyle(
          fontSize: 9.0,
          fontFamily: 'ReadexPro',
          height: 1.2,
        ),
      );
}
