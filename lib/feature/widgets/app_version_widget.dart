import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppInfoWidget extends StatelessWidget {
  const AppInfoWidget({super.key});

  Future<String> _getVersionInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return '-Version ${packageInfo.version}-';
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _getVersionInfo(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container();
        } else if (snapshot.hasError) {
          return Container();
        } else {
          return Center(
            child: Text(
              snapshot.data ?? '',
              style: GoogleFonts.nunitoSans(
                  fontWeight: FontWeight.w400, fontSize: 16.sp),
            ),
          );
        }
      },
    );
  }
}
