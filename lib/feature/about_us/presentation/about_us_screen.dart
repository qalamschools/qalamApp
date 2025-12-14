import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qalam_app/core/constants/app_image.dart';
import 'package:qalam_app/feature/widgets/about_us_curriculam_widget.dart';
import 'package:qalam_app/feature/widgets/curriculam_widget_new.dart';
import 'package:qalam_app/feature/widgets/custom_scroll_widget.dart';
import 'package:qalam_app/feature/widgets/social_icon_widget.dart';

class CrousalSlider {
  String text;
  String author;

  CrousalSlider({required this.text, required this.author});
}

class AboutUsScreen extends StatelessWidget {
  AboutUsScreen({super.key});

  final List<CrousalSlider> crousalSlider = [
    CrousalSlider(
        text:
            "This is my third fantastic year at Qalam Academy, I started in S1, I feel as though I am reaching my full potential. All of my teachers have helped me accompolish this. I get to read my salaah everyday which is another benefit. I came to this school so that I am in a safe Islamic environment.",
        author: "A Houston (Flexible Learning Student - S3)"),
    CrousalSlider(
        text:
            "Big Positive - The Teachers! My experience in Al-Qalam is amazing. This school has a safe environment where you feel includedAcademically the school has tremendous ways of teaching. I feel that Al-Qalam has improved my learning.",
        author: "R Mohammed (Al-Qalam Student - S1 )"),
    CrousalSlider(
        text:
            'I attended Al-Qalam Primary School for seven years and it was an experience that I am sure anyone at any other school don’t know what they’re missing out on. There wasn’t a single moment when I wanted to swap a day in Al-Qalam for a day at another school. Al-Qalam is unique and I wish I could have another seven-year experience there.',
        author: "~Former P7 Pupil​"),
    CrousalSlider(
        text:
            'Al Qalam has turned my sons life around by giving him the full support he needs that was not being fulfilled in main stream school there understanding patience and caring nature to the children is so valuable if it wasn\'t for this amazing school I would be very lost in the main stream school system as other private schools are extremly expensive compared to al qalam and must add these other private schools do not  care for the children like there own as al qalam school does',
        author: 'A Cardini (Al-Qalam Parent - S1)')
  ];

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
              AppImage.ourSchool,
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
                            "Qalam Academy has the vision to be synonymous with educational excellence at all stages within a safe and secure Islamic environment.",
                      ),
                      CurriculumSectionData(
                        title: 'Our Mission',
                        description:
                            "Our mission is to deliver high standard of education across all stages, through innovative methods applied to curriculum frameworks with guidance from the teachings of the Qur'an and Prophetic traditions.",
                      ),
                      CurriculumSectionData(
                        title: 'Our Ethos',
                        description:
                            "Our parents, staff and pupils' bond with the sole ethos of respect and understanding of other citizens. Our school ethos centres around valuing humanity and other creations of Almighty Allah (The Beneficent The Merciful), exploring the world of possibilities, building a better future and striving to contribute towards a prosperous society with qualities of perseverance, kindness, inclusion, cooperation, respect and compassion.",
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("About Us",
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 36.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF226B3D),
                            )),
                        SizedBox(height: 20.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("History",
                                style: GoogleFonts.playfairDisplay(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF000000))),
                            SizedBox(height: 20.h),
                            Text('''
Al-Qalam School was found in October 2010 with only Primary 1 class in a semi-detached property at Darnley Street in Pollokshields, Glasgow. Since then, the school has gone through several stages of development, increasing one class at a time each year, managing COVID disruption with swift arrangements (within 2weeks) for online learning on zoom and thereafter moving to a larger premises at Ben Nevis Road, Paisley. The school has continued its principle of ensuring high standards of education irrespective of the time, place and pupil rolls. This is evident from the pupils who attended Al-Qalam School since its inception.
''',
                                style: GoogleFonts.nunitoSans(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF333333))),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Aims",
                                style: GoogleFonts.playfairDisplay(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF000000))),
                            SizedBox(height: 20.h),
                            Text('''
To provide the highest standard of education to enable children and young people to achieve their full potential, in a secure and caring Islamic environment, delivered by experienced and passionate staff with a drive to build a community for the future. We thrive to serve our school community and support our pupils to achieve outstanding levels of individual achievement and work together with a strong sense of social responsibility for a peaceful and prosperous society.
''',
                                style: GoogleFonts.nunitoSans(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF333333))),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Values",
                                style: GoogleFonts.playfairDisplay(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF000000))),
                            SizedBox(height: 20.h),
                            Text('''
Our core values are based on being honest, respectable, ambitious, resilient, kind, faithful and becoming a responsible person who is trustworthy.
''',
                                style: GoogleFonts.nunitoSans(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF333333))),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Leadership",
                                style: GoogleFonts.playfairDisplay(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF000000))),
                            SizedBox(height: 20.h),
                            Text('''
The school promotes a distributed leadership and governance structure to leverage from the experiences of professionals at various levels. 
Executive Head provides the vision for the school and leads the curriculum development, attainment and assessment teams
Quality Assurance Executive ensures the school's delivery of education offer our pupils stimulating experiences and strives to maintain the standards expected from an excellent school
Head of School (Operations & Qualification) is responsible for managing the day-to-day operations at the school, working with members of staff and their continous development, engaging with parents and third sector throughout the academic year.
''',
                                style: GoogleFonts.nunitoSans(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF333333))),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Governance",
                                style: GoogleFonts.playfairDisplay(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF000000))),
                            SizedBox(height: 20.h),
                            Text('''
School governance is provided by our leadership team that ensures the school has a clear vision, high educational standards, and sound financial management. The head of school is accountable for the school's performance and day-to-day operations while the executive oversee the budget.

''',
                                style: GoogleFonts.nunitoSans(
                                    fontSize: 16.sp,
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
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF000000))),
                            SizedBox(height: 20.h),
                            Text('''
Our staff make the school vibrant, maintaining a nurturing atmosphere. The school is always looking for talent who are passionate about teaching. If you have the drive and can-do attitude, contact the school to enquire of any suitable opportunities for you.

''',
                                style: GoogleFonts.nunitoSans(
                                    fontSize: 16.sp,
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
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF000000))),
                            SizedBox(height: 20.h),
                            Text('''
Our parents play a crucial role throughout their child's learning experiences at Al-Qalam School by collaborating with our teachers and supporting them to achieve the best outcome for their child.
''',
                                style: GoogleFonts.nunitoSans(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF333333))),
                          ],
                        ),
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
                        itemCount: crousalSlider.length,
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
                                      child: Text(crousalSlider[index].text,
                                          style: GoogleFonts.nunitoSans(
                                            fontSize: 16.sp,
                                            height: 1,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFF333333),
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24, vertical: 22),
                                      child: Text(crousalSlider[index].author,
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
                  SizedBox(height: 12.h),
                  Center(
                      child: Text(
                    "All testimonials have been adjusted for mobile interface",
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                        fontSize: 12.sp),
                  )),
                  SizedBox(height: 12.h),
                  Center(
                    child: CustomScrollBarWidget(
                      controller: _controller,
                      trackWidth: 80,
                      trackHeight: 2.h,
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
                              borderRadius: BorderRadius.circular(16.r)),
                          child: Center(
                            child: Image.asset(
                              AppImage.sAQ,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r)),
                          child: Center(
                            child: Image.asset(
                              AppImage.hsQuality,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r)),
                          child: Center(
                            child: Image.asset(
                              AppImage.playlearn,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r)),
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
