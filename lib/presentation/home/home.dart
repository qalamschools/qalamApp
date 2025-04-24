import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qalam_app/presentation/widgets/curriculam_widget.dart';
import 'package:qalam_app/presentation/widgets/custom_button_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                      Text(
                        "AL \nQALAM",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 84.sp,
                          height: 1,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF185B31),
                        ),
                      ),
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
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.nunitoSans(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black)),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Text("Learn More",
                              style: GoogleFonts.inter(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFFA91936))),
                          SizedBox(width: 8.h),
                          SvgPicture.asset(
                            "assets/icons/forward_icon.svg",
                            width: 12.w,
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Text("Our Curriculum",
                          style: GoogleFonts.playfairDisplay(
                              fontSize: 36.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFf226B3D))),
                      SizedBox(height: 20.h),
                      Text(
                          "We deliver Scottish Curriculum for Excellence (CfE) experiences and outcomes using our experiences based Content Oriented Methodology (ecoLearn)",
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.nunitoSans(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF333333))),
                    ],
                  ),
                ),
                const CurriculumSection(
                  number: 1,
                  title: "Lower Primary (P1-4)",
                  description:
                      "We deliver Scottish Curriculum for Excellence (CfE) experiences and outcomes using our experiences based Content Oriented Methodology (ecoLearn)",
                  imagePath: "assets/images/playGirl.png",
                  isLeft: true,
                ),
                const CurriculumSection(
                  number: 2,
                  title: "Lower Primary (P1-4)",
                  description:
                      "We deliver Scottish Curriculum for Excellence (CfE) experiences and outcomes using our experiences based Content Oriented Methodology (ecoLearn)",
                  imagePath: "assets/images/playGirl.png",
                  isLeft: false,
                ),
                const CurriculumSection(
                  number: 3,
                  title: "Lower Primary (P1-4)",
                  description:
                      "We deliver Scottish Curriculum for Excellence (CfE) experiences and outcomes using our experiences based Content Oriented Methodology (ecoLearn)",
                  imagePath: "assets/images/playGirl.png",
                  isLeft: true,
                ),
                const CurriculumSection(
                  number: 4,
                  title: "Lower Primary (P1-4)",
                  description:
                      "We deliver Scottish Curriculum for Excellence (CfE) experiences and outcomes using our experiences based Content Oriented Methodology (ecoLearn)",
                  imagePath: "assets/images/playGirl.png",
                  isLeft: true,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF4F4),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    height: 280.h,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/logo_icon.png",
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: 15.h),
                        Text("Start Your Journey at".toUpperCase(),
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.nunitoSans(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFFA91936))),
                        SizedBox(height: 15.h),
                        Text("only £350/Month",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 40.sp,
                              height: 1,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF185B31),
                            )),
                        SizedBox(height: 30.h),
                        CustomButtonWidget(
                          width: 160.w,
                          text: "Constact Us",
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15.h),
                      Text("Our Partners",
                          style: GoogleFonts.playfairDisplay(
                              fontSize: 36.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFf226B3D))),
                      SizedBox(height: 15.h),
                      Text(
                          "We collaborate with industry leaders who share our values and vision. Together, we create innovative solutions and drive meaningful impact. Meet the trusted partners powering our journey forward.",
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.nunitoSans(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF333333))),
                      SizedBox(height: 100.h),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
