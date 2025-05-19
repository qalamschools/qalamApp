import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:qalam_app/core/constants/app_image.dart';
import 'package:qalam_app/core/utils/common_utils.dart';
import 'package:qalam_app/feature/common/cubit/sociallinks_cubit.dart';

class SocialIconWidget extends StatelessWidget {
  const SocialIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SocialLinksCubit, SocialLinksState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const CircularProgressIndicator();
        }

        if (state.error != null) {
          return Text('Error loading links: ${state.error}');
        }

        final links = state.links;

        final icons = [
          _SocialItem(AppImage.facebookIcon, links['facebook']),
          _SocialItem(AppImage.whatsAppIcon, links['whatsapp']),
          _SocialItem(AppImage.twitterIcon, links['twitter']),
          _SocialItem(AppImage.mailIcon, links['email']),
          _SocialItem(AppImage.youtubeIcon, links['youtube']),
        ];

        return Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 48.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: icons
                  .where((i) => i.url?.isNotEmpty == true)
                  .map((i) => _SocialIcon(i))
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}

class _SocialItem {
  final String iconPath;
  final String? url;

  const _SocialItem(this.iconPath, this.url);
}

class _SocialIcon extends StatelessWidget {
  final _SocialItem item;

  const _SocialIcon(this.item);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (item.url != null) {
          CommonUtils.urlLauncher(url: item.url ?? "");
        }
      },
      child: SvgPicture.asset(item.iconPath),
    );
  }
}
