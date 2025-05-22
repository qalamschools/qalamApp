import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CalenderDetailsWidget extends StatelessWidget {
  const CalenderDetailsWidget({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              height: 16.h,
              width: 16.h,
              "assets/icons/calenderIcon.svg",
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              "April 28 - May 12",
              style: GoogleFonts.nunitoSans(
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
            )
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              height: 16.h,
              width: 16.h,
              "assets/icons/clockIcon.svg",
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              "Mon - Thu",
              style: GoogleFonts.nunitoSans(
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
            )
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                height: 16.h,
                width: 16.h,
                "assets/icons/addToCalanderIcon.svg",
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                "Add to Calender",
                style: GoogleFonts.nunitoSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: const Color(0xff1F6947)),
              )
            ],
          ),
        )
      ],
    );
  }
}
