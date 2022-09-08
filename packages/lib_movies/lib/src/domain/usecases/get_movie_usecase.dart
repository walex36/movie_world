import 'package:dartz/dartz.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_movies/src/domain/entities/movie_entity.dart';
import 'package:lib_movies/src/domain/repositories/i_movies_repository.dart';

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
