import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qalam_app/feature/widgets/curriculam_widget_new.dart';

class AboutUsCurriculumSection extends StatelessWidget {
  final List<CurriculumSectionData> sections;

  const AboutUsCurriculumSection({
    Key? key,
    required this.sections,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...sections.asMap().entries.map((entry) {
          int index = entry.key;
          CurriculumSectionData section = entry.value;
          bool isLeft = index % 2 == 0;

          return _buildTimelineSection(
            section: section,
            isLeft: isLeft,
            sectionNumber: index + 1,
          );
        }).toList(),
      ],
    );
  }

  Widget _buildTimelineSection({
    required CurriculumSectionData section,
    required bool isLeft,
    required int sectionNumber,
  }) {
    return Stack(
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (isLeft) ...[
                Container(
                  width: 55,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(
                          width: 1, color: _getLeftBorderColor(sectionNumber)),
                      left: BorderSide(
                          width: 1, color: _getLeftBorderColor(sectionNumber)),
                      right: BorderSide(
                          width: 1, color: _getLeftBorderColor(sectionNumber)),
                    ),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(200),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    constraints: const BoxConstraints(
                      minHeight: 500,
                    ),
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 55,
                      right: 16,
                      bottom: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        top: BorderSide(
                            width: 1, color: _getMainBorderColor(isLeft)),
                        left: BorderSide(
                            width: 1, color: _getMainBorderColor(isLeft)),
                        right: BorderSide(
                            width: 1, color: _getMainBorderColor(isLeft)),
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(200),
                      ),
                    ),
                    child: _buildSectionContent(section, isLeft: true),
                  ),
                ),
              ] else ...[
                // Main content container
                Expanded(
                  child: Container(
                    constraints: const BoxConstraints(
                      minHeight: 500,
                    ),
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 16,
                      right: 55,
                      bottom: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        top: BorderSide(
                            width: 1, color: _getMainBorderColor(isLeft)),
                        left: BorderSide(
                            width: 1, color: _getMainBorderColor(isLeft)),
                        right: BorderSide(
                            width: 1, color: _getMainBorderColor(isLeft)),
                      ),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(200),
                      ),
                    ),
                    child: _buildSectionContent(section, isLeft: false),
                  ),
                ),
                // Right curved border
                Container(
                  width: 55,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(width: 1, color: Color(0xFFFFD9A4)),
                      right: BorderSide(width: 1, color: Color(0xFFFFD9A4)),
                      left: BorderSide(width: 1, color: Color(0xFFFFD9A4)),
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(200),
                    ),
                  ),
                ),
              ],
            ],
          ),
        )
      ],
    );
  }

  Widget _buildSectionContent(CurriculumSectionData section,
      {bool isLeft = false}) {
    return Column(
      crossAxisAlignment:
          isLeft ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          section.title,
          style: GoogleFonts.playfairDisplay(
            fontSize: 32.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xFFA91936),
          ),
        ),
        const SizedBox(height: 16),
        Text(section.description,
            textDirection: isLeft ? TextDirection.rtl : TextDirection.ltr,
            style: GoogleFonts.nunitoSans(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF333333),
            )),
      ],
    );
  }

  Color _getLeftBorderColor(int sectionNumber) {
    switch (sectionNumber) {
      case 1:
        return const Color(0xFFFFC4C4);
      case 3:
        return const Color(0xFFC6DDC8);
      default:
        return const Color(0xFFFFC4C4);
    }
  }

  Color _getMainBorderColor(bool isLeft) {
    return isLeft ? const Color(0xFFC6DDC8) : const Color(0xFFFFC4C4);
  }
}
