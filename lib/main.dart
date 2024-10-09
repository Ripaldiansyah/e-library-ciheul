import 'package:drift/drift.dart';
import 'package:e_library_ciheul/daos/user/user_dao.dart';
import 'package:e_library_ciheul/database/app_database.dart';
import 'package:e_library_ciheul/shared/theme/theme_data.dart';
import 'package:e_library_ciheul/shared/util/hash.dart';
import 'package:e_library_ciheul/state_util.dart';
import 'package:e_library_ciheul/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: primaryColor,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Get.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: defaultTheme(),
      home: MainNavigationView(),
    );
  }
}
