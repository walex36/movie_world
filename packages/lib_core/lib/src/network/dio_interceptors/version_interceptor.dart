import 'package:lib_dependencies/lib_dependencies.dart';

class VersionInterceptor extends Interceptor {
  final String version;

  VersionInterceptor({required this.version});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final Map<String, dynamic> versionHeader = {
      'versaoApp': version,
    };

    options.headers.addAll(versionHeader);

    return super.onRequest(options, handler);
  }
}
