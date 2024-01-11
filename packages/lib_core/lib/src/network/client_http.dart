import 'package:lib_dependencies/lib_dependencies.dart';

class ClientHttp {
  final Dio _client = Dio()
    ..options = BaseOptions(
      baseUrl: "https://api.themoviedb.org/3/",
    );

  Dio get client => _client;
}
