import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qalam_app/feature/new_and_media/cubit/event_cubit.dart';
import 'package:qalam_app/feature/new_and_media/models/event_model.dart';
import 'package:qalam_app/feature/widgets/calender_details_widget.dart';

class CustomEventItemCard extends StatelessWidget {
  const CustomEventItemCard({super.key, required this.event});

  final EventModel event;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 221.h,
            width: 100.sw,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              elevation: 0,
              color: Colors.white,
              child: CachedNetworkImage(
                imageUrl: event.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            event.title,
            style: GoogleFonts.playfairDisplay(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 12.h),
          CalenderDetailsWidget(
            onTap: () {
              context.read<EventsCubit>().addToCalendar(event);
            },
          )
        ],
      ),
    );
  }
}
