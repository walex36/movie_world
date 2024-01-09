import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:series/src/domain/domain.dart';
import 'package:lib_core/lib_core.dart';

class GetSeriesTrendingUsecase
    implements UseCase<List<Serie>, ParamsGetSeriesTrending> {
  final ISeriesRepository _repository;

  GetSeriesTrendingUsecase({
    required ISeriesRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<IFailure, List<Serie>>> call(ParamsGetSeriesTrending params) {
    return _repository.getSeriesTrending(
      page: params.page,
      dayAndNotWeek: params.dayAndNotWeek,
    );
  }
}

class ParamsGetSeriesTrending {
  final int page;
  final bool dayAndNotWeek;

  ParamsGetSeriesTrending({required this.page, required this.dayAndNotWeek});
}
