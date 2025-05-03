import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomNewAndMediaItemCard extends StatefulWidget {
  const CustomNewAndMediaItemCard(
      {super.key, this.title = "", this.videoUrl = ""});

  final String videoUrl;
  final String title;

  @override
  State<CustomNewAndMediaItemCard> createState() =>
      _CustomNewAndMediaItemCardState();
}

class _CustomNewAndMediaItemCardState extends State<CustomNewAndMediaItemCard> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl) ?? "",
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Text(widget.title,
    //         style: GoogleFonts.playfairDisplay(
    //           fontSize: 20.sp,
    //           fontWeight: FontWeight.w700,
    //           color: const Color(0xFF000000),
    //         )),
    //     SizedBox(
    //       height: 12.h,
    //     ),
    //     SizedBox(
    //         height: 221.h,
    //         width: 100.sw,
    //         child: Card(
    //           shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(16.r)),
    //           elevation: 1,
    //           shadowColor: Colors.white,
    //           color: Colors.white,
    //           surfaceTintColor: Colors.white,
    //           child: ClipRRect(
    //             borderRadius: BorderRadius.circular(12),
    //             child: YoutubePlayer(
    //               controller: _controller,
    //               showVideoProgressIndicator: true,
    //               progressIndicatorColor: Colors.blueAccent,
    //             ),
    //           ),
    //         )),
    //     SizedBox(
    //       height: 12.h,
    //     ),
    //     Row(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         Text("Watch on youtube",
    //             style: GoogleFonts.inter(
    //               fontSize: 16.sp,
    //               fontWeight: FontWeight.w400,
    //               color: const Color(0xFFA91936),
    //             )),
    //         SizedBox(
    //           width: 12.h,
    //         ),
    //         SvgPicture.asset("assets/icons/forward_icon.svg")
    //       ],
    //     ),
    //     SizedBox(
    //       height: 20.h,
    //     ),
    //   ],
    // );

    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
      ),
      builder: (context, player) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title,
              style: GoogleFonts.playfairDisplay(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF000000),
              )),
          SizedBox(height: 12.h),
          SizedBox(
            height: 221.h,
            width: 100.sw,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              elevation: 1,
              shadowColor: Colors.white,
              color: Colors.white,
              surfaceTintColor: Colors.white,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: player,
              ),
            ),
          ),
          SizedBox(height: 12.h),
          GestureDetector(
            onTap: () async {
              final Uri url = Uri.parse(widget.videoUrl);
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              }
            },
            child: Row(
              children: [
                Text("Watch on youtube",
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFFA91936),
                    )),
                SizedBox(width: 12.h),
                SvgPicture.asset("assets/icons/forward_icon.svg"),
              ],
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
