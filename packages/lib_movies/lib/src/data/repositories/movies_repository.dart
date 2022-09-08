import 'package:lib_movies/lib_movies.dart';
import 'package:lib_movies/src/data/models/movie_model.dart';
import 'package:lib_core/src/error/failures.dart';
import 'package:lib_dependencies/lib_dependencies.dart';

class MoviesRepository implements IMoviesRepository {
  final IMoviesRemoteDatasource _moviesRemoteDatasource;

  MoviesRepository({required IMoviesRemoteDatasource moviesRemoteDatasource})
      : _moviesRemoteDatasource = moviesRemoteDatasource;

  @override
  Future<Either<MovieFailure, Movie>> getMovie({required int idMovie}) async {
    try {
      final MovieModel result = await _moviesRemoteDatasource.getMovieById(
        idMovie: idMovie,
      );

      return Right(result.toEntity());
    } catch (e) {
      return const Left(MovieFailure());
    }
  }

  @override
  Future<Either<MovieFailure, List<Movie>>> getMoviesPopular() async {
    try {
      final List<MovieModel> result =
          await _moviesRemoteDatasource.getMoviesPopular();

      return Right(List<Movie>.from(result.map(
        (movie) => movie.toEntity(),
      )));
    } catch (e) {
      return const Left(MovieFailure());
    }
  }
}
