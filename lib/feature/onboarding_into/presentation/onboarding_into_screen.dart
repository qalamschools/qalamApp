import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qalam_app/feature/dashboard/dashboard_screen.dart';
import 'package:qalam_app/feature/widgets/custom_button_widget.dart';

class OnBoardingIntoScreen extends StatefulWidget {
  const OnBoardingIntoScreen({super.key});

  @override
  State<OnBoardingIntoScreen> createState() => _OnBoardingIntoScreenState();
}

class _OnBoardingIntoScreenState extends State<OnBoardingIntoScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: 100.sw,
          height: 100.sh,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 20.h),
              Image.asset("assets/images/logo.png", fit: BoxFit.cover),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 300.h,
                      // color: Colors.amberAccent,
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: _onPageChanged,
                        children: [
                          _buildPage(
                            context,
                            imagePath: "assets/icons/onboarding1.svg",
                            title: "Transform the Way Students Learn",
                            description:
                                "Empower teachers with tools, training, and time. Boost literacy with our unique learning system",
                          ),
                          _buildPage(
                            context,
                            imagePath: "assets/icons/onboarding2.svg",
                            title: "Engaging and Effective Learning",
                            description:
                                "Interactive content designed to captivate young minds and enhance understanding.",
                          ),
                          _buildPage(
                            context,
                            imagePath: "assets/icons/onboarding3.svg",
                            title: "Track Progress Easily",
                            description:
                                "Monitor student improvement through intelligent dashboards and reports.",
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DashboardScreen(),
                      ),
                    );
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
    required String description,
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text(description,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunitoSans(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF333333))),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
