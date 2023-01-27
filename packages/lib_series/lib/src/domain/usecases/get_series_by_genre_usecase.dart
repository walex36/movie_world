import 'package:dartz/dartz.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_series/lib_series.dart';

class GetSeriesByGenreUsecase
    implements UseCase<List<Serie>, ParamsGetSeriesByGenre> {
  final ISeriesRepository _repository;

  GetSeriesByGenreUsecase({required ISeriesRepository repository})
      : _repository = repository;

  @override
  Future<Either<IFailure, List<Serie>>> call(ParamsGetSeriesByGenre params) {
    return _repository.getSeriesByGenre(
      idGenre: params.idGenre,
      page: params.page,
    );
  }
}

class ParamsGetSeriesByGenre {
  final int idGenre;
  final int page;

  ParamsGetSeriesByGenre({required this.idGenre, required this.page});
}
