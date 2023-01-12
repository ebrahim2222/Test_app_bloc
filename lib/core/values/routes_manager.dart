import 'package:flutter/material.dart';
import 'package:test_app/UI/screens/splash/splash_screen.dart';
import 'package:test_app/core/values/strings_manager.dart';

import '../../UI/screens/auth/login/login_screen.dart';
import '../../UI/screens/auth/register/register_screen.dart';

class RoutesManager {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
}

class RouteGenetator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesManager.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case RoutesManager.loginRoute:
        return MaterialPageRoute(builder: (_) =>  LoginScreen());

      case RoutesManager.registerRoute:
        return MaterialPageRoute(builder: (_) =>  RegisterScreen());
        
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title:const  Text(AppStrings.noRoute),
          ),
          body:const  Center(child: Text(AppStrings.noRoute)),
        );
      },
    );
  }
}