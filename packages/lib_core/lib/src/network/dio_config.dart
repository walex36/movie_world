import 'package:lib_core/src/network/dio_interceptors/device_id_interceptor.dart';
import 'package:lib_core/src/network/dio_interceptors/version_interceptor.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_endpoint/lib_endpoint.dart';

class DioConfig {
  final Dio _client;
  final Endpoint _endpointConfig;

  DeviceIdInterceptor? _deviceIdInterceptor;
  VersionInterceptor? _versionInterceptor;

  DioConfig({
    required Dio client,
    required Endpoint endpointConfig,
  })  : _client = client,
        _endpointConfig = endpointConfig;

  void init(){
    final BaseOptions baseOptions = BaseOptions(
      baseUrl: _endpointConfig.baseUrl,
    );
    _client.options = baseOptions;
  }

  void clearInterceptors(){
    _client.interceptors.clear();
  }

  void refreshDeviceIdInterceptor({required String deviceId}){
    if (_deviceIdInterceptor == null) {
      _deviceIdInterceptor = DeviceIdInterceptor(deviceId: deviceId);
      _client.interceptors.add(_deviceIdInterceptor!);
    } else {
      _client.interceptors.remove(_deviceIdInterceptor);
      _deviceIdInterceptor = DeviceIdInterceptor(deviceId: deviceId);
      _client.interceptors.add(_deviceIdInterceptor!);
    }
  }

  void refreshVersionInterceptor({required String version}) {
    if (_versionInterceptor == null) {
      _versionInterceptor = VersionInterceptor(version: version);
      _client.interceptors.add(_versionInterceptor!);
    } else {
      _client.interceptors.remove(_versionInterceptor);
      _versionInterceptor = VersionInterceptor(version: version);
      _client.interceptors.add(_versionInterceptor!);
    }
  }
}
