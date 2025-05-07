import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsCurriculumSection extends StatelessWidget {
  final String title;
  final String description;

  final bool isLeft;

  const AboutUsCurriculumSection({
    super.key,
    required this.title,
    required this.description,
    required this.isLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isLeft) ...{
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).width > 400
                            ? 30.h
                            : 80.h,
                      ),
                      _buildTextContent(isLeft),
                      SizedBox(
                        height: 30.h,
                      ),
                    ],
                  )
                } else ...{
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).width > 400
                            ? 20.h
                            : 40.h,
                      ),
                      _buildTextContent(isLeft),
                      SizedBox(
                        height: 30.h,
                      ),
                    ],
                  )),
                },
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildTextContent(bool isLeft) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: 267.w,
          child: Text(
            title,
            textAlign: !isLeft ? TextAlign.end : TextAlign.start,
            style: GoogleFonts.playfairDisplay(
              fontSize: 32.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFFA91936),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          width: 267.w,
          child: Text(
            textAlign: !isLeft ? TextAlign.end : TextAlign.start,
            description,
            style: GoogleFonts.nunitoSans(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF333333),
            ),
          ),
        ),
      ],
    );
  }
}
