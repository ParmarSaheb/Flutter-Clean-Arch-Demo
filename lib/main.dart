import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_arch/res/routes/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = "MVVM Arch";
    return GetMaterialApp(
      title: title,
      initialRoute: RouteGenerator.splashScreen,
      theme: ThemeData(primarySwatch: Colors.teal),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

