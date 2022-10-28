import 'package:lib_movies/src/data/models/actor_model.dart';
import 'package:lib_movies/src/data/models/movie_model.dart';

abstract class IMoviesRemoteDatasource {
  Future<List<MovieModel>> getMoviesPopular({
    required int page,
  });

  Future<MovieModel> getMovieById({required int idMovie});

  Future<List<MovieModel>> getMoviesTrending({
    required int page,
    required bool dayAndNotWeek,
  });

  Future<List<ActorModel>> getCredits({required int idMovie});
}
