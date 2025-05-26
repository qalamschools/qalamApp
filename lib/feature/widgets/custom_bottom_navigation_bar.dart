import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    this.onTap,
  });

  final void Function(int index)? onTap;
  final int currentIndex;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color(0xffE3E3E3),
              width: 1,
            ),
          ),
        ),
        child: BottomAppBar(
            surfaceTintColor: Colors.white,
            color: Colors.white,
            shadowColor: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildNavItem(0, "assets/icons/home.svg", 'Home', screenWidth),
                _buildNavItem(1, "assets/icons/calendar.svg", 'News & Events',
                    screenWidth),
                _buildNavItem(2, "assets/icons/admission_icon.svg",
                    'Admissions', screenWidth),
                _buildNavItem(
                    3, "assets/icons/quick_pay.svg", 'Quick Pay', screenWidth),
                _buildNavItem(4, "assets/icons/more.svg", 'More', screenWidth),
              ],
            )));
  }

  Widget _buildNavItem(
      int index, String iconPath, String label, double screenWidth) {
    final isSelected = widget.currentIndex == index;

    double iconSize = screenWidth * 0.06;
    double fontSize = screenWidth * 0.03;

    return GestureDetector(
      onTap: widget.onTap != null ? () => widget.onTap!(index) : null,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            iconPath,
            width: iconSize,
            colorFilter: isSelected
                ? const ColorFilter.mode(Color(0xFF1B5E20), BlendMode.srcIn)
                : const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
              fontSize: fontSize,
              fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
              color: isSelected
                  ? const Color(0xFF1B5E20)
                  : const Color(0xff6A6A6E),
            ),
          ),
        ],
      ),
    );
  }
}
