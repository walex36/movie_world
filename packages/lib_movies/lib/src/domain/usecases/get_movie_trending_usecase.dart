import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_movies/lib_movies.dart';

class GetMovieTrendingUsecase
    extends UseCase<List<Movie>, ParansGetMovieTrending> {
  final IMoviesRepository repository;

  GetMovieTrendingUsecase({required this.repository});

  @override
  Future<Either<IFailure, List<Movie>>> call(ParansGetMovieTrending params) {
    return repository.getMoviesTrending(
      page: params.page,
      dayAndNotWeek: params.dayAndNotWeek,
    );
  }
}

class ParansGetMovieTrending {
  final int page;
  final bool dayAndNotWeek;

  ParansGetMovieTrending({
    required this.page,
    required this.dayAndNotWeek,
  });
}
