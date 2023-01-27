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
        TmdbConst.creditsMovieById(idMovie: idMovie),
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

  @override
  Future<List<WatchCountryModel>> getWatch({required int idMovie}) async {
    try {
      final response = await _client.get(
        TmdbConst.watchMovie(idMovie: idMovie),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody =
            Map<String, dynamic>.from(response.data['results']);

        List<WatchCountryModel> listWatch = [];

        responseBody.forEach((key, value) {
          listWatch.add(WatchCountryModel.fromMap(key, value));
        });

        return listWatch;
      }
      throw ServerException();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<GenreModel>> getGenresMovies() async {
    try {
      final response = await _client.get(
        TmdbConst.genreMovie(),
      );

      if (response.statusCode == 200) {
        List<Map<String, dynamic>> responseBody =
            List<Map<String, dynamic>>.from(response.data['genres']);

        return List<GenreModel>.from(responseBody.map(GenreModel.fromMap));
      }
      throw ServerException();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getMoviesByGenre({
    required int idGenre,
    required int page,
  }) async {
    try {
      final response = await _client.get(
        TmdbConst.moviesByGenre(
          idGenre: idGenre,
          page: page,
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
}
