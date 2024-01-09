import 'package:lib_movies/lib_movies.dart';
import 'package:lib_core/lib_core.dart';
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
  Future<Either<MovieFailure, List<Movie>>> getMoviesPopular({
    required int page,
  }) async {
    try {
      final List<MovieModel> result =
          await _moviesRemoteDatasource.getMoviesPopular(page: page);

      return Right(List<Movie>.from(result.map(
        (movie) => movie.toEntity(),
      )));
    } catch (e) {
      return const Left(MovieFailure());
    }
  }

  @override
  Future<Either<MovieFailure, List<Movie>>> getMoviesTrending({
    required int page,
    required bool dayAndNotWeek,
  }) async {
    try {
      final List<MovieModel> result =
          await _moviesRemoteDatasource.getMoviesTrending(
        page: page,
        dayAndNotWeek: dayAndNotWeek,
      );

      return Right(List<Movie>.from(result.map(
        (movie) => movie.toEntity(),
      )));
    } catch (e) {
      return const Left(MovieFailure());
    }
  }

  @override
  Future<Either<MovieFailure, List<Actor>>> getCredits(
      {required int idMovie}) async {
    try {
      final List<ActorModel> result = await _moviesRemoteDatasource.getCredits(
        idMovie: idMovie,
      );

      return Right(List<Actor>.from(result.map(
        (actor) => actor.toEntity(),
      )));
    } catch (e) {
      return const Left(MovieFailure());
    }
  }

  @override
  Future<Either<MovieFailure, List<WatchCountry>>> getWatch(
      {required int idMovie}) async {
    try {
      final List<WatchCountryModel> result =
          await _moviesRemoteDatasource.getWatch(
        idMovie: idMovie,
      );

      return Right(List<WatchCountry>.from(result.map(
        (watch) => watch.toEntity(),
      )));
    } catch (e) {
      return const Left(MovieFailure());
    }
  }

  @override
  Future<Either<MovieFailure, List<Genre>>> getGenresMovies() async {
    try {
      final List<GenreModel> result =
          await _moviesRemoteDatasource.getGenresMovies();

      return Right(List<Genre>.from(result.map(
        (genre) => genre.toEntity(),
      )));
    } catch (e) {
      return const Left(MovieFailure());
    }
  }

  @override
  Future<Either<MovieFailure, List<Movie>>> getMoviesByGenre({
    required int idGenre,
    required int page,
  }) async {
    try {
      final List<MovieModel> result =
          await _moviesRemoteDatasource.getMoviesByGenre(
        idGenre: idGenre,
        page: page,
      );

      return Right(List<Movie>.from(result.map(
        (movie) => movie.toEntity(),
      )));
    } catch (e) {
      return const Left(MovieFailure());
    }
  }
}
