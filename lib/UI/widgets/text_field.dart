// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../../core/values/color_manager.dart';
import '../../core/values/font_manager.dart';
import '../../core/values/styles_manager.dart';
import '../../core/values/values_manager.dart';

class TextFieldWidget extends StatelessWidget {
  final left;
  final right;
  final top;
  final bottom;
  final hintName;
  final onChange;
  final TextInputType textInputType;

  const TextFieldWidget(
      {Key? key,
      required this.left,
      required this.right,
      required this.top,
      required this.bottom,
      required this.hintName,
      required this.onChange,
      required this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      keyboardType: textInputType,
      style: getMediumStyle(
          fontSize: FontSizeManager.s18, color: ColorManager.primary),
      decoration: InputDecoration(
        contentPadding:
            EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
        hintText: hintName,
        hintStyle: getMediumStyle(
            color: ColorManager.lightGrey, fontSize: FontSizeManager.s18),
        labelStyle: getMediumStyle(
            color: ColorManager.primary, fontSize: FontSizeManager.s20),
        errorStyle: getReqularStyle(
            color: ColorManager.red, fontSize: FontSizeManager.s16),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: ColorManager.darkGrey, width: AppSize.s1),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.darkPrimary, width: AppSize.s1),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorManager.red, width: AppSize.s1),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.primary, width: AppSize.s1),
        ),
      ),
    );
  }
}

class TextFieldWidgetWithoutIcon extends StatelessWidget {
  final left;
  final right;
  final top;
  final bottom;
  final hintName;
  final obsecure;
  final enable;
  final TextEditingController controller;

  const TextFieldWidgetWithoutIcon(
      {Key? key,
      required this.left,
      required this.right,
      required this.top,
      required this.bottom,
      required this.hintName,
      required this.controller,
      required this.obsecure,
      required this.enable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsecure,
      style: getMediumStyle(
          fontSize: FontSizeManager.s18, color: ColorManager.primary),
      decoration: InputDecoration(
          hintStyle: getMediumStyle(
              color: ColorManager.lightGrey, fontSize: FontSizeManager.s18),
          labelStyle: getMediumStyle(
              color: ColorManager.primary, fontSize: FontSizeManager.s20),
          errorStyle: getReqularStyle(
              color: ColorManager.red, fontSize: FontSizeManager.s16),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: ColorManager.darkGrey, width: AppSize.s1),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.darkPrimary, width: AppSize.s1),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorManager.red, width: AppSize.s1),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.primary, width: AppSize.s1),
          ),
          contentPadding: EdgeInsets.only(
              left: left, right: right, top: top, bottom: bottom),
          hintText: hintName,
          enabled: enable),
    );
  }
}
