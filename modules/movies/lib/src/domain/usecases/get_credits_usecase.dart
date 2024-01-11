import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_core/lib_core.dart';
import 'package:movies/src/domain/domain.dart';

class GetCreditsUsecase extends UseCase<List<Actor>, ParamsGetCredits> {
  final IMoviesRepository repository;

  GetCreditsUsecase({required this.repository});

  @override
  Future<Either<IFailure, List<Actor>>> call(ParamsGetCredits params) {
    return repository.getCredits(idMovie: params.idMovie);
  }
}

class ParamsGetCredits {
  final int idMovie;

  ParamsGetCredits({required this.idMovie});
}
