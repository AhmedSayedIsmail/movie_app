import 'package:flutter/material.dart';
import 'package:flutter_app/core/services/services_locator.dart';
import 'package:flutter_app/core/utils/app_string.dart';
import 'package:flutter_app/movies/persentation/screens/onboarding_screen.dart';

void main() async {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: AppString.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.grey.shade900,
        ),
        home: const OnBoardingScreen()
        
        );
  }
}
