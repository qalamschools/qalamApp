import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormWidget extends StatelessWidget {
  CustomTextFormWidget(
      {super.key,
      this.hintText,
      this.labelText,
      this.prefixPath,
      this.maxLines = 1,
      required this.controller,
      this.isRequired = false});
  String? hintText = "";
  String? labelText = "";
  String? prefixPath;
  int maxLines;
  int maxLength = 156;
  TextEditingController controller;
  bool isRequired; // New property to indicate if the field is required

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      maxLength: maxLines > 1 ? maxLength : null,
      style: GoogleFonts.nunitoSans(
        color: const Color(0xFF7D7D7D),
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      controller: controller,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: hintText,
        hintStyle: GoogleFonts.nunitoSans(
          color: const Color(0xFF7D7D7D),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              labelText ?? "",
              style: GoogleFonts.nunitoSans(
                color: const Color(0xff6E727A),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            if (isRequired)
              Text(
                "* ",
                style: GoogleFonts.questrial(
                  color: Colors.red,
                  fontSize: 24.sp,
                  letterSpacing: 0.25,
                  fontWeight: FontWeight.w400,
                ),
              ),
          ],
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
        prefix: (prefixPath != null || (prefixPath?.isNotEmpty ?? false))
            ? Padding(
                padding: EdgeInsets.only(left: 0.w, right: 10.w),
                child: SvgPicture.asset(
                  prefixPath!,
                  width: 12.h,
                ),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: Color(0xFFC4C4C4)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: Color(0xFFC4C4C4)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: Color(0xFFC4C4C4)),
        ),
      ),
    );
  }
}
