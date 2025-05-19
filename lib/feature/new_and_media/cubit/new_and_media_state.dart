part of 'new_and_media_cubit.dart';

abstract class NewAndMediaState extends Equatable {
  const NewAndMediaState({
    this.model,
    this.controller,
    this.playingVideoUrl,
  });

  final List<NewAndMediaModel>? model;
  final YoutubePlayerController? controller;
  final String? playingVideoUrl;

  NewAndMediaState copyWith({
    List<NewAndMediaModel>? model,
    YoutubePlayerController? controller,
    String? playingVideoUrl,
  });

  @override
  List<Object?> get props => [model, controller, playingVideoUrl];
}

final class NewAndMediaInitial extends NewAndMediaState {
  NewAndMediaInitial({List<NewAndMediaModel>? model})
      : super(
            model: model ??
                [
                  NewAndMediaModel(
                      title:
                          "Top 3 text editors for coding and programming - Coding Academy",
                      videoUrl: "https://youtu.be/Twot1tWcmEw?t=115"),
                  NewAndMediaModel(
                      title: "Learn JSON in 10 Minutes",
                      videoUrl: "https://www.youtube.com/watch?v=iiADhChRriM"),
                  NewAndMediaModel(
                      title: "Learn SQL In 60 Minutes",
                      videoUrl: "https://www.youtube.com/watch?v=p3qvj9hO_Bo"),
                  NewAndMediaModel(
                      title:
                          "Do THIS instead of watching endless tutorials - how I’d learn SQL FAST still in 2025",
                      videoUrl: "https://www.youtube.com/watch?v=ITwW825L4zg")
                ]);

  @override
  NewAndMediaState copyWith({
    List<NewAndMediaModel>? model,
    YoutubePlayerController? controller,
    String? playingVideoUrl,
  }) {
    return NewAndMediaInitial(model: model ?? this.model);
  }
}

final class NewAndMediaPlaying extends NewAndMediaState {
  const NewAndMediaPlaying({
    List<NewAndMediaModel>? model,
    required YoutubePlayerController controller,
    required String playingVideoUrl,
  }) : super(
          model: model,
          controller: controller,
          playingVideoUrl: playingVideoUrl,
        );

  @override
  NewAndMediaState copyWith({
    List<NewAndMediaModel>? model,
    YoutubePlayerController? controller,
    String? playingVideoUrl,
  }) {
    return NewAndMediaPlaying(
      model: model ?? this.model,
      controller: controller ?? this.controller!,
      playingVideoUrl: playingVideoUrl ?? this.playingVideoUrl!,
    );
  }
}
