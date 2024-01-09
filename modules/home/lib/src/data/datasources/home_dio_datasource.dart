import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_home/src/data/datasources/i_home_remote_datasource.dart';

class HomeDioDatasource implements IHomeRemoteDatasource {
  final Dio _client;

  HomeDioDatasource({required Dio client}) : _client = client;

  @override
  Future<List<Map<String, dynamic>>> getTrending({required int page}) async {
    try {
      final response = await _client.get(
        TmdbConst.trending(page: page),
      );

      if (response.statusCode == 200) {
        List<Map<String, dynamic>> responseBody =
            List<Map<String, dynamic>>.from(response.data['results']);

        return responseBody;
      }
      throw ServerException();
    } catch (e) {
      throw ServerException();
    }
  }
}
