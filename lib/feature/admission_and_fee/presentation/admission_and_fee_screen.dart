import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qalam_app/core/commons/data/repository/email_repository.dart';
import 'package:qalam_app/core/constants/app_image.dart';
import 'package:qalam_app/feature/admission_and_fee/cubit/admission_and_fee_bloc_cubit.dart';
import 'package:qalam_app/feature/admission_and_fee/models/admission_item_model.dart';
import 'package:qalam_app/feature/contact_us/cubit/contact_us_cubit.dart';
import 'package:qalam_app/feature/contact_us/presentation/contact_us_screen.dart';
import 'package:qalam_app/feature/dashboard/cubit/bottom_navbar_cubit.dart';
import 'package:qalam_app/feature/widgets/clickable_text_widget.dart';
import 'package:qalam_app/feature/widgets/custom_button_widget.dart';
import 'package:qalam_app/feature/widgets/social_icon_widget.dart';

class AdmissionAndFeeScreen extends StatefulWidget {
  const AdmissionAndFeeScreen(
      {super.key, required this.admissionAndFeeBlocCubit});
  final AdmissionAndFeeBlocCubit admissionAndFeeBlocCubit;

  @override
  State<AdmissionAndFeeScreen> createState() => _AdmissionAndFeeScreenState();
}

class _AdmissionAndFeeScreenState extends State<AdmissionAndFeeScreen> {
  List<AdmissionItem> _getItems(String contactFormLink) {
    return [
      AdmissionItem(
        title: 'Admission Overview',
        content: '''
Although our main entry points are P1,P2,P5, P7 and S1, if you are hoping to enrol your child at a stage out with the main entry points, please contact school administrator before applying to check we have spaces available. 

Our admissions usually take place in December and May. However, we do take pupils mid-term subject to availability of place in the requested level.

Primary School:
Our intake for lower primary (P1-P4) and upper primary (P5-P7) include pupils from various nursery and primary schools.
We encourage parents to apply early as this will give school sufficient time to plan the academic year based on demand.

Primary 7 is a key stage for pupils. At this level they are preparing for a new journey into secondary school. Pupils joining the school at this level will sit our mandatory assessments before admission. This will help school prepare them for the standards required for transition into Al-Qalam secondary school.

Secondary School:
The main entry point for secondary is S1. However, we do accept placing request in S2 subject to availability.
Broad General Education taught in our secondary (S1 & S2) school provides the foundation needed for qualification years. Our secondary school intake is from a range of mainstream schools. S1 admissions have also seen demand from parents who have home-schooled their children in primary education. We usually assess pupils before accepting their placing requests for secondary school.

Flexible Learning:
Students graduate from Al-Qalam Secondary school into flexible learning offered by hsqualify.org. Students are focussed on preparing for subjects of their choices. There are no column restrictions.  Students can select up to eight subjects for their Nat5 (or GCSE) exams and up to six subjects for their Highers (or A-levels) exams.
This is a popular 30-week intensive course which is focused on preparing students for qualifications based on their choices of subjects.  Parents are encouraged to register their children early due to high demand.

Admissions Process:
Parents must either email or call us to book a visit or request a link to complete the application form. 

Our school admin will then reach out to guide you through the process until your child's first day at school. From completing the application form to the induction day, school administrator will be available to answer any queries you may have.

School Admin:
Contact Form: $contactFormLink
Email: schools@qalam-academy.org 
Phone: 01412372237 / 07722 126941 
Address: Ben Nevis Road, PA2 7BU 

''',
      ),
      AdmissionItem(title: 'Open Mornings', content: '''
Primary school open morning is held on the last Saturday of October and for secondary school & flexible learning is held on the last Saturday of November. 
Parents are welcome with their children for a school tour by our students and meet our leadership team.

The school does accept request for school visits on other days during the academic year.  However, they are arranged by appointment only. 

For more information contact the school administrator .

School Admin:
Contact Form: $contactFormLink
Email: schools@qalam-academy.org 
Phone: 01412372237 / 07722 126941 
Address: Ben Nevis Road, PA2 7BU 
'''),
      AdmissionItem(title: 'School Assessment', content: '''
Qalam Academy has a vibrant learning atmosphere and welcomes pupils from all backgrounds. We would always be looking for pupils who aspire to succeed and are well supported by their parents and guardians.

Your child will appear for a formal assessment test that reflects our standards and expectations at the level at which they are seeking admissions. Entrance exams will give us better understanding of each child and assess their potential.
'''),
      AdmissionItem(title: 'School Fees', content: '''
Qalam Academy is a fully independent private school. The school has maintained reasonably low term fees with significant bursaries and discounts. We offer up to 50% bursaries and discounts which may vary from time to time and is subject to availability of funds. Parents are encouraged to apply early. Our admissions are generally open from last week of October, although, we do accept student's mid-term if there are places available at their level.

School term is from September - June.

Term Fee Payment Options

•	Full payment in advance. Additional 5% discount is applied provided payment is received by the end of current academic year (existing students) or at the time of admission (new admissions) 

•	Standing Order monthly payments either in 12, 10 or 6 instalments. 

School term fees do not include SQA exam fees, uniforms, stationaries, trips or any other ancillary costs.

The school has a personal accident cover for all pupils and staff. The cost of insurance is covered in the fees.
'''),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavbarCubit(),
      child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
              systemNavigationBarIconBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.dark,
            ),
            child: BlocListener<AdmissionAndFeeBlocCubit, AdmissionAndFeeState>(
              bloc: widget.admissionAndFeeBlocCubit,
              listener: (context, state) {
                if (state is AdmissionAndFeeErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.message,
                        style: GoogleFonts.nunitoSans(
                            fontSize: 14.sp,
                            height: 1,
                            fontWeight: FontWeight.w400,
                            color: Colors.white)),
                    backgroundColor: const Color(0xFFA91936),
                    duration: const Duration(seconds: 2),
                  ));
                }
              },
              child: Scaffold(
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
                  backgroundColor: Colors.white,
                  body: SingleChildScrollView(
                    child: Stack(children: [
                      Image.asset(
                        "assets/images/image_background.png",
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 170.h),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                    child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                            "Take the first step toward joining"
                                                .toUpperCase(),
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.nunitoSans(
                                              fontSize: 16.sp,
                                              height: 1,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xFFA91936),
                                            )),
                                        SizedBox(height: 18.h),
                                        Text("Qalam Academy",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.playfairDisplay(
                                                fontSize: 40.sp,
                                                height: 1,
                                                fontWeight: FontWeight.w600,
                                                color:
                                                    const Color(0xFF185B31))),
                                        SizedBox(height: 30.h),
                                        Text(
                                            "Explore our comprehensive admissions and fees information. Whether you are enrolling your child in our mainstream school or the flexible learning course, our team will be pleased to guide you through the process.",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.nunitoSans(
                                                fontSize: 16.sp,
                                                letterSpacing: 1,
                                                height: 1.3,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    const Color(0xFF333333))),
                                        SizedBox(height: 50.h),
                                        ListView(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          children: _getItems(widget
                                                  .admissionAndFeeBlocCubit
                                                  .getContactFormLink())
                                              .map((item) =>
                                                  ExpandableTile(item: item))
                                              .toList(),
                                        ),
                                        SizedBox(height: 40.h),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFFFF4F4),
                                            borderRadius:
                                                BorderRadius.circular(20.r),
                                          ),
                                          height: 280.h,
                                          width: double.infinity,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                                                  textDirection:
                                                      TextDirection.ltr,
                                                  textAlign: TextAlign.justify,
                                                  style: GoogleFonts.nunitoSans(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: const Color(
                                                          0xFFA91936))),
                                              SizedBox(height: 15.h),
                                              Text("Qalam Academy",
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts
                                                      .playfairDisplay(
                                                          fontSize: 32.sp,
                                                          height: 1,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: const Color(
                                                              0xFF185B31))),
                                              SizedBox(height: 30.h),
                                              CustomButtonWidget(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            BlocProvider<
                                                                ContactUsCubit>(
                                                          create: (context) =>
                                                              ContactUsCubit(
                                                                  EmailRepositoryImpl()),
                                                          child: ContactUsScreen(
                                                              contactUsCubit:
                                                                  ContactUsCubit(
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
                                      ]),
                                )),
                              ]))
                    ]),
                  )),
            ),
          )),
    );
  }
}

class ExpandableTile extends StatefulWidget {
  final AdmissionItem item;

  const ExpandableTile({super.key, required this.item});

  @override
  State<ExpandableTile> createState() => _ExpandableTileState();
}

class _ExpandableTileState extends State<ExpandableTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Container(
        decoration: BoxDecoration(
          color: _isExpanded ? Colors.grey.shade200 : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(4),
        ),
        child: ExpansionTile(
          backgroundColor: Colors.grey.shade100,
          minTileHeight: 20,
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          childrenPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          initiallyExpanded: _isExpanded,
          onExpansionChanged: (expanded) =>
              setState(() => _isExpanded = expanded),
          title: Text(
            widget.item.title,
            style: GoogleFonts.nunitoSans(
              color: const Color(0xFF226B3D),
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          dense: true,
          trailing: Icon(
            _isExpanded ? Icons.remove : Icons.add,
            color: const Color(0xFF2F6831),
          ),
          shape: const RoundedRectangleBorder(),
          collapsedBackgroundColor: Colors.grey.shade100,
          children: widget.item.content != null
              ? [
                  ClickableText(
                    text: widget.item.content!,
                    style: GoogleFonts.nunitoSans(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ]
              : [],
        ),
      ),
    );
  }
}
