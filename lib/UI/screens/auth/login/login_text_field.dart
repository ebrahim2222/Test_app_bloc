import 'package:flutter/material.dart';
import '../../../../core/values/values_manager.dart';
import '../../../widgets/text_field.dart';

class LoginTextField extends StatelessWidget {
  final String hintName;
  const LoginTextField({super.key, required this.hintName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: AppMargin.m20),
      child: TextFieldWidget(
        left: 0.0,
        right: 0.0,
        top: 0.0,
        bottom: 0.0,
        hintName: hintName,
        onChange: (val) {},
        textInputType: TextInputType.text,
      ),
    );
    ;
  }
}
