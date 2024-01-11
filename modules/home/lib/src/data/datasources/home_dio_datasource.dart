import 'package:home/src/data/data.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:movies/movies.dart';
import 'package:series/series.dart';

class HomeDioDatasource implements IHomeRemoteDatasource {
  final Dio _client;

  HomeDioDatasource({required Dio client}) : _client = client;

  @override
  Future<(List<SerieModel>, List<MovieModel>)> getTrending(
      {required int page}) async {
    try {
      final response = await _client.get(
        TmdbConst.trending(page: page),
      );

      if (response.statusCode == 200) {
        List<Map<String, dynamic>> responseBody =
            List<Map<String, dynamic>>.from(response.data['results']);

        List<SerieModel> series = [];
        List<MovieModel> movies = [];

        for (var item in responseBody) {
          if (item['media_type'] == 'tv') {
            series.add(SerieModel.fromMap(item));
          } else {
            movies.add(MovieModel.fromMap(item));
          }
        }

        return (series, movies);
      }
      throw ServerException();
    } catch (e) {
      throw ServerException();
    }
  }
}
