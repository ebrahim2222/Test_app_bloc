import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_app/core/values/routes_manager.dart';

import '../../../core/values/assets_manager.dart';
import '../../../core/values/color_manager.dart';
import '../../../helper/navigate_to_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _startDelay();
    super.initState();
  }

  Timer? timer;

  _startDelay() {
    timer = Timer(const Duration(seconds: 3), () async {
      navigateToScreen(context, RoutesManager.loginRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      body: Center(child: Image.asset(AssetsManager.logo)),
    );
  }


  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
  }
}
