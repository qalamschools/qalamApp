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
import 'package:qalam_app/feature/widgets/curriculam_widget_new.dart';
import 'package:qalam_app/feature/widgets/custom_button_widget.dart';
import 'package:qalam_app/feature/widgets/social_icon_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(
              AppImage.landingBg,
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
              padding: EdgeInsets.only(top: 400.h),
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
                              "Delivering quality education using a unique methodology to offer stimulating learning experiences through a broad curriculum.",
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
                        Text("Our Curriculum",
                            style: GoogleFonts.playfairDisplay(
                                fontSize: 36.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFf226B3D))),
                        SizedBox(height: 20.h),
                        Text(
                            "Al-Qalam school delivers the Scottish Curriculum for Excellence (CfE) experiences and outcomes using our unique experiences-based Context Oriented Learning (ecoLearn). The methodology allows teachers to deliver these experiences that will align with most of the CfE codes across the Literacy, Numeracy, Social Studies & Science topics. Assessments are held at various stages throughout their learning & development from P1 until S2 in Al-Qalam School. Students continue their learning journey through our flexible learning courses that prepare them for qualifications exams by Scottish and English education authorities.",
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
                  CurriculumTimelineWidget(
                    sections: [
                      CurriculumSectionData(
                        title: 'Lower Primary (P1-4 / Reception-Yr3)',
                        description:
                            "These are foundation years which is key to building basic literacy & numeracy skills. Your child will achieve most of the literacy and numeracy outcomes needed to advance their experiences in upper primary. There are assessments at P2 and P4 level to monitor your child's progress and plan any additional support needed for your child. Lower Primary is a very exciting stage and we encourage parents to actively work with staff in building this foundation.",
                        imagePath: 'assets/images/lower_primary.jpg',
                      ),
                      CurriculumSectionData(
                        title: 'Upper Primary (P5-P7 / Yr4 - Yr6)',
                        description:
                            "The stages in Upper Primary helps your child in preparing for their transition into secondary. Our methodology plays an important role in contextualising experiences and delivers better outcomes. Your child will advance their literacy, numery skills. Various learning experiences will improve their communication skills and ability to explore new concepts in their learning journey. There are assessments at P5 and P7 level to ensure your child is prepared for the major transition into secondary school.",
                        imagePath: 'assets/images/upper_primary.jpg',
                      ),
                      CurriculumSectionData(
                        title: 'Secondary School (S1-S2 / Yr 7- Yr 8)',
                        description:
                            "These two years of high school cover broad general education. They prepare the foundations of qualification subjects such as English, Maths, Science, Computing Science, Social Studies, Modern Languages and Business Management. We aim to prepare students for the world of work which is driven by technology. A variety of subjects are available at this stage. Staff will provide support to students in achieving their potential and also identify their strengths in subjects of their choices.",
                        imagePath: 'assets/images/secondary_school.jpg',
                      ),
                      CurriculumSectionData(
                        title:
                            'Flexible Learning - hsqualify.org (NAT5, GCSE, Highers, A-Levels)',
                        description:
                            "Pupils graduating from Al-Qalam School (P1-S2) will transition into our flexible learning course that allow flexibility for your child to select subject of their choices. Up to eight NAT5/GSCE and up to 6 Highers/ A-Levels subjects are offered. Flexible Learning approach is focussed on preparing your child for examinations. Students will attend lessons only for the subjects they have selected to appear for formal examinations.",
                        imagePath: 'assets/images/flexible_learning.jpg',
                      ),
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
                          Text("Qalam Academy",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.playfairDisplay(
                                  fontSize: 32.sp,
                                  height: 1,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF185B31))),
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
