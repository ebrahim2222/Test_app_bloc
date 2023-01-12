import 'package:flutter/material.dart';

import '../../../../core/values/values_manager.dart';
import '../../../widgets/text_field.dart';

// ignore: must_be_immutable
class RegisterTextField extends StatelessWidget {
  final String hint;
  dynamic onChanged;
   RegisterTextField({super.key, required this.hint , required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      left: AppMargin.m20,
      right: AppMargin.m20,
      top: AppMargin.m12,
      bottom: 0.0,
      hintName: hint,
      onChange: onChanged,
      textInputType: TextInputType.text,
    );
    
  }
}


