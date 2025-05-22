import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTabSelector extends StatefulWidget {
  final bool initialIsNewsSelected;
  final ValueChanged<bool>? onTabChanged;

  const CustomTabSelector({
    super.key,
    this.initialIsNewsSelected = true,
    this.onTabChanged,
  });

  @override
  _CustomTabSelectorState createState() => _CustomTabSelectorState();
}

class _CustomTabSelectorState extends State<CustomTabSelector> {
  late bool isNewsSelected;

  @override
  void initState() {
    super.initState();
    isNewsSelected = widget.initialIsNewsSelected;
  }

  void _onTabTap(bool selectNews) {
    setState(() => isNewsSelected = selectNews);
    widget.onTabChanged?.call(selectNews);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.h,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xffF0F0F0),
        borderRadius: BorderRadius.circular(71.r),
      ),
      child: Row(
        children: [
          _buildTab(
            title: 'News',
            selected: isNewsSelected,
            onTap: () => _onTabTap(true),
          ),
          _buildTab(
            title: 'Events',
            selected: !isNewsSelected,
            onTap: () => _onTabTap(false),
          ),
        ],
      ),
    );
  }

  Widget _buildTab({
    required String title,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: selected ? const Color(0xFF1F6947) : Colors.transparent,
            borderRadius: BorderRadius.circular(40),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: GoogleFonts.nunitoSans(
              fontSize: 16.sp,
              height: 1,
              fontWeight: FontWeight.w400,
              color:
                  selected ? const Color(0xFFFFFFFF) : const Color(0xff1F6947),
            ),
          ),
        ),
      ),
    );
  }
}
