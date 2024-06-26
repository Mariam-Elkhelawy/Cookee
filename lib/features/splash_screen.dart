import 'package:YumFind/config/routes/app_routes_names.dart';
import 'package:YumFind/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
           Navigator.pushReplacementNamed(context, AppRoutesName.onboarding);
    });
    return Image.asset(
      AppImages.splash,
      fit: BoxFit.cover,
    );
  }
}
