import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CurriculumTimelineWidget extends StatelessWidget {
  final List<CurriculumSectionData> sections;

  const CurriculumTimelineWidget({
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
          // This makes the container adapt to content height
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (isLeft) ...[
                // Left curved border
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
                // Main content container
                Expanded(
                  child: Container(
                    constraints: const BoxConstraints(
                      minHeight: 500, // Minimum height but can expand
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
                    child: _buildSectionContent(section),
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
                    child: _buildSectionContent(section),
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
        ),

        // Positioned badge
        Positioned(
          top: 180,
          left: isLeft ? 42 : null,
          right: isLeft ? null : 42,
          child: _buildBadge(sectionNumber),
        ),
      ],
    );
  }

  Widget _buildSectionContent(CurriculumSectionData section) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (section.imagePath != null) ...{
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              section.imagePath ?? "",
              fit: BoxFit.cover,
              width: 267,
              height: 267,
            ),
          ),
          const SizedBox(height: 16),
        },
        Text(
          section.title,
          style: GoogleFonts.nunitoSans(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1B5E20),
          ),
        ),
        const SizedBox(height: 16),
        Text(section.description,
            style: GoogleFonts.nunitoSans(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF333333),
            )),
      ],
    );
  }

  Widget _buildBadge(int number) {
    bool isOdd = number % 2 == 1;
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          isOdd
              ? "assets/icons/red_shield.svg"
              : "assets/icons/green_shield.svg",
        ),
        Text(
          number.toString(),
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
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

class CurriculumSectionData {
  final String title;
  final String description;
  String? imagePath;

  CurriculumSectionData({
    required this.title,
    required this.description,
    this.imagePath,
  });
}
