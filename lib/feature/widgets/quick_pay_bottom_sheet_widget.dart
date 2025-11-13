import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qalam_app/feature/dashboard/cubit/dashboard_cubit.dart';

class QuickPayBottomSheetWidget extends StatelessWidget {
  const QuickPayBottomSheetWidget({super.key});

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
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    context
                        .read<DashboardCubit>()
                        .applicationFeeStripeLink(context);
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
                                "Pay Fees",
                                style: GoogleFonts.nunitoSans(
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff000000),
                                    fontSize: 16.sp),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Text(
                                "Application Fee, School Tuition Fee",
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
                    context
                        .read<DashboardCubit>()
                        .otherApplicationFeeStripeLink(context);
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
                                "Uniforms, Trips, Stationery And Ancillary",
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
