import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qalam_app/presentation/widgets/custom_bottom_navigation_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        onPressed: () {},
        backgroundColor: const Color(0xFF1B5E20),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              "assets/images/background.png",
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 240),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/vertical_line.svg",
                        ),
                        SizedBox(height: 30.h),
                        Text("Welcome to",
                            style: GoogleFonts.nunitoSans(
                              fontSize: 16.sp,
                              color: Colors.black,
                            )),
                        SizedBox(height: 30.h),
                        Text("AL \nQALAM",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 84.sp,
                              height: 1,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF185B31),
                            )),
                        SizedBox(height: 30.h),
                        SizedBox(
                          width: 250.w,
                          child: Text(
                              "Develop effective Structured Literacy practices and build organizational capacity that improves student outcomes.",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.nunitoSans(
                                fontSize: 16.sp,
                                fontStyle: FontStyle.italic,
                                color: Colors.black,
                              )),
                        ),
                        SizedBox(height: 30.h),
                        SvgPicture.asset(
                          "assets/icons/Arrow_down.svg",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 100.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("About Us",
                            style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                            )),
                        SizedBox(height: 10.h),
                        SizedBox(
                          child: Text("Transform Teaching \n& Learning Systems",
                              style: GoogleFonts.playfairDisplay(
                                  fontSize: 36.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFf226B3D))),
                        ),
                        SizedBox(height: 10.h),
                        SizedBox(
                          child: Text(
                              "All educators want students to thrive. Teachers need the time, training, materials, and support to help their students do so. We help districts improve student literacy by taking a comprehensive approach that meets educators where they are and provides them with the knowledge, tools, and support they need to help their students succeed.",
                              style: GoogleFonts.nunitoSans(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black)),
                        ),
                      ],
                    ),
                  ),
                  const _CurriculumSection(
                    number: 1,
                    title: "Lower Primary (P1-4)",
                    description:
                        "We deliver Scottish Curriculum for Excellence (CfE) experiences and outcomes using our experiences based Content Oriented Methodology (ecoLearn)",
                    imagePath: "assets/images/playGirl.png",
                    isLeft: true,
                  ),
                  const _CurriculumSection(
                    number: 2,
                    title: "Lower Primary (P1-4)",
                    description:
                        "We deliver Scottish Curriculum for Excellence (CfE) experiences and outcomes using our experiences based Content Oriented Methodology (ecoLearn)",
                    imagePath: "assets/images/playGirl.png",
                    isLeft: false,
                  ),
                  const _CurriculumSection(
                    number: 3,
                    title: "Lower Primary (P1-4)",
                    description:
                        "We deliver Scottish Curriculum for Excellence (CfE) experiences and outcomes using our experiences based Content Oriented Methodology (ecoLearn)",
                    imagePath: "assets/images/playGirl.png",
                    isLeft: true,
                  ),
                  const _CurriculumSection(
                    number: 4,
                    title: "Lower Primary (P1-4)",
                    description:
                        "We deliver Scottish Curriculum for Excellence (CfE) experiences and outcomes using our experiences based Content Oriented Methodology (ecoLearn)",
                    imagePath: "assets/images/playGirl.png",
                    isLeft: false,
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
          child: CustomBottomNavigationBar(
        currentIndex: 0,
        onTap: (index, name) {
          // setState(() {
          //   _selectedBottomNavName = name;
          //   _selectedBottomNav = index;
          // });
        },
      )),
    );
  }
}

class _CurriculumSection extends StatelessWidget {
  final int number;
  final String title;
  final String description;
  final String imagePath;
  final bool isLeft;

  const _CurriculumSection({
    required this.number,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.isLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
      child: Column(
        crossAxisAlignment:
            isLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: isLeft
                ? [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            imagePath,
                            width: 267.w,
                          ),
                        ),
                        Positioned(
                          left: 320.w,
                          top: 120.h,
                          child: _buildNumberBadge(isLeft: isLeft),
                        ),
                      ],
                    ),
                    SizedBox(width: 20.h),
                  ]
                : [
                    SizedBox(width: 20.w),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            imagePath,
                            width: 267.w,
                          ),
                        ),
                        Positioned(
                          right: 320.w,
                          top: 120.h,
                          child: _buildNumberBadge(isLeft: isLeft),
                        ),
                      ],
                    ),
                  ],
          ),
          _buildTextContent()
        ],
      ),
    );
  }

  Widget _buildNumberBadge({required bool isLeft}) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          isLeft
              ? "assets/icons/red_shield.svg"
              : "assets/icons/green_shield.svg",
          height: 22.h,
          fit: BoxFit.cover,
        ),
        Text(
          number.toString(),
          style: GoogleFonts.nunitoSans(
            fontSize: 12.sp,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildTextContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          title,
          style: GoogleFonts.nunitoSans(
            fontSize: 16.sp,
            fontStyle: FontStyle.italic,
            color: const Color(0xFF1B5E20),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: 267,
          child: Text(
            description,
            style: GoogleFonts.nunitoSans(
              fontSize: 16.sp,
              color: const Color(0xFF1B5E20),
            ),
          ),
        )
      ],
    );
  }
}
