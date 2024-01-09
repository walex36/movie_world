import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_movies/lib_movies.dart';

class GetMovieUsecase implements UseCase<Movie, ParamsGetMovie> {
  final IMoviesRepository _repository;

  GetMovieUsecase({
    required IMoviesRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<IFailure, Movie>> call(ParamsGetMovie params) {
    return _repository.getMovie(idMovie: params.idMovie);
  }
}

class ParamsGetMovie {
  final int idMovie;

  ParamsGetMovie({
    required int idMovieParam,
  }) : idMovie = idMovieParam;
}
