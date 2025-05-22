import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qalam_app/core/utils/shared_preference.dart';
import 'package:qalam_app/feature/dashboard/presentation/dashboard_screen.dart';
import 'package:qalam_app/feature/widgets/custom_button_widget.dart';

class OnBoardingIntoScreen extends StatefulWidget {
  const OnBoardingIntoScreen({super.key});

  @override
  State<OnBoardingIntoScreen> createState() => _OnBoardingIntoScreenState();
}

class _OnBoardingIntoScreenState extends State<OnBoardingIntoScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _autoScrollTimer;
  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_currentPage < 2) {
        _currentPage++;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        _autoScrollTimer?.cancel();
        _navigateToDashboardPage();
      }
    });
  }

  Future<void> _navigateToDashboardPage() async {
    await SharedPrefsHelper().setOnboardingSeen(true);
    if (!mounted) return; // Safety check
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const DashboardScreen()),
    );
  }

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: 100.sw,
          height: 100.sh,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 20.h),
              SvgPicture.asset(
                "assets/icons/logo.svg",
                fit: BoxFit.cover,
                height: 80.h,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200.h,
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: _onPageChanged,
                        children: [
                          _buildPage(
                            context,
                            imagePath: "assets/icons/onboarding1.svg",
                            title: "Transform the Way Students Learn",
                          ),
                          _buildPage(
                            context,
                            imagePath: "assets/icons/onboarding2.svg",
                            title: "Engaging and Effective Learning",
                          ),
                          _buildPage(
                            context,
                            imagePath: "assets/icons/onboarding3.svg",
                            title: "Track Progress Easily",
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, _buildIndicatorDot),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: CustomButtonWidget(
                  onTap: () {
                    _navigateToDashboardPage();
                  },
                  text: "Explore Now",
                  showIcon: false,
                  width: 100.sw,
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIndicatorDot(int index) {
    bool isActive = index == _currentPage;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF226B3D) : Colors.grey.shade400,
        borderRadius: BorderRadius.circular(4.r),
      ),
    );
  }

  Widget _buildPage(
    BuildContext context, {
    required String imagePath,
    required String title,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(imagePath),
                SizedBox(height: 20.h),
                Text(title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.playfairDisplay(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFf226B3D))),
                SizedBox(height: 15.h),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
