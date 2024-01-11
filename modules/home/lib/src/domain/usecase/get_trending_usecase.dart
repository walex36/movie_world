import 'package:home/src/domain/domain.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:movies/movies.dart';
import 'package:series/series.dart';

class GetTrendingUsecase
    implements UseCase<(List<Serie>, List<Movie>), ParamsGetTrending> {
  final IHomeRepository _repository;

  GetTrendingUsecase({required IHomeRepository repository})
      : _repository = repository;

  @override
  Future<Either<IFailure, (List<Serie>, List<Movie>)>> call(
      ParamsGetTrending params) {
    return _repository.getTrending(page: params.page);
  }
}

class ParamsGetTrending {
  final int page;

  ParamsGetTrending({required this.page});
}
