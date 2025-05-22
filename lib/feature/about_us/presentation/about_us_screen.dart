import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qalam_app/core/constants/app_image.dart';
import 'package:qalam_app/feature/widgets/about_us_curriculam_widget.dart';
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
        title: SvgPicture.asset(
          "assets/icons/logo.svg",
          fit: BoxFit.cover,
          width: 100.w,
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
              padding: EdgeInsets.only(top: 270.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Center(
                      child: Text("Who We Are",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 36.sp,
                            height: 1,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF226B3D),
                          )),
                    ),
                  ),
                  SizedBox(height: 25.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                        "Qalam Academy is dedicated to delivering excellence in education across all stages, aiming to build a prosperous society in Scotland and beyond. Our approach integrates innovative methods within curriculum frameworks, guided by the teachings of the Quran and Prophetic traditions.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunitoSans(
                            fontSize: 16.sp,
                            height: 1,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF333333))),
                  ),
                  SizedBox(height: 50.h),
                  Stack(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/Lines_About_Us.svg",
                        fit: BoxFit.cover,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AboutUsCurriculumSection(
                            title: "Our Vision",
                            description:
                                "To establish a comprehensive educational pathway—from primary through to university—that fosters academic excellence and moral integrity, preparing students to contribute positively to society.​",
                            isLeft: false,
                          ),
                          AboutUsCurriculumSection(
                            title: "Our Mission",
                            description:
                                "We strive to provide top-tier resources and staff to ensure pupils achieve outstanding individual attainment, coupled with a strong sense of social responsibility and a passion to serve humanity.",
                            isLeft: true,
                          ),
                          AboutUsCurriculumSection(
                            title: "Our Ethos",
                            description:
                                "At Qalam Academy,respect and understanding of fellow mankind form the cornerstone of our community. We welcome children from all communities, irrespective of their faith, fostering an inclusive environment where pupils, staff, and parents are united in commitment to the school's policies and procedures. ​",
                            isLeft: false,
                          ),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
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
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 80.h,
                            width: 80.w,
                            decoration: const BoxDecoration(
                                color: Colors.amberAccent,
                                shape: BoxShape.circle),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "Shoeb Sarguroh",
                            style: GoogleFonts.playfairDisplay(
                                fontSize: 20.sp, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          Text(
                            "Executive Head\n(pro-bono)",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.nunitoSans(
                                fontSize: 14.sp, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 80.h,
                                width: 80.w,
                                decoration: const BoxDecoration(
                                    color: Colors.amberAccent,
                                    shape: BoxShape.circle),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "Kausar Khot",
                                style: GoogleFonts.playfairDisplay(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              Text(
                                "Head of School",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.nunitoSans(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 80.h,
                                width: 80.w,
                                decoration: const BoxDecoration(
                                    color: Colors.amberAccent,
                                    shape: BoxShape.circle),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "May Geddes",
                                style: GoogleFonts.playfairDisplay(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              Text(
                                "Quality Assurance\n Executive",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.nunitoSans(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Center(
                    child: SvgPicture.asset(
                      "assets/icons/horizontal_line.svg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      height: 300.h,
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
                              child: Container(
                                width: 361.w,
                                decoration: BoxDecoration(
                                    color: const Color(0xffFFF4F4),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(16.r))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24, vertical: 20),
                                      child: SvgPicture.asset(
                                          "assets/icons/quote_icon.svg"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 24,
                                      ),
                                      child: Text(
                                          "I attended Al-Qalam Primary School for seven years and it was an experience that I am sure anyone at any other school don’t know what they’re missing out on. There wasn’t a single moment when I wanted to swap a day in Al-Qalam for a day at another school. Al-Qalam is unique and I wish I could have another seven-year experience there.”",
                                          style: GoogleFonts.nunitoSans(
                                            fontSize: 16.sp,
                                            height: 1,
                                            fontWeight: FontWeight.w400,
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
                                              color: const Color(0xFF000000))),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
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
                  SizedBox(height: 20.h),
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
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF333333))),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      childAspectRatio: 16 / 9,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: const Color(0xffFFF4F4),
                              borderRadius: BorderRadius.circular(16.r)),
                          width: 173.w,
                          height: 92.h,
                          child: Center(
                            child: Image.asset(
                              AppImage.sAQ,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: const Color(0xffFFF4F4),
                              borderRadius: BorderRadius.circular(16.r)),
                          width: 173.w,
                          height: 92.h,
                          child: Center(
                            child: Image.asset(
                              AppImage.hsQuality,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: const Color(0xffFFF4F4),
                              borderRadius: BorderRadius.circular(16.r)),
                          width: 173.w,
                          height: 92.h,
                          child: Center(
                            child: Image.asset(
                              AppImage.playlearn,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: const Color(0xffFFF4F4),
                              borderRadius: BorderRadius.circular(16.r)),
                          width: 173.w,
                          height: 92.h,
                          child: Center(
                            child: Image.asset(
                              AppImage.scisIcon,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Center(
                    child: SvgPicture.asset(
                      AppImage.horizontalIcon,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  const SocialIconWidget(),
                  SizedBox(height: 50.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
