import 'package:lib_dependencies/lib_dependencies.dart';

class ClientHttp {
  final Dio _client = Dio();

  Dio get client => _client;

  void init() {
    _client.options = BaseOptions(
      baseUrl: "https://api.themoviedb.org/3/",
    );
  }
}
