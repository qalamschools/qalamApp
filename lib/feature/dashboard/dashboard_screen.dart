import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qalam_app/core/utils/common_utils.dart';
import 'package:qalam_app/feature/about_us/presentation/about_us_screen.dart';
import 'package:qalam_app/feature/admission_and_fee/cubit/admission_and_fee_bloc_cubit.dart';
import 'package:qalam_app/feature/admission_and_fee/presentation/admission_and_fee_screen.dart';
import 'package:qalam_app/feature/contact_us/cubit/contact_us_cubit.dart';
import 'package:qalam_app/feature/contact_us/data/repository/remote_config_repo.dart';
import 'package:qalam_app/feature/contact_us/data/service/remote_config_service.dart';
import 'package:qalam_app/feature/contact_us/presentation/contact_us_screen.dart';

import 'package:qalam_app/feature/dashboard/home/home.dart';
import 'package:qalam_app/feature/new_and_media/presentation/new_and_media_screen.dart';
import 'package:qalam_app/feature/widgets/custom_bottom_navigation_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;
  bool _isQuickPayBottomSheetOpen = false;
  bool _isMoreBottomSheetOpen = false;

  void _toggleBottomSheet() {
    setState(() {
      _isQuickPayBottomSheetOpen = !_isQuickPayBottomSheetOpen;
    });
  }

  void _toggleMoreBottomSheet() {
    setState(() {
      _isMoreBottomSheetOpen = !_isMoreBottomSheetOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        child: PopScope(
          canPop: false,
          child: Scaffold(
            backgroundColor: Colors.white,
            bottomSheet: _buildBottomSheet(),
            body: Stack(
              children: [
                const Home(),
                if (_isQuickPayBottomSheetOpen || _isMoreBottomSheetOpen)
                  _buildBackdropOverlay(),
              ],
            ),
            bottomNavigationBar: _buildBottomNavigationBar(),
          ),
        ));
  }

  Widget? _buildBottomSheet() {
    if (_isQuickPayBottomSheetOpen) return quickPayBottomSheet();
    if (_isMoreBottomSheetOpen) return moreBottomSheet();
    return null;
  }

  Widget _buildBackdropOverlay() {
    return Positioned.fill(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isQuickPayBottomSheetOpen = false;
            _isMoreBottomSheetOpen = false;
            currentIndex = 0;
          });
        },
        child: Container(
          color: Colors.black.withOpacity(0.8),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xffE3E3E3),
            width: 1,
          ),
        ),
      ),
      child: BottomAppBar(
        surfaceTintColor: Colors.white,
        color: Colors.white,
        shadowColor: Colors.white,
        shape: const CircularNotchedRectangle(),
        child: CustomBottomNavigationBar(
          currentIndex: currentIndex,
          onTap: _onNavItemTapped,
        ),
      ),
    );
  }

  void _onNavItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
    if (index != 3) _isQuickPayBottomSheetOpen = false;
    if (index != 4) _isMoreBottomSheetOpen = false;

    switch (index) {
      case 1:
        currentIndex = 0;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NewAndMediaScreen()),
        );
        break;
      case 2:
        currentIndex = 0;
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AdmissionAndFeeScreen(
                    admissionAndFeeBlocCubit: AdmissionAndFeeBlocCubit(),
                  )),
        );
        break;
      case 3:
        _toggleBottomSheet();
        break;
      case 4:
        _toggleMoreBottomSheet();
        break;
      default:
        break;
    }
  }

  Widget moreBottomSheet() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: SvgPicture.asset("assets/icons/bottomsheet_divider.svg"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AboutUsScreen(),
                        ));
                  },
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.r, vertical: 6.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                              color: const Color(0xff185B1C).withOpacity(0.5)),
                          gradient: const LinearGradient(
                              colors: [Color(0xffE3F8EB), Color(0xffFFFFFF)])),
                      child: Row(
                        children: [
                          Container(
                            height: 52,
                            width: 52,
                            decoration: BoxDecoration(
                              color: const Color(0xff185B1C),
                              border: Border.all(
                                  color: const Color(0xffE3F8EB), width: 1),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                "assets/icons/about_us_icon.svg",
                                width: 18.h,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                              width: 10
                                  .w), // use .w to stay consistent with screen util
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "About Us",
                                  style: GoogleFonts.nunitoSans(
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff000000),
                                    fontSize: 16.sp,
                                  ),
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Text(
                                  "Get to know who we are and what we do.",
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.nunitoSans(
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff666666),
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 10.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              BlocProvider<AdmissionAndFeeBlocCubit>(
                            create: (context) => AdmissionAndFeeBlocCubit(),
                            child: AdmissionAndFeeScreen(
                              admissionAndFeeBlocCubit:
                                  AdmissionAndFeeBlocCubit(),
                            ),
                          ),
                        ));
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.r, vertical: 6.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                            color: const Color(0xff185B1C).withOpacity(0.5)),
                        gradient: const LinearGradient(
                            colors: [Color(0xffE3F8EB), Color(0xffFFFFFF)])),
                    child: Row(
                      children: [
                        Container(
                          height: 52,
                          width: 52,
                          decoration: BoxDecoration(
                            color: const Color(0xff185B1C),
                            border: Border.all(
                                color: const Color(0xffE3F8EB), width: 1),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              "assets/icons/bank_note.svg",
                              width: 18.h,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Admissions & Fees",
                                style: GoogleFonts.nunitoSans(
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff000000),
                                    fontSize: 16.sp),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Text(
                                "Select courses and apply now.",
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.nunitoSans(
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff666666),
                                    fontSize: 14.sp),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider<ContactUsCubit>(
                            create: (context) => ContactUsCubit(
                                RemoteConfigRepository(RemoteConfigService(
                                    FirebaseRemoteConfig.instance))),
                            child: ContactUsScreen(
                              contactUsCubit: ContactUsCubit(
                                  RemoteConfigRepository(RemoteConfigService(
                                      FirebaseRemoteConfig.instance))),
                            ),
                          ),
                        ));
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.r, vertical: 6.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                            color: const Color(0xff185B1C).withOpacity(0.5)),
                        gradient: const LinearGradient(
                            colors: [Color(0xffE3F8EB), Color(0xffFFFFFF)])),
                    child: Row(
                      children: [
                        Container(
                          height: 52,
                          width: 52,
                          decoration: BoxDecoration(
                            color: const Color(0xff185B1C),
                            border: Border.all(
                                color: const Color(0xffE3F8EB), width: 1),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                                width: 18.h,
                                color: Colors.white,
                                "assets/icons/contact_us_icon.svg"),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Contact Us",
                                style: GoogleFonts.nunitoSans(
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff000000),
                                    fontSize: 16.sp),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Text(
                                "Reach out to us for any inquiries",
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.nunitoSans(
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff666666),
                                    fontSize: 14.sp),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                GestureDetector(
                  onTap: () {
                    CommonUtils.openDialer(number: "+91722126941");
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.r, vertical: 6.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                            color: const Color(0xff185B1C).withOpacity(0.5)),
                        gradient: const LinearGradient(
                            colors: [Color(0xffE3F8EB), Color(0xffFFFFFF)])),
                    child: Row(
                      children: [
                        Container(
                          height: 52,
                          width: 52,
                          decoration: BoxDecoration(
                            color: const Color(0xff185B1C),
                            border: Border.all(
                                color: const Color(0xffE3F8EB), width: 1),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              "assets/icons/phone.svg",
                              width: 18.h,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Call Us",
                                style: GoogleFonts.nunitoSans(
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff000000),
                                    fontSize: 16.sp),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Text(
                                "Call us for any inquiries",
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.nunitoSans(
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff666666),
                                    fontSize: 14.sp),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget quickPayBottomSheet() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: SvgPicture.asset("assets/icons/bottomsheet_divider.svg"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 6.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                          color: const Color(0xff185B1C).withOpacity(0.5)),
                      gradient: const LinearGradient(
                          colors: [Color(0xffE3F8EB), Color(0xffFFFFFF)])),

                  /// height: 71,
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.r, vertical: 8.h),
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          color: const Color(0xff185B1C),
                          border: Border.all(
                              color: const Color(0xffE3F8EB), width: 1),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Center(
                          child:
                              SvgPicture.asset("assets/icons/coin-pound.svg"),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Pay £90 Application Fees",
                              style: GoogleFonts.nunitoSans(
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff000000),
                                  fontSize: 16.sp),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              "For New Admissions",
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.nunitoSans(
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff666666),
                                  fontSize: 14.sp),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 6.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                          color: const Color(0xff185B1C).withOpacity(0.5)),
                      gradient: const LinearGradient(
                          colors: [Color(0xffE3F8EB), Color(0xffFFFFFF)])),
                  //height: 71,
                  child: Row(
                    children: [
                      Container(
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          color: const Color(0xff185B1C),
                          border: Border.all(
                              color: const Color(0xffE3F8EB), width: 1),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Center(
                          child: SvgPicture.asset("assets/icons/bank1.svg"),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Other Payments",
                              style: GoogleFonts.nunitoSans(
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff000000),
                                  fontSize: 16.sp),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              "Uniforms, trips, stationery and Ancillary",
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.nunitoSans(
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff666666),
                                  fontSize: 14.sp),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
