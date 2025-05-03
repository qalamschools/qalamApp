import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CurriculumSection extends StatelessWidget {
  final int number;
  final String title;
  final String description;
  final String imagePath;
  final bool isLeft;

  const CurriculumSection({
    super.key,
    required this.number,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.isLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (isLeft) ...{
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              imagePath,
                              fit: BoxFit.contain,
                              width: 267,
                            ),
                          ),
                        ],
                      ),
                      _buildTextContent(isLeft: isLeft),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  )
                } else ...{
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              imagePath,
                              fit: BoxFit.contain,
                              width: 267,
                            ),
                          ),
                        ],
                      ),
                      _buildTextContent(isLeft: isLeft),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  )),
                },
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildTextContent({required bool isLeft}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(height: 20),
        SizedBox(
          width: 267,
          child: Text(
            title,
            style: GoogleFonts.nunitoSans(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1B5E20),
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: 267,
          child: Text(
            description,
            style: GoogleFonts.nunitoSans(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF333333),
            ),
          ),
        ),
      ],
    );
  }
}
