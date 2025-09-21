import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qalam_app/core/constants/app_image.dart';
import 'package:qalam_app/feature/widgets/about_us_curriculam_widget.dart';
import 'package:qalam_app/feature/widgets/curriculam_widget_new.dart';
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
              padding: EdgeInsets.only(top: 350.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AboutUsCurriculumSection(
                    sections: [
                      CurriculumSectionData(
                        title: 'Our Vision',
                        description:
                            "These are foundation years which is key to building basic literacy & numeracy skills. You child will achieve most of the literacy and numeracy outcomes needed to advance their experiences in upper primary. There are assessments at P2 and P4 level to monitor your child's progress and plan any additional support needed for your child. Lower Primary is a very exciting stage and we encourage parents to actively work with staff in building this foundation.",
                      ),
                      CurriculumSectionData(
                        title: 'Our Mission',
                        description:
                            "Qalam Academy aims to be synonymous with educational excellence at all levels within a safe and secure Islamic environment for all the communities it serves. We aim to provide the very best in resources and staff to ensure pupils achieve outstanding levels of individual attainment but have a strong sense of social responsibility together with a passion to serve humanity.",
                      ),
                      CurriculumSectionData(
                        title: 'Our Ethos',
                        description:
                            "Our parents, staff and pupils bond with the sole ethos of respect and understanding of fellow mankind. The Islamic principles followed by the school is a perfect framework which makes the school special for the community. Al-Qalam accepts children from all communities irrespective of their faith. Pupils, Staff, Parents are all committed to schools policies and procedures.",
                      ),
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
                            Text("Aims & Values",
                                style: GoogleFonts.playfairDisplay(
                                    fontSize: 24.sp,
                                    height: 1,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF000000))),
                            SizedBox(height: 20.h),
                            Text('''
Our Aim is to provide our students the best education delivered by experienced and passionate staff and build a community for the future. We thrive to serve our school community and support our pupils to achieve outstanding levels of individual achievement and work together with a strong sense of social responsibility for a peaceful and prosperous society. Our core values centre around being honest, being respectable, and becoming a responsible person who is trustworthy. 

Leadership & Governance 

The school has a distributed leadership & governance structure. This allows us to leverage from the experiences of professionals at various levels. 

•	Executive Head provides the vision for the school and leads the curriculum development, attainment and assessment teams

•	Quality Assurance Executive ensures the school delivery of education offer our pupils the stimulating experiences and maintains the standards from an excellent school

•	Head of School (Operations & Qualification) is responsible for managing the day-to-day operations at the school, working with key members of staff and guiding them throughout the course of the academic year.

                                ''',
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
                            Text("History",
                                style: GoogleFonts.playfairDisplay(
                                    fontSize: 24.sp,
                                    height: 1,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF000000))),
                            SizedBox(height: 20.h),
                            Text('''
Al-Qalam School was found in October 2010 with only Primary 1 class in a semi-detached property at Darnley Street in Pollokshields, Glasgow. Since then, the school has gone through several stages of development, increasing one class at a time each year, managing COVID disruption with swift arrangements (within 2weeks) for online learning on zoom and thereafter moving to a larger premises at Ben Nevis Road, Paisley. The school has continued its principle of ensuring high standards of education irrespective of the time, place and pupil rolls. This is evident from the pupils who attended Al-Qalam School since its inception.
''',
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
                            Text("History",
                                style: GoogleFonts.playfairDisplay(
                                    fontSize: 24.sp,
                                    height: 1,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF000000))),
                            SizedBox(height: 20.h),
                            Text('''
Al-Qalam School was found in October 2010 with only Primary 1 class in a semi-detached property at Darnley Street in Pollokshields, Glasgow. Since then, the school has gone through several stages of development, increasing one class at a time each year, managing COVID disruption with swift arrangements (within 2weeks) for online learning on zoom and thereafter moving to a larger premises at Ben Nevis Road, Paisley. The school has continued its principle of ensuring high standards of education irrespective of the time, place and pupil rolls. This is evident from the pupils who attended Al-Qalam School since its inception.
''',
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
                            Text("Vacancies",
                                style: GoogleFonts.playfairDisplay(
                                    fontSize: 24.sp,
                                    height: 1,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF000000))),
                            SizedBox(height: 20.h),
                            Text('''
The school is always looking for talent who are passionate about teaching our young generations. Our staff make the school vibrant and maintains a nurturing atmosphere unique to the school. If you have the drive and can-do attitude, email us on schools@qalam-academy.org. Our School admin will reach out to you if there is any suitable vacancies that open in future.
''',
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
