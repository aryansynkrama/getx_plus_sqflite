import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding_screen_with_getx/views/dashboard.dart';
import 'package:onboarding_screen_with_getx/views/login_screen.dart';
import 'package:onboarding_screen_with_getx/views/my_example.dart';
import 'package:onboarding_screen_with_getx/views/pie_chart.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:UserLogin(),
    );
  }
}
