import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CurriculumSection extends StatelessWidget {
  final int number;
  final String title;
  final String description;
  final String imagePath;
  final bool isLeft;

  const CurriculumSection({
    super.key,
    required this.number,
    required this.title,
    required this.description,
    required this.imagePath,
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
            padding: EdgeInsets.symmetric(
                horizontal: 16, vertical: isLeft ? 20 : 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (isLeft) ...{
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                imagePath,
                                fit: BoxFit.cover,
                                width: 267.w,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 80.h, left: 40.w, right: 30.w),
                            child: _buildNumberBadge(isLeft: isLeft),
                          ),
                        ],
                      ),
                      _buildTextContent()
                    ],
                  ))
                } else ...{
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 27),
                            // padding: EdgeInsets.only(
                            //     top: 80.h, right: 20.w, left: 25.w),
                            child: _buildNumberBadge(isLeft: isLeft),
                          ),
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                imagePath,
                                fit: BoxFit.cover,
                                //width: 220.w,
                              ),
                            ),
                          ),
                        ],
                      ),
                      _buildTextContent()
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

  Widget _buildNumberBadge({required bool isLeft}) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          isLeft
              ? "assets/icons/red_shield.svg"
              : "assets/icons/green_shield.svg",
          height: 22.h,
          fit: BoxFit.cover,
        ),
        Text(
          number.toString(),
          style: GoogleFonts.nunitoSans(
            fontSize: 12.sp,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildTextContent() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(height: 15.h),
        SizedBox(
          width: 267.w,
          child: Text(
            title,
            style: GoogleFonts.nunitoSans(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1B5E20),
            ),
          ),
        ),
        SizedBox(height: 15.h),
        SizedBox(
          width: 267.w,
          child: Text(
            description,
            style: GoogleFonts.nunitoSans(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF333333),
            ),
          ),
        )
      ],
    );
  }
}
