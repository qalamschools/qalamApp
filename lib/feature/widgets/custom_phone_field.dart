import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomPhoneField extends StatefulWidget {
  const CustomPhoneField(
      {super.key,
      this.inputFormatters,
      this.isRequired = false,
      required this.controller,this.validator});
  final List<TextInputFormatter>? inputFormatters;
  final bool isRequired;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  @override
  _CustomPhoneFieldState createState() => _CustomPhoneFieldState();
}

class _CustomPhoneFieldState extends State<CustomPhoneField> {
  final String selectedCode = '+44';
  final String flagAsset = 'assets/images/flag.png';
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      keyboardType: TextInputType.phone,
      style: GoogleFonts.nunitoSans(
        color: const Color(0xFF6E727A),
        fontSize: 14.sp,
        letterSpacing: 0.25,
        fontWeight: FontWeight.w400,
      ),
      inputFormatters: widget.inputFormatters ?? [],
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Mobile Number',
              style: GoogleFonts.nunitoSans(
                  color: const Color(0xff6E727A),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400),
            ),
            if (widget.isRequired)
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
        hintText: "000 000 000",
        hintStyle: GoogleFonts.nunitoSans(
          color: const Color(0xFF7D7D7D),
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
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
        prefix: GestureDetector(
          onTap: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(flagAsset, width: 33),
              const SizedBox(width: 6),
              Text(
                selectedCode,
                style: GoogleFonts.nunitoSans(
                    color: const Color(0xff393939),
                    fontSize: 14.sp,
                    letterSpacing: 0.25,
                    fontWeight: FontWeight.w400),
              ),
              const Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xff393939),
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
