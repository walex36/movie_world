import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_core/lib_core.dart';
import 'package:movies/src/domain/domain.dart';

class GetGenresMoviesUsecase implements UseCase<List<Genre>, NoParams> {
  final IMoviesRepository _repository;

  GetGenresMoviesUsecase({required IMoviesRepository repository})
      : _repository = repository;
  @override
  Future<Either<IFailure, List<Genre>>> call(NoParams params) {
    return _repository.getGenresMovies();
  }
}
