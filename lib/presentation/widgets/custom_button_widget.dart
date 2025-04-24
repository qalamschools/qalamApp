import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({super.key, this.width = 100, required this.text});
  final double width;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      iconAlignment: IconAlignment.end,
      icon: SvgPicture.asset(
        "assets/icons/forward_icon.svg",
        width: 12.w,
        fit: BoxFit.contain,
        color: Colors.white,
      ),
      label: Text(
        text,
        style: GoogleFonts.inter(
          color: Colors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      style: TextButton.styleFrom(
        minimumSize: Size(width.w, 41.h),
        maximumSize: Size(width.w, 41.h),
        backgroundColor: const Color(0xFF185B31),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.r),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
      ),
      onPressed: () {},
    );
  }
}
