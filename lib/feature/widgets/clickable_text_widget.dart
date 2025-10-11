import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qalam_app/core/utils/common_utils.dart';

class ClickableText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const ClickableText({super.key, required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: style ??
            GoogleFonts.nunitoSans(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
        children: _buildSpans(text),
      ),
    );
  }

  List<TextSpan> _buildSpans(String text) {
    final List<TextSpan> spans = [];

    // Combined regex for emails, phones, and URLs
    final RegExp exp = RegExp(
      r'(https?://[^\s]+|www\.[^\s]+|\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b|(?:\+?\d{1,3}[-.\s]?)?(?:\(?\d{2,4}\)?[-.\s]?)?\d{3,4}[-.\s]?\d{3,4})',
      caseSensitive: false,
    );

    int start = 0;
    final matches = exp.allMatches(text);

    for (final match in matches) {
      // Add non-clickable text before the match
      if (match.start > start) {
        spans.add(TextSpan(text: text.substring(start, match.start)));
      }

      final matchText = match.group(0)!;

      if (_isEmail(matchText)) {
        spans.add(_buildEmailSpan(matchText));
      } else if (_isUrl(matchText)) {
        spans.add(_buildUrlSpan(matchText));
      } else if (_isPhoneNumber(matchText)) {
        spans.add(_buildPhoneSpan(matchText));
      }

      start = match.end;
    }

    // Add remaining text
    if (start < text.length) {
      spans.add(TextSpan(text: text.substring(start)));
    }

    return spans;
  }

  bool _isEmail(String text) {
    return text.contains('@') && text.contains('.');
  }

  bool _isUrl(String text) {
    return text.startsWith('http://') ||
        text.startsWith('https://') ||
        text.startsWith('www.');
  }

  bool _isPhoneNumber(String text) {
    return RegExp(r'^\+?\d').hasMatch(text);
  }

  TextSpan _buildEmailSpan(String email) {
    return TextSpan(
      text: email,
      style: GoogleFonts.nunitoSans(
        decoration: TextDecoration.underline,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: Colors.blue,
      ),
      recognizer: TapGestureRecognizer()
        ..onTap = () async {
          await CommonUtils.openMailApp(email: email);
        },
    );
  }

  TextSpan _buildUrlSpan(String url) {
    return TextSpan(
      text: url,
      style: GoogleFonts.nunitoSans(
        decoration: TextDecoration.underline,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: Colors.blue,
      ),
      recognizer: TapGestureRecognizer()
        ..onTap = () async {
          // Add protocol if missing
          String fullUrl = url;
          if (!url.startsWith('http://') && !url.startsWith('https://')) {
            fullUrl = 'https://$url';
          }
          await CommonUtils.urlLauncher(url: fullUrl);
        },
    );
  }

  TextSpan _buildPhoneSpan(String phone) {
    return TextSpan(
      text: phone,
      style: GoogleFonts.nunitoSans(
        decoration: TextDecoration.underline,
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
      recognizer: TapGestureRecognizer()
        ..onTap = () async {
          await CommonUtils.openDialer(number: phone);
        },
    );
  }
}
