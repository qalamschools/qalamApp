import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qalam_app/core/constants/app_image.dart';
import 'package:qalam_app/core/utils/common_utils.dart';

class SocialIconWidget extends StatelessWidget {
  const SocialIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 48.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                CommonUtils.urlLauncher(url: "https://www.facebook.com");
              },
              child: SvgPicture.asset(AppImage.facebookIcon),
            ),
            GestureDetector(
              onTap: () {
                CommonUtils.urlLauncher(url: "https://www.whatsapp.com");
              },
              child: SvgPicture.asset(AppImage.whatsAppIcon),
            ),
            GestureDetector(
              onTap: () {
                CommonUtils.urlLauncher(url: "https://www.twitter.com");
              },
              child: SvgPicture.asset(AppImage.twitterIcon),
            ),
            GestureDetector(
              onTap: () {
                CommonUtils.urlLauncher(url: "mailto:example@gmail.com");
              },
              child: SvgPicture.asset(AppImage.mailIcon),
            ),
            GestureDetector(
              onTap: () {
                CommonUtils.urlLauncher(url: "https://www.youtube.com");
              },
              child: SvgPicture.asset(AppImage.youtubeIcon),
            ),
          ],
        ),
      ),
    );
  }
}
