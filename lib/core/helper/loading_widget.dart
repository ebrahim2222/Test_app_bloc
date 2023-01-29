import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../core/values/color_manager.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: ColorManager.white,
      child: Center(
        child: LoadingAnimationWidget.bouncingBall(
          size: 100,
          color: ColorManager.lightPrimary,
        ),
      ),
    );
  }
}
