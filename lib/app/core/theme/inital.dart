import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:user_auth/app/core/theme/text.dart';
import 'colors.dart';

class AppThemeInitial {
  static appTheme() => ThemeData(
      primaryColor: AppColors.black,
      fontFamily: 'ReadexPro',
      backgroundColor: AppColors.black,
      useMaterial3: true,
      platform: TargetPlatform.iOS,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: AppThemeText.appTextTheme(),
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      bottomSheetTheme:
          const BottomSheetThemeData(modalBackgroundColor: Colors.white));
}
