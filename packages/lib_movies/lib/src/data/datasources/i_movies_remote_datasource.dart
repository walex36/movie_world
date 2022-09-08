import 'package:lib_movies/src/data/models/movie_model.dart';

abstract class IMoviesRemoteDatasource {
  Future<List<MovieModel>> getMoviesPopular();

  Future<MovieModel> getMovieById({required int idMovie});
}
