import 'package:qalam_app/feature/contact_us/data/service/remote_config_service.dart';

class RemoteConfigRepository {
  final RemoteConfigService _service;

  RemoteConfigRepository(this._service);

  Future<void> initializeRemoteConfig() async {
    await _service.initialize();
  }

  String resonForContacting() =>
      _service.getString('reason_for_contacting_dropdown');

  String getJson(String key) => _service.getString(key);
}
