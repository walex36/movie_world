import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_movies/lib_movies.dart';
import 'package:meta/meta.dart';

part 'list_movies_event.dart';
part 'list_movies_state.dart';

class ListMoviesBloc extends Bloc<ListMoviesEvent, ListMoviesState> {
  final GetMovieUsecase _getMovieUsecase;
  final GetMoviesPopularUsecase _getMoviesPopularUsecase;
  final DioConfig _dioConfig;

  ListMoviesBloc({
    required GetMovieUsecase getMovieUsecase,
    required GetMoviesPopularUsecase getMoviesPopularUsecase,
    required DioConfig dioConfig,
  })  : _getMovieUsecase = getMovieUsecase,
        _getMoviesPopularUsecase = getMoviesPopularUsecase,
        _dioConfig = dioConfig,
        super(const ListMoviesState(
          movieList: [],
          status: ControlStatus.initial,
        )) {
    on<InitListMovies>(_onInitListMovies);
  }

  Future<void> _onInitListMovies(
    InitListMovies event,
    Emitter<ListMoviesState> emit,
  ) async {
    _dioConfig.init();
    emit(state.copyWith(status: ControlStatus.loading));

    var failureOrMovieList = await _getMoviesPopularUsecase(NoParams());

    failureOrMovieList.fold(
      (failure) => emit(state.copyWith(status: ControlStatus.failure)),
      (movieList) => emit(state.copyWith(
        status: ControlStatus.success,
        movieList: movieList,
      )),
    );
  }
}
