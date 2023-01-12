import 'package:flutter/material.dart';
import 'package:test_app/core/values/font_manager.dart';

TextStyle _getTextStyle(double fontSize, String fontFamily,
    FontWeight fontWeight, Color fontColor) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: fontColor);
}

// thin style

TextStyle getThinStyle({double fontSize = FontSizeManager.s12, color}) {
  return _getTextStyle(
      fontSize, FontManager.fontFaminl, FontWeightManager.thin, color);
}

// extraLight style

TextStyle getExtraLightStyle({double fontSize = FontSizeManager.s12, color}) {
  return _getTextStyle(
      fontSize, FontManager.fontFaminl, FontWeightManager.extraLight, color);
}

// light style

TextStyle getLightStyle({double fontSize = FontSizeManager.s12, color}) {
  return _getTextStyle(
      fontSize, FontManager.fontFaminl, FontWeightManager.ligth, color);
}

// regular style

TextStyle getReqularStyle({double fontSize = FontSizeManager.s12, color}) {
  return _getTextStyle(
      fontSize, FontManager.fontFaminl, FontWeightManager.reqular, color);
}

// meduim style

TextStyle getMediumStyle({double fontSize = FontSizeManager.s12, color}) {
  return _getTextStyle(
      fontSize, FontManager.fontFaminl, FontWeightManager.medium, color);
}

// bold style

TextStyle getBoldStyle({double fontSize = FontSizeManager.s12, color}) {
  return _getTextStyle(
      fontSize, FontManager.fontFaminl, FontWeightManager.bold, color);
}

// semiBold style

TextStyle getSemiBoldStyle({double fontSize = FontSizeManager.s12, color}) {
  return _getTextStyle(
      fontSize, FontManager.fontFaminl, FontWeightManager.semiBold, color);
}

// extraBold style

TextStyle getExtraBoldStyle({double fontSize = FontSizeManager.s12, color}) {
  return _getTextStyle(
      fontSize, FontManager.fontFaminl, FontWeightManager.extraBold, color);
}
