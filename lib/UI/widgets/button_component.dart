import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/core/screen_size.dart';

import '../../core/values/color_manager.dart';
import '../../core/values/font_manager.dart';
import '../../core/values/styles_manager.dart';
import '../../core/values/values_manager.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key,
      required this.text,
      required this.color,
      required this.onTap});
  final text;
  final color;
  final onTap;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, index) {
      return Container(
        margin: EdgeInsets.only(top: AppMargin.m10.h),
        alignment: Alignment.center,
        child: MaterialButton(
          minWidth: ScreenSize.getScreenWidth(context) * 0.9,
          height: 48.h,
          onPressed: onTap,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0.w)),
          clipBehavior: Clip.antiAlias,
          color: color,
          child: Text(
            text,
            style: getBoldStyle(
                fontSize: FontSizeManager.s18, color: ColorManager.white),
          ),
        ),
      );
    });
  }
}
