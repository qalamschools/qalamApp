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
import 'package:qalam_app/feature/widgets/custom_button_widget.dart';
import 'package:qalam_app/feature/widgets/social_icon_widget.dart';

class OurServicesScreen extends StatefulWidget {
  const OurServicesScreen({super.key, required this.admissionAndFeeBlocCubit});
  final AdmissionAndFeeBlocCubit admissionAndFeeBlocCubit;

  @override
  State<OurServicesScreen> createState() => _OurServicesScreenState();
}

class _OurServicesScreenState extends State<OurServicesScreen> {
  final List<AdmissionItem> items = [
    AdmissionItem(title: 'Nursery & Early Years', content: '''
Rented out to an operator in return for long lease                                                             '''),
    AdmissionItem(title: 'SQA Coaching Centre', content: '''
Commercial tenant to be secured for a long lease to deliver private tuitions and out of school exam preparation'''),
    AdmissionItem(title: 'Event Hall & Future Facilities', content: '''
An event hire business objective forming a joint venture tenant on profit sharing basis'''),
    AdmissionItem(title: 'Physiotherapy-Hydrotherapy', content: '''
Swimming pool and adjoining area will be developed for physiotherapist and hydro therapist targeting elder and less abled patients and will be rented out to the operators running the show'''),
    AdmissionItem(title: 'Community Centre', content: '''
A hub to be set up for community engagement and capacity building leading to event hire business leads'''),
    AdmissionItem(title: 'Document Storage Solutions Hub', content: '''
Commercial tenants for a Business Documentation Storage: Secure, compliant document storage etc'''),
  ];
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
                                        Text("Project Zahoor",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.playfairDisplay(
                                                fontSize: 40.sp,
                                                height: 1,
                                                fontWeight: FontWeight.w600,
                                                color:
                                                    const Color(0xFF185B31))),
                                        SizedBox(height: 80.h),
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
                                                  "Start Your Journey Now"
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
