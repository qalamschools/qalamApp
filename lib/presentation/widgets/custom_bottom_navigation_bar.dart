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
    return Container(
      height: 56.h,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.0.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(0, "assets/icons/home.svg", 'Home'),
            SizedBox(width: 20.w),
            _buildNavItem(1, "assets/icons/calendar.svg", 'News & Media'),
            SizedBox(width: 50.w), // Space for the FAB
            _buildNavItem(3, "assets/icons/phone.svg", 'Contact us'),
            SizedBox(width: 20.w),
            _buildNavItem(4, "assets/icons/quick_pay.svg", 'Quick Pay'),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String iconPath, String label) {
    final isSelected = widget.currentIndex == index;

    return InkWell(
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
            //color: isSelected ? const Color(0xFF1B5E20) : Colors.grey,
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
