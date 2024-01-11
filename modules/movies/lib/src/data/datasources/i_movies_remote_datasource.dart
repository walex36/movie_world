import 'package:lib_core/lib_core.dart';
import 'package:movies/src/data/data.dart';

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

  Future<List<WatchCountryModel>> getWatch({required int idMovie});

  Future<List<GenreModel>> getGenresMovies();

  Future<List<MovieModel>> getMoviesByGenre({
    required int idGenre,
    required int page,
  });
}
