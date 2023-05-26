import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:phone_activator/core/locator.dart';
import 'package:phone_activator/core/router.dart';

import 'theme/light_theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Hive.initFlutter();
  setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: theme,
      routerConfig: router,
    );
  }
}
