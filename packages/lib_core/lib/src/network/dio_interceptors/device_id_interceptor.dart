import 'package:lib_dependencies/lib_dependencies.dart';

class DeviceIdInterceptor extends Interceptor {
  final String deviceId;

  DeviceIdInterceptor({required this.deviceId});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final Map<String, dynamic> deviceIdHearder = {
      'hashAparelho': deviceId,
    };

    options.headers.addAll(deviceIdHearder);

    return super.onRequest(options, handler);
  }
}
