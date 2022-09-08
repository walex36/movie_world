import 'package:dartz/dartz.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_movies/lib_movies.dart';
import 'package:lib_movies/src/domain/repositories/i_movies_repository.dart';

class GetMoviesPopularUsecase implements UseCase<List<Movie>, NoParams> {
  final IMoviesRepository _repository;

  GetMoviesPopularUsecase({
    required IMoviesRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<IFailure, List<Movie>>> call(NoParams params) {
    return _repository.getMoviesPopular();
  }
}
