import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:series/src/domain/domain.dart';
import 'package:lib_core/lib_core.dart';

class GetGenresSeriesUsecase implements UseCase<List<Genre>, NoParams> {
  final ISeriesRepository _repository;

  GetGenresSeriesUsecase({required ISeriesRepository repository})
      : _repository = repository;

  @override
  Future<Either<IFailure, List<Genre>>> call(NoParams params) {
    return _repository.getGenresSeries();
  }
}
