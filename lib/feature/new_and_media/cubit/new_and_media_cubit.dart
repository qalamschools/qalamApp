import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qalam_app/feature/new_and_media/models/new_and_media_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

part 'new_and_media_state.dart';

class NewAndMediaCubit extends Cubit<NewAndMediaState> {
  NewAndMediaCubit() : super(NewAndMediaInitial());

  void loadVideo(String videoUrl) {
    final videoId = YoutubePlayer.convertUrlToId(videoUrl);
    if (videoId == null) return;

    // Dispose previous controller
    state.controller?.pause();
    state.controller?.dispose();

    // Create new controller
    final controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(autoPlay: true, mute: false),
    );

    emit(NewAndMediaPlaying(
      model: state.model,
      controller: controller,
      playingVideoUrl: videoUrl,
    ));
  }

  void stop() {
    state.controller?.pause();
    state.controller?.dispose();
    emit(NewAndMediaInitial(model: state.model));
  }

  @override
  Future<void> close() {
    state.controller?.dispose();
    return super.close();
  }
}
