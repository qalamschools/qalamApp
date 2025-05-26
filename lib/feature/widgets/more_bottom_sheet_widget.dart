import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qalam_app/core/commons/data/repository/email_repository.dart';
import 'package:qalam_app/feature/about_us/presentation/about_us_screen.dart';
import 'package:qalam_app/feature/admission_and_fee/cubit/admission_and_fee_bloc_cubit.dart';
import 'package:qalam_app/feature/admission_and_fee/presentation/admission_and_fee_screen.dart';
import 'package:qalam_app/feature/contact_us/cubit/contact_us_cubit.dart';
import 'package:qalam_app/feature/contact_us/presentation/contact_us_screen.dart';
import 'package:qalam_app/feature/dashboard/cubit/dashboard_cubit.dart';

class MoreBottomSheetWidget extends StatefulWidget {
  const MoreBottomSheetWidget({super.key});

  @override
  State<MoreBottomSheetWidget> createState() => _MoreBottomSheetWidgetState();
}

class _MoreBottomSheetWidgetState extends State<MoreBottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
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
                            create: (context) =>
                                ContactUsCubit(EmailRepositoryImpl()),
                            child: ContactUsScreen(
                              contactUsCubit:
                                  ContactUsCubit(EmailRepositoryImpl()),
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
                    context.read<DashboardCubit>().callUs();
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
}
