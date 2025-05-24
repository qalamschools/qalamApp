import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.text,
    required this.onTap,
    this.width = 100,
    this.showIcon = true,
    this.isLoading = false,
  });

  final double width;
  final String text;
  final VoidCallback onTap;
  final bool showIcon;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      iconAlignment: IconAlignment.end,
      onPressed: isLoading ? null : onTap,
      icon: showIcon && !isLoading
          ? SvgPicture.asset(
              "assets/icons/forward_icon.svg",
              width: 12.w,
              fit: BoxFit.contain,
              color: Colors.white,
            )
          : const SizedBox.shrink(),
      label: isLoading
          ? SizedBox(
              height: 16.h,
              width: 16.h,
              child: const CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
              ),
            )
          : Text(
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
      ),
    );
  }
}
