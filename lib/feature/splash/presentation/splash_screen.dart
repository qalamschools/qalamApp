import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qalam_app/feature/onboarding_into/presentation/onboarding_into_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).whenComplete(() {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const OnBoardingIntoScreen(),
          ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SvgPicture.asset(
          "assets/icons/logo.svg",
          fit: BoxFit.cover,
          height: 100.h,
        ),
      ),
    );
  }
}
