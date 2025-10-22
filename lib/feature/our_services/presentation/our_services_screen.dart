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

class OurServicesScreen extends StatefulWidget {
  const OurServicesScreen({super.key, required this.admissionAndFeeBlocCubit});
  final AdmissionAndFeeBlocCubit admissionAndFeeBlocCubit;

  @override
  State<OurServicesScreen> createState() => _OurServicesScreenState();
}

class _OurServicesScreenState extends State<OurServicesScreen> {
  final List<AdmissionItem> items = [
    AdmissionItem(title: 'Flexible Learning', content: '''
Our flexible learning is quite popular with students of high school. We offer tuitions to prepare your child for NAT5, GCSE, Highers or A-Level examination. There are no column restrictions and pupils can pick one or many subjects of their choices. 

Contact HsQ Co-ordinator
email: contactus@hsqualify.org 
Call: 07507676295
'''),
    AdmissionItem(title: 'Event Hall', content: '''
We have a community hall that can accommodate upto 75 guests. The hall is ideal for small events such as mehendi, birthday party, waleema dinner or even workshops and annual functions.

Office Admin email: schools@qalam-academy.org
Call: 07507676295
'''),
    AdmissionItem(title: 'Community Centre', content: '''
It will offer prayer facilities and other community programmes. It is currently under renovation and will be available soon.
If you are interested in operating the community centre, please contact us. 

School Admin email: contactus@qalam-academy.org 
Call: 07722126941

'''),
    AdmissionItem(title: 'Nursery', content: '''
The school has two sizeable classrooms with separate entry. There is also a common reception and admin area. We would welcome any registered nursery or nursery manager who will be interested in operating the nursery.  

School Admin email: contactus@qalam-academy.org
Call: 07722126941

'''),
    AdmissionItem(title: 'Swimming Pool', content: '''
The school has a sizeable swimming pool with separate entry. There is also a common reception and admin area. We would welcome any registered swimming institute who will be interested in this opportunity.  

School Admin email: contactus@qalam-academy.org
Call: 07722126941

'''),
    AdmissionItem(title: 'Barista', content: '''
The school has a sizeable kitchen with separate entry. We would welcome interested companies or experienced barista who would like to operate from our kitchen.  

School Admin email: contactus@qalam-academy.org
Call: 07722126941

'''),
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
                                        Text("Our Services",
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
                                              SizedBox(height: 15.h),
                                              Text(
                                                  "Interested in any of the services?"
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
