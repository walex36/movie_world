import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_core/lib_core.dart';
import 'package:movies/src/domain/domain.dart';

class GetMoviesByGenreUsecase
    implements UseCase<List<Movie>, ParamsGetMoviesByGenre> {
  final IMoviesRepository _repository;

  GetMoviesByGenreUsecase({required IMoviesRepository repository})
      : _repository = repository;

  @override
  Future<Either<IFailure, List<Movie>>> call(params) {
    return _repository.getMoviesByGenre(
      idGenre: params.idGenre,
      page: params.page,
    );
  }
}

class ParamsGetMoviesByGenre {
  final int idGenre;
  final int page;

  ParamsGetMoviesByGenre({required this.idGenre, required this.page});
}
