import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_movies/lib_movies.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'list_movies_event.dart';
part 'list_movies_state.dart';

class ListMoviesBloc extends Bloc<ListMoviesEvent, ListMoviesState> {
  final GetMoviesPopularUsecase _getMoviesPopularUsecase;
  final GetMovieTrendingUsecase _getMovieTrendingUsecase;

  ListMoviesBloc({
    required GetMoviesPopularUsecase getMoviesPopularUsecase,
    required GetMovieTrendingUsecase getMovieTrendingUsecase,
  })  : _getMoviesPopularUsecase = getMoviesPopularUsecase,
        _getMovieTrendingUsecase = getMovieTrendingUsecase,
        super(const ListMoviesState(
          movieList: [],
          titleList: '',
          typeSearchMovies: TypeSearchMovies.popular,
          status: ControlStatus.initial,
        )) {
    on<InitListMovies>(_onInitListMovies);
  }

  Future<void> _onInitListMovies(
    InitListMovies event,
    Emitter<ListMoviesState> emit,
  ) async {
    emit(state.copyWith(
      status: ControlStatus.loading,
      typeSearchMovies: event.typeSearchMovies,
    ));

    late Either<IFailure, List<Movie>> failureOrMovieList;

    switch (state.typeSearchMovies) {
      case TypeSearchMovies.popular:
        emit(state.copyWith(titleList: 'Populares'));
        failureOrMovieList =
            await _getMoviesPopularUsecase(ParamsGetMoviesPopular(page: 0));
        break;
      case TypeSearchMovies.trending:
        emit(state.copyWith(titleList: 'Trendings'));
        failureOrMovieList =
            await _getMovieTrendingUsecase(ParansGetMovieTrending(
          page: 0,
          dayAndNotWeek: true,
        ));
        break;
      default:
        failureOrMovieList =
            await _getMoviesPopularUsecase(ParamsGetMoviesPopular(page: 0));
    }

    failureOrMovieList.fold(
      (failure) => emit(state.copyWith(status: ControlStatus.failure)),
      (movieList) => emit(state.copyWith(
        status: ControlStatus.success,
        movieList: movieList,
      )),
    );
  }
}
