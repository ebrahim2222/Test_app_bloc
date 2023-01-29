import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/DI/d_injection.dart';
import 'core/values/routes_manager.dart';
import 'core/values/theme_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // initialize dependency inlection
  DependencyInjection.setup();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Test App',
          debugShowCheckedModeBanner: false,
          theme: ThemeManager.getApplicationTheme(),
          initialRoute: RoutesManager.splashRoute,
          onGenerateRoute: RouteGenetator.onGenerateRoute,
        );
      },
    );
  }
}
