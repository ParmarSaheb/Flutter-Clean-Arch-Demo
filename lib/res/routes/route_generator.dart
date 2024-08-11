import 'package:flutter/material.dart';
import 'package:mvvm_arch/view/homepage.dart';
import 'package:mvvm_arch/view/splash_screen.dart';


class RouteGenerator {
  static const splashScreen = '/';
  static const homePage = '/homepage';
  static const login = '/login';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case login:
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        throw const FormatException("Page Not Found");
    }
  }
}
