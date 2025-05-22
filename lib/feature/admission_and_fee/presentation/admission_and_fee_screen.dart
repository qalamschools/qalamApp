import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qalam_app/core/constants/app_image.dart';
import 'package:qalam_app/feature/admission_and_fee/cubit/admission_and_fee_bloc_cubit.dart';
import 'package:qalam_app/feature/admission_and_fee/models/admission_item_model.dart';
import 'package:qalam_app/feature/contact_us/cubit/contact_us_cubit.dart';
import 'package:qalam_app/feature/contact_us/presentation/contact_us_screen.dart';
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
  final List<AdmissionItem> items = [
    AdmissionItem(
      title: 'Admission Overview',
      content: '''
Learn about our comprehensive admission process, including eligibility criteria, key dates, and necessary documentation for enrollment. While we accept applications for entry to any stage if we have spaces available, our main entry points are P1, P4, P7 and S1. If you are hoping to join at a stage outwith the main entry points, please speak to our Admissions Registrar before applying to check we have spaces available.

Rest assured that suitably small class sizes are very much a part of our offering right the way through from Nursery to S6. Get insights into what sets our institution apart and how we nurture student growth from the start.
''',
    ),
    AdmissionItem(title: 'Open Mornings', content: '''
Learn about our comprehensive admission process, including eligibility criteria, key dates, and necessary documentation for enrollment. While we accept applications for entry to any stage if we have spaces available, our main entry points are P1, P4, P7 and S1. If you are hoping to join at a stage outwith the main entry points, please speak to our Admissions Registrar before applying to check we have spaces available.

Rest assured that suitably small class sizes are very much a part of our offering right the way through from Nursery to S6. Get insights into what sets our institution apart and how we nurture student growth from the start.
'''),
    AdmissionItem(title: 'Primary School Assessment', content: '''
Learn about our comprehensive admission process, including eligibility criteria, key dates, and necessary documentation for enrollment. While we accept applications for entry to any stage if we have spaces available, our main entry points are P1, P4, P7 and S1. If you are hoping to join at a stage outwith the main entry points, please speak to our Admissions Registrar before applying to check we have spaces available.

Rest assured that suitably small class sizes are very much a part of our offering right the way through from Nursery to S6. Get insights into what sets our institution apart and how we nurture student growth from the start.
'''),
    AdmissionItem(title: 'Secondary School Assessment', content: '''
Learn about our comprehensive admission process, including eligibility criteria, key dates, and necessary documentation for enrollment. While we accept applications for entry to any stage if we have spaces available, our main entry points are P1, P4, P7 and S1. If you are hoping to join at a stage outwith the main entry points, please speak to our Admissions Registrar before applying to check we have spaces available.

Rest assured that suitably small class sizes are very much a part of our offering right the way through from Nursery to S6. Get insights into what sets our institution apart and how we nurture student growth from the start.
'''),
    AdmissionItem(title: 'Fees & Bursaries', content: '''
Learn about our comprehensive admission process, including eligibility criteria, key dates, and necessary documentation for enrollment. While we accept applications for entry to any stage if we have spaces available, our main entry points are P1, P4, P7 and S1. If you are hoping to join at a stage outwith the main entry points, please speak to our Admissions Registrar before applying to check we have spaces available.

Rest assured that suitably small class sizes are very much a part of our offering right the way through from Nursery to S6. Get insights into what sets our institution apart and how we nurture student growth from the start.
'''),
    AdmissionItem(title: 'School Transport', content: '''
Learn about our comprehensive admission process, including eligibility criteria, key dates, and necessary documentation for enrollment. While we accept applications for entry to any stage if we have spaces available, our main entry points are P1, P4, P7 and S1. If you are hoping to join at a stage outwith the main entry points, please speak to our Admissions Registrar before applying to check we have spaces available.

Rest assured that suitably small class sizes are very much a part of our offering right the way through from Nursery to S6. Get insights into what sets our institution apart and how we nurture student growth from the start.
'''),
  ];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                            color: const Color(0xFF185B31))),
                                    SizedBox(height: 30.h),
                                    Text(
                                        "Explore our comprehensive admissions and fees information. Whether you're enrolling in Nursery, Primary, or Secondary school, our team is here to guide you through the process.",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.nunitoSans(
                                            fontSize: 16.sp,
                                            letterSpacing: 1,
                                            height: 1.3,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFF333333))),
                                    SizedBox(height: 50.h),
                                    ListView(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      children: items
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
                                              textDirection: TextDirection.ltr,
                                              textAlign: TextAlign.justify,
                                              style: GoogleFonts.nunitoSans(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xFFA91936))),
                                          SizedBox(height: 15.h),
                                          Text("Qalam Academy",
                                              textAlign: TextAlign.center,
                                              style:
                                                  GoogleFonts.playfairDisplay(
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
                                                          ContactUsCubit(),
                                                      child: ContactUsScreen(
                                                          contactUsCubit:
                                                              ContactUsCubit()),
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
              ),
            ),
          ),
        ));
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
              fontSize: 14.sp,
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
                  Text(
                    widget.item.content!,
                    style: GoogleFonts.nunitoSans(
                        fontSize: 12.sp, fontWeight: FontWeight.w400),
                  ),
                ]
              : [],
        ),
      ),
    );
  }
}
