import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app/core/values/styles_manager.dart';
import 'package:test_app/core/values/values_manager.dart';

import 'color_manager.dart';
import 'font_manager.dart';


class ThemeManager {
  static ThemeData getApplicationTheme() {
    return ThemeData(
      // main theme
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.lightPrimary,
      primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.grey,
      splashColor: ColorManager.lightPrimary,
      //card theme
      cardTheme: CardTheme(
          color: ColorManager.white,
          shadowColor: ColorManager.grey,
          elevation: AppSize.s4),
      appBarTheme: AppBarTheme(
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarBrightness: Brightness.dark),
          centerTitle: true,
          color: ColorManager.primary,
          elevation: AppSize.s2,
          shadowColor: ColorManager.lightGrey,
          titleTextStyle: getReqularStyle(
              fontSize: FontSizeManager.s16, color: ColorManager.white)),
      buttonTheme: ButtonThemeData(
          shape: const StadiumBorder(),
          splashColor: ColorManager.grey,
          buttonColor: ColorManager.primary,
          disabledColor: ColorManager.grey),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: getReqularStyle(
                color: ColorManager.white,
                fontSize: FontSizeManager.s16,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(FontSizeManager.s12)))),
      textTheme: TextTheme(
          displayLarge: getSemiBoldStyle(
              color: ColorManager.darkGrey, fontSize: FontSizeManager.s16),
          headlineLarge: getSemiBoldStyle(
              color: ColorManager.darkGrey, fontSize: FontSizeManager.s16),
          headlineMedium: getReqularStyle(
              color: ColorManager.darkGrey, fontSize: FontSizeManager.s16),
          titleMedium: getMediumStyle(
              color: ColorManager.lightGrey, fontSize: FontSizeManager.s14),
          bodyLarge: getReqularStyle(color: ColorManager.darkGrey),
          bodySmall: getReqularStyle(color: ColorManager.grey)),
    );
  }
}
