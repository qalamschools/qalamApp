import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:qalam_app/feature/new_and_media/models/event_model.dart';

class CalenderDetailsWidget extends StatelessWidget {
  const CalenderDetailsWidget(
      {super.key, required this.onTap, required this.event});

  final VoidCallback onTap;
  final EventModel event;
  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd MMM yyyy hh:mm a').format(event.date);
    String dayOfWeek = DateFormat('EEEE').format(event.date);
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
              formattedDate,
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
              dayOfWeek,
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
