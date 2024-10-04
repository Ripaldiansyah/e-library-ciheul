import 'package:e_library_ciheul/shared/theme/theme_data.dart';
import 'package:e_library_ciheul/state_util.dart';
import 'package:e_library_ciheul/core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Library',
      navigatorKey: Get.navigatorKey,
      theme: defaultTheme(),
      home: SplashView(),
    );
  }
}
