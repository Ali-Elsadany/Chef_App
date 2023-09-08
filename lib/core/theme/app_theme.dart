import 'package:chef_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

ThemeData getAppTheme() {
  return ThemeData(
    //!scaffold theme
    scaffoldBackgroundColor: AppColors.white,
    //!appBar theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,

    ),
    //!elevatedButton theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: AppColors.primary),
    ),
    //!text field
    inputDecorationTheme: InputDecorationTheme(
      //?enabled border
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      //?fouced border
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      //?error border
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      //?hint
      hintStyle: CustomTextStyles.latoStyle16,
    ),
  );
}
