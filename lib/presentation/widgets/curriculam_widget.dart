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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
      child: Column(
        crossAxisAlignment:
            isLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: isLeft
                ? [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            imagePath,
                            width: 267.w,
                          ),
                        ),
                        Positioned(
                          left: 320.w,
                          top: 120.h,
                          child: _buildNumberBadge(isLeft: isLeft),
                        ),
                      ],
                    ),
                    SizedBox(width: 20.h),
                  ]
                : [
                    SizedBox(width: 20.w),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            imagePath,
                            width: 267.w,
                          ),
                        ),
                        Positioned(
                          right: 320.w,
                          top: 120.h,
                          child: _buildNumberBadge(isLeft: isLeft),
                        ),
                      ],
                    ),
                  ],
          ),
          _buildTextContent()
        ],
      ),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          title,
          style: GoogleFonts.nunitoSans(
            fontSize: 16.sp,
            fontStyle: FontStyle.italic,
            color: const Color(0xFF1B5E20),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: 267,
          child: Text(
            description,
            style: GoogleFonts.nunitoSans(
              fontSize: 16.sp,
              color: const Color(0xFF1B5E20),
            ),
          ),
        )
      ],
    );
  }
}
