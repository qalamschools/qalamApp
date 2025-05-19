import 'package:qalam_app/core/commons/data/service/remote_config_service.dart';

class RemoteConfigRepository {
  final RemoteConfigService _service;

  RemoteConfigRepository(this._service);

  Future<void> initializeRemoteConfig() async {
    await _service.initialize();
  }

  String getString(String key) => _service.getString(key);

  String getJson(String key) => _service.getString(key);

  int getInt(String key) => _service.getInt(key);
}
