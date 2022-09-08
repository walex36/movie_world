import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_movies/src/data/datasources/i_movies_remote_datasource.dart';
import 'package:lib_movies/src/data/models/movie_model.dart';

class MoviesDioDatasource implements IMoviesRemoteDatasource {
  final Dio _client;

  MoviesDioDatasource({
    required Dio client,
  }) : _client = client;

  @override
  Future<MovieModel> getMovieById({
    required int idMovie,
  }) async {
    try {
      final response = await _client.get(
        TmdbConst.movieById(idMovie),
      );

      if (response.statusCode == 200) {
        return MovieModel.fromMap(response.data);
      }
      throw ServerException();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getMoviesPopular() async {
    try {
      final response = await _client.get(
        TmdbConst.moviesPopular,
      );

      if (response.statusCode == 200) {
        List<Map<String, dynamic>> responseBody =
            List<Map<String, dynamic>>.from(response.data['results']);

        return List<MovieModel>.from(responseBody.map(MovieModel.fromMap));
      }
      throw ServerException();
    } catch (e) {
      throw ServerException();
    }
  }
}
