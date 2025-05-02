import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qalam_app/feature/widgets/custom_scroll_widget.dart';
import 'package:qalam_app/feature/widgets/social_icon_widget.dart';

class AboutUsScreen extends StatelessWidget {
  AboutUsScreen({super.key});

  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Image.asset(
          "assets/images/logo.png",
          fit: BoxFit.contain,
          height: 35,
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              "assets/images/about_us_background.png",
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 350),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text("Who We Are",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 36.sp,
                            height: 1,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF226B3D),
                          )),
                    ),
                    SizedBox(height: 25.h),
                    Text(
                        "Qalam Academy is dedicated to delivering excellence in education across all stages, aiming to build a prosperous society in Scotland and beyond. Our approach integrates innovative methods within curriculum frameworks, guided by the teachings of the Quran and Prophetic traditions.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunitoSans(
                            fontSize: 16.sp,
                            height: 1,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF333333))),
                    SizedBox(height: 50.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Our Community",
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 36.sp,
                              height: 1,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF226B3D),
                            )),
                        SizedBox(height: 30.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Pupils",
                                style: GoogleFonts.playfairDisplay(
                                    fontSize: 24.sp,
                                    height: 1,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF000000))),
                            SizedBox(height: 20.h),
                            Text(
                                "Our students are smart, confident, and full of life, thriving in an environment that nurtures their academic and personal growth",
                                style: GoogleFonts.nunitoSans(
                                    fontSize: 16.sp,
                                    height: 1,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF333333))),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Staff",
                                style: GoogleFonts.playfairDisplay(
                                    fontSize: 24.sp,
                                    height: 1,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF000000))),
                            SizedBox(height: 20.h),
                            Text(
                                "Our passionate, experienced, and enthusiastic educators are dedicated to delivering high-quality education and fostering a supportive learning environment.",
                                style: GoogleFonts.nunitoSans(
                                    fontSize: 16.sp,
                                    height: 1,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF333333))),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Parents",
                                style: GoogleFonts.playfairDisplay(
                                    fontSize: 24.sp,
                                    height: 1,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF000000))),
                            SizedBox(height: 20.h),
                            Text(
                                "Committed, involved, and supportive, our parents play a vital role in the educational journey, collaborating closely with staff to ensure the best outcomes for their children. ​",
                                style: GoogleFonts.nunitoSans(
                                    fontSize: 16.sp,
                                    height: 1,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF333333))),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 50.h),
                    Center(
                      child: SvgPicture.asset(
                        "assets/icons/horizontal_line.svg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Column(
                      children: [
                        Center(
                          child: Text("Supported by",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 36.sp,
                                height: 1,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF226B3D),
                              )),
                        ),
                        SizedBox(height: 25.h),
                      ],
                    ),
                    SizedBox(height: 50.h),
                    Center(
                      child: SvgPicture.asset(
                        "assets/icons/horizontal_line.svg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      height: 358.h,
                      child: ListView.builder(
                        shrinkWrap: true,
                        controller: _controller,
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: index == 0 ? 0 : 6),
                            child: Center(
                              child: Card(
                                elevation: 0,
                                child: Container(
                                  height: 358.h,
                                  width: 361.w,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffFFF4F4),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(16.r))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 24, vertical: 20),
                                        child: SvgPicture.asset(
                                            "assets/icons/quote_icon.svg"),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 24, vertical: 20),
                                        child: Text(
                                            "I attended Al-Qalam Primary School for seven years and it was an experience that I am sure anyone at any other school don’t know what they’re missing out on. There wasn’t a single moment when I wanted to swap a day in Al-Qalam for a day at another school. Al-Qalam is unique and I wish I could have another seven-year experience there.”",
                                            style: GoogleFonts.nunitoSans(
                                              fontSize: 16.sp,
                                              height: 1,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xFF333333),
                                            )),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 24, vertical: 20),
                                        child: Text("~Former P7 Pupil​",
                                            style: GoogleFonts.playfairDisplay(
                                                fontSize: 20.sp,
                                                height: 1,
                                                fontWeight: FontWeight.w500,
                                                color:
                                                    const Color(0xFF000000))),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Center(
                      child: CustomScrollBarWidget(
                        controller: _controller,
                        trackWidth: 80,
                        trackHeight: 2.h,
                      ),
                    ),
                    SizedBox(height: 50.h),
                    const SocialIconWidget(),
                    SizedBox(height: 100.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
