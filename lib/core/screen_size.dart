import 'package:flutter/material.dart';

class ScreenSize {
 static getScreenWidth(context) {
    return MediaQuery.of(context).size.width;
  }
  static getScreenHeight(context) {
    return MediaQuery.of(context).size.height;
  }
}
