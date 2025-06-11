import 'package:bloc/bloc.dart';
import 'package:qalam_app/feature/new_and_media/models/new_and_media_model.dart';
import 'package:qalam_app/main.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

part 'new_and_media_state.dart';

class NewAndMediaCubit extends Cubit<NewAndMediaState> {
  NewAndMediaCubit() : super(const NewAndMediaState(model: []));
  void loadVideo(String videoUrl) {
    final videoId = YoutubePlayer.convertUrlToId(videoUrl);
    if (videoId == null) return;
    state.controller?.pause();
    state.controller?.dispose();
    final controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(autoPlay: true, mute: false),
    );

    emit(NewAndMediaState(
      model: state.model,
      controller: controller,
      playingVideoUrl: videoUrl,
    ));
  }

  void stop() {
    state.controller?.pause();
    state.controller?.dispose();
    emit(NewAndMediaState(model: state.model));
  }

  @override
  Future<void> close() {
    state.controller?.dispose();
    return super.close();
  }

  Future<void> fetchNews() async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final snapshot = await firestore.collection('NEWS').get();
      final events = snapshot.docs
          .map((doc) => NewsModel.fromMap(doc.id, doc.data()))
          .toList();
      emit(state.copyWith(model: events, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
