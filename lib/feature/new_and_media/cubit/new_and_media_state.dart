part of 'new_and_media_cubit.dart';

class NewAndMediaState {
  const NewAndMediaState({
    this.model,
    this.controller,
    this.playingVideoUrl,
    this.error,
    this.isLoading = false,
  });

  final List<NewsModel>? model;
  final YoutubePlayerController? controller;
  final String? playingVideoUrl;
  final bool? isLoading;
  final String? error;

  NewAndMediaState copyWith({
    List<NewsModel>? model,
    YoutubePlayerController? controller,
    String? playingVideoUrl,
    bool? isLoading,
    String? error,
  }) {
    return NewAndMediaState(
      model: model ?? this.model,
      controller: controller ?? this.controller,
      playingVideoUrl: playingVideoUrl ?? this.playingVideoUrl,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

// final class NewAndMediaInitial extends NewAndMediaState {
//   const NewAndMediaInitial({List<NewsModel>? model}) : super();
//
//   @override
//   NewAndMediaState copyWith({
//     List<NewsModel>? model,
//     YoutubePlayerController? controller,
//     String? playingVideoUrl,
//     bool? isLoading,
//     String? error,
//   }) {
//     return NewAndMediaInitial(model: model ?? this.model);
//   }
// }
//
// final class NewAndMediaPlaying extends NewAndMediaState {
//   const NewAndMediaPlaying({
//     List<NewsModel>? model,
//     required YoutubePlayerController controller,
//     required String playingVideoUrl,
//   }) : super(
//           model: model,
//           controller: controller,
//           playingVideoUrl: playingVideoUrl,
//         );
//
//   @override
//   NewAndMediaState copyWith({
//     List<NewsModel>? model,
//     YoutubePlayerController? controller,
//     String? playingVideoUrl,
//     bool? isLoading,
//     String? error,
//   }) {
//     return NewAndMediaPlaying(
//       model: model ?? this.model,
//       controller: controller ?? this.controller!,
//       playingVideoUrl: playingVideoUrl ?? this.playingVideoUrl!,
//     );
//   }
// }
