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
                      title: "Lady Gaga, Bruno Mars - Die With A Smile",
                      videoUrl: "https://youtu.be/tt9db--Dydo?t=4"),
                  NewAndMediaModel(
                      title: "JAY SEAN - RIDE IT",
                      videoUrl: "https://youtu.be/TBsKCT4rsPw"),
                  NewAndMediaModel(
                      title: "Justin Timberlake - TKO",
                      videoUrl: "https://youtu.be/FyXtoTLLcDk?t=1"),
                  NewAndMediaModel(
                      title: "Anuv Jain - HUSN",
                      videoUrl: "https://youtu.be/gJLVTKhTnog?t=1")
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
