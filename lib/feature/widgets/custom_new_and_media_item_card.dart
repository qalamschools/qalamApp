import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qalam_app/feature/new_and_media/cubit/new_and_media_cubit.dart';
import 'package:qalam_app/feature/new_and_media/models/new_and_media_model.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomNewAndMediaItemCard extends StatelessWidget {
  final NewsModel? newAndMediaModel;

  const CustomNewAndMediaItemCard({super.key, required this.newAndMediaModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewAndMediaCubit, NewAndMediaState>(
      buildWhen: (prev, curr) =>
          prev.playingVideoUrl != curr.playingVideoUrl ||
          prev.model != curr.model,
      builder: (context, state) {
        final videoId =
            YoutubePlayer.convertUrlToId(newAndMediaModel?.url ?? '');
        final isPlaying = state.playingVideoUrl == newAndMediaModel?.url;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              newAndMediaModel?.title ?? "",
              style: GoogleFonts.playfairDisplay(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 12.h),
            SizedBox(
              height: 221.h,
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                color: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: isPlaying && state.controller != null
                      ? YoutubePlayerBuilder(
                          player: YoutubePlayer(
                            controller: state.controller!,
                            showVideoProgressIndicator: true,
                            progressIndicatorColor: Colors.red,
                          ),
                          builder: (context, player) => player,
                        )
                      : GestureDetector(
                          onTap: () {
                            context
                                .read<NewAndMediaCubit>()
                                .loadVideo(newAndMediaModel?.url ?? "");
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              if (videoId != null)
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                          'https://img.youtube.com/vi/$videoId/0.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              SvgPicture.asset("assets/icons/youtube_icon.svg"),
                            ],
                          ),
                        ),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            GestureDetector(
              onTap: () async {
                final Uri url = Uri.parse(newAndMediaModel?.url ?? "");
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                }
              },
              child: Row(
                children: [
                  Text(
                    "Watch on YouTube",
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFFA91936),
                    ),
                  ),
                  SizedBox(width: 12.h),
                  SvgPicture.asset("assets/icons/forward_icon.svg"),
                ],
              ),
            ),
            SizedBox(height: 20.h),
          ],
        );
      },
    );
  }
}
