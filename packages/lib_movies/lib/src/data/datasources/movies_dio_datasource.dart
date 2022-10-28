import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_movies/src/data/datasources/i_movies_remote_datasource.dart';
import 'package:lib_movies/src/data/models/actor_model.dart';
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
        TmdbConst.movieById(idMovie: idMovie),
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
  Future<List<MovieModel>> getMoviesPopular({required int page}) async {
    try {
      final response = await _client.get(
        TmdbConst.moviesPopular(page: page),
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

  @override
  Future<List<MovieModel>> getMoviesTrending({
    required int page,
    required bool dayAndNotWeek,
  }) async {
    try {
      final response = await _client.get(
        TmdbConst.moviesTrending(
          page: page,
          time: dayAndNotWeek ? 'day' : 'week',
        ),
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

  @override
  Future<List<ActorModel>> getCredits({required int idMovie}) async {
    try {
      final response = await _client.get(
        TmdbConst.creditsById(idMovie: idMovie),
      );

      if (response.statusCode == 200) {
        List<Map<String, dynamic>> responseBody =
            List<Map<String, dynamic>>.from(response.data['cast']);

        return List<ActorModel>.from(responseBody.map(ActorModel.fromMap));
      }
      throw ServerException();
    } catch (e) {
      throw ServerException();
    }
  }
}
