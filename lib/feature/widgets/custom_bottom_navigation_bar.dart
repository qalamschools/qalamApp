import 'package:flutter/material.dart';
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
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildNavItem(0, "assets/icons/home.svg", 'Home'),
        _buildNavItem(1, "assets/icons/calendar.svg", 'News & Events'),
        _buildNavItem(2, "assets/icons/admission_icon.svg", 'Admissions'),
        _buildNavItem(3, "assets/icons/quick_pay.svg", 'Quick Pay'),
        _buildNavItem(4, "assets/icons/more.svg", 'More'),
      ],
    );
  }

  Widget _buildNavItem(int index, String iconPath, String label) {
    final isSelected = widget.currentIndex == index;
    return GestureDetector(
      onTap: widget.onTap != null ? () => widget.onTap!(index) : null,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SvgPicture.asset(
                iconPath,
                width: 25,
                colorFilter: isSelected
                    ? const ColorFilter.mode(
                        Color(0xFF1B5E20),
                        BlendMode.srcIn,
                      )
                    : const ColorFilter.mode(
                        Colors.grey,
                        BlendMode.srcIn,
                      ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: GoogleFonts.nunito(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                color: isSelected
                    ? const Color(0xFF1B5E20)
                    : const Color(0xff6A6A6E),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
