import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar(
      {super.key, required this.currentIndex, this.onTap});
  final void Function(int index, String name)? onTap;
  final int currentIndex;
  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(0, "assets/icons/home.svg", 'Home'),
          SizedBox(width: 20.w),
          _buildNavItem(1, "assets/icons/calendar.svg", 'News & Media'),
          SizedBox(width: 20.w),
          SizedBox(width: 20.w), // Space for the FAB
          _buildNavItem(2, "assets/icons/phone.svg", 'Call Us'),
          SizedBox(width: 20.w),
          _buildNavItem(3, "assets/icons/quick_pay.svg", 'Quick Pay'),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, String iconPath, String label) {
    final isSelected = widget.currentIndex == index;

    return GestureDetector(
      onTap: widget.onTap != null ? () => widget.onTap!(index, label) : null,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            iconPath,
            height: 20.h,
            colorFilter: isSelected
                ? const ColorFilter.mode(
                    Color(0xFF1B5E20),
                    BlendMode.srcIn,
                  )
                : const ColorFilter.mode(
                    Colors.grey,
                    BlendMode.srcIn,
                  ),
            color: isSelected ? const Color(0xFF1B5E20) : Colors.grey,
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: GoogleFonts.nunito(
              fontSize: 10.sp,
              color: isSelected ? const Color(0xFF1B5E20) : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
