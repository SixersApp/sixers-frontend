import 'package:flutter/material.dart';
import 'package:sixers/theme/colors.dart';

class SplashScreen extends StatelessWidget {
  static final String route = "/splash";
  static final String routeName = "Splash";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black100,
      body: Center(
        child: Image.asset("assets/app_icon.png", width: 288, height: 288, fit: BoxFit.contain)
      ),
    );
  }
}
