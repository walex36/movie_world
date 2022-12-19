import 'package:dartz/dartz.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_movies/lib_movies.dart';

class GetWatchUsecase implements UseCase<List<WatchCountry>, ParamsGetWatch> {
  final IMoviesRepository _repository;

  GetWatchUsecase({
    required IMoviesRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<IFailure, List<WatchCountry>>> call(ParamsGetWatch params) {
    return _repository.getWatch(idMovie: params.idMovie);
  }
}

class ParamsGetWatch {
  final int idMovie;

  ParamsGetWatch({required this.idMovie});
}
