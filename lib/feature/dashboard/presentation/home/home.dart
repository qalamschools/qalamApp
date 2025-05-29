import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qalam_app/core/commons/data/repository/email_repository.dart';
import 'package:qalam_app/core/constants/app_image.dart';
import 'package:qalam_app/feature/contact_us/cubit/contact_us_cubit.dart';
import 'package:qalam_app/feature/contact_us/presentation/contact_us_screen.dart';
import 'package:qalam_app/feature/widgets/app_version_widget.dart';
import 'package:qalam_app/feature/widgets/curriculam_widget.dart';
import 'package:qalam_app/feature/widgets/custom_button_widget.dart';
import 'package:qalam_app/feature/widgets/social_icon_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(
              AppImage.dashboardBackground,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(
                    "assets/icons/logo.svg",
                    fit: BoxFit.cover,
                    height: 70.h,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 400),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Qalam Academy".toUpperCase(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 38.sp,
                            height: 1,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF185B31),
                          ),
                        ),
                        SizedBox(height: 30.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 55.w),
                          child: Text(
                              "Develop effective Structured Literacy practices and build organizational capacity that improves student outcomes.",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.nunitoSans(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              )),
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
                              textAlign: TextAlign.start,
                              style: GoogleFonts.nunitoSans(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black)),
                        ),
                        SizedBox(height: 15.h),
                        Row(
                          children: [
                            Text("Learn More",
                                style: GoogleFonts.inter(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFFA91936))),
                            SizedBox(width: 8.h),
                            SvgPicture.asset(
                              AppImage.forwardIcon,
                              width: 12.w,
                            ),
                          ],
                        ),
                        SizedBox(height: 40.h),
                        Text("Our Curriculum",
                            style: GoogleFonts.playfairDisplay(
                                fontSize: 36.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFf226B3D))),
                        SizedBox(height: 20.h),
                        Text(
                            "We deliver Scottish Curriculum for Excellence (CfE) experiences and outcomes using our experiences based Content Oriented Methodology (ecoLearn)",
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.start,
                            style: GoogleFonts.nunitoSans(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF333333))),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Stack(
                    children: [
                      SvgPicture.asset(fit: BoxFit.cover, AppImage.lines),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CurriculumSection(
                            number: 1,
                            title: "Lower Primary (P1-4)",
                            description:
                                "We deliver Scottish Curriculum for Excellence (CfE) experiences and outcomes using our experiences based Content Oriented Methodology (ecoLearn)",
                            imagePath: "assets/images/playGirl.png",
                            isLeft: false,
                          ),
                          CurriculumSection(
                            number: 2,
                            title: "Upper Primary (P5-7)",
                            description:
                                "As pupils move to upper primary, Al-Qalam school offers them opportunities to explore more technical topics, deep dive into their experiences and express them through art. These are visible across the school on display boards.",
                            imagePath: "assets/images/playGirl.png",
                            isLeft: true,
                          ),
                          CurriculumSection(
                            number: 3,
                            title: "Secondary School (S1/S2)",
                            description:
                                "A Broad general education (BGE) curriculum provides the foundation our pupils need to enhance their learning experiences on English, Maths, Science, Social Subjects and Modern Languages. This is an important stage during which students develop their understanding of subjects of their choices.",
                            imagePath: "assets/images/playGirl.png",
                            isLeft: false,
                          ),
                          CurriculumSection(
                            number: 4,
                            title: "Flexible Learning(NAT5 Yr1/2, Highers)",
                            description:
                                "Following completion of Secondary school, students then focus on specific subjects of their choices. Qalam Academy offers a subject based learning that prepares students for Qualifications. For two years (Yr1/2) Nat5 units from each subject of their choice is delivered to build a sound foundation towards preparing for NAT5 and Highers exams. Students can opt to appear in 8 subjects in NAT5 and 6 Subjects in Highers. Counselling session and learning pathway event such as Road2Oxford gives students encouragement to excel in their exam and have high ambitions for their future.",
                            imagePath: "assets/images/playGirl.png",
                            isLeft: true,
                          ),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
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
                            AppImage.appIcon,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(height: 15.h),
                          Text(
                              "Start Your child’s Journey Now"
                                  .toUpperCase()
                                  .toUpperCase(),
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.nunitoSans(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFFA91936))),
                          SizedBox(height: 15.h),
                          Text("Qalam Academy",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.playfairDisplay(
                                  fontSize: 32.sp,
                                  height: 1,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF185B31))),
                          SizedBox(height: 30.h),
                          CustomButtonWidget(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        BlocProvider<ContactUsCubit>(
                                      create: (context) =>
                                          ContactUsCubit(EmailRepositoryImpl()),
                                      child: ContactUsScreen(
                                          contactUsCubit: ContactUsCubit(
                                              EmailRepositoryImpl())),
                                    ),
                                  ));
                            },
                            width: 160.w,
                            text: "Contact Us",
                          )
                        ],
                      ),
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
                  SizedBox(height: 30.h),
                  const AppInfoWidget(),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
