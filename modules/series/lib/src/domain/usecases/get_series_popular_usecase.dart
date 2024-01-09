import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:series/src/domain/domain.dart';
import 'package:lib_core/lib_core.dart';

class GetSeriesPopularUsecase
    implements UseCase<List<Serie>, ParamsGetSeriesPopular> {
  final ISeriesRepository _repository;

  GetSeriesPopularUsecase({
    required ISeriesRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<IFailure, List<Serie>>> call(ParamsGetSeriesPopular params) {
    return _repository.getSeriesPopular(page: params.page);
  }
}

class ParamsGetSeriesPopular {
  final int page;

  ParamsGetSeriesPopular({required this.page});
}
