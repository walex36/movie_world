import 'package:dartz/dartz.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_series/lib_series.dart';
import 'package:lib_series/src/domain/repositories/i_series_repository.dart';

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
