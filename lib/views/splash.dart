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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/splash_logo.png", width: 100),
            const SizedBox(height: 40),
            Text("SIXERS", style: Theme.of(context).textTheme.headlineLarge),
          ],
        ),
      ),
    );
  }
}
