import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:qalam_app/core/commons/data/repository/remote_config_repo.dart';
import 'package:qalam_app/core/constants/remote_config_constants.dart';

part 'sociallinks_state.dart';

class SocialLinksCubit extends Cubit<SocialLinksState> {
  final _remoteConfigRepository = GetIt.I<RemoteConfigRepository>();

  SocialLinksCubit() : super(SocialLinksState.initial());

  Future<void> loadSocialLinks() async {
    try {
      emit(state.copyWith(isLoading: true));
      final links = {
        'facebook': _remoteConfigRepository
            .getString(RemoteConfigConstants.facebookUrl),
        'whatsapp': _remoteConfigRepository
            .getString(RemoteConfigConstants.mobileNumber),
        'twitter':
            _remoteConfigRepository.getString(RemoteConfigConstants.twitter),
        'email': _remoteConfigRepository.getString(RemoteConfigConstants.email),
        'youtube':
            _remoteConfigRepository.getString(RemoteConfigConstants.youtube),
      };

      emit(SocialLinksState(links: links, isLoading: false));
    } catch (e) {
      emit(SocialLinksState(
          links: const {}, isLoading: false, error: e.toString()));
    }
  }
}
