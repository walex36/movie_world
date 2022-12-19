import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_movies/src/domain/entities/movie_entity.dart';

abstract class IMoviesRepository {
  Future<Either<MovieFailure, Movie>> getMovie({required int idMovie});

  Future<Either<MovieFailure, List<Movie>>> getMoviesPopular({
    required int page,
  });

  Future<Either<MovieFailure, List<Movie>>> getMoviesTrending({
    required int page,
    required bool dayAndNotWeek,
  });

  Future<Either<MovieFailure, List<Actor>>> getCredits({required int idMovie});

  Future<Either<MovieFailure, List<WatchCountry>>> getWatch({
    required int idMovie,
  });
}
