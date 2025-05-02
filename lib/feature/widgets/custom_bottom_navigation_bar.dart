import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar(
      {super.key, required this.currentIndex, this.onTap});
  final void Function(int index)? onTap;
  final int currentIndex;
  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildNavItem(0, "assets/icons/home.svg", 'Home'),
        SizedBox(width: 10.w),
        _buildNavItem(1, "assets/icons/calendar.svg", 'News & Media'),
        SizedBox(width: 10.w),
        _buildNavItem(2, "assets/icons/phone.svg", 'Call Us'),
        SizedBox(width: 10.w),
        _buildNavItem(3, "assets/icons/quick_pay.svg", 'Quick Pay'),
        SizedBox(width: 10.w),
        _buildNavItem(4, "assets/icons/more.svg", 'More'),
      ],
    );
  }

  Widget _buildNavItem(int index, String iconPath, String label) {
    final isSelected = widget.currentIndex == index;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: IconButton(
              padding: EdgeInsets.zero,
              onPressed:
                  widget.onTap != null ? () => widget.onTap!(index) : null,
              icon: SvgPicture.asset(
                iconPath,
                width: 30.w,
                colorFilter: isSelected
                    ? const ColorFilter.mode(
                        Color(0xFF1B5E20),
                        BlendMode.srcIn,
                      )
                    : const ColorFilter.mode(
                        Colors.grey,
                        BlendMode.srcIn,
                      ),
                color: isSelected
                    ? const Color(0xFF1B5E20)
                    : const Color(0xff6A6A6E),
              )),
        ),
        Text(
          label,
          style: GoogleFonts.nunito(
            fontSize: 11.sp,
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
            color:
                isSelected ? const Color(0xFF1B5E20) : const Color(0xff6A6A6E),
          ),
        ),
      ],
    );
  }
}
