import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:series/src/domain/domain.dart';
import 'package:lib_core/lib_core.dart';

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
