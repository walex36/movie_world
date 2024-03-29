import 'package:home/src/domain/domain.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:movies/movies.dart';
import 'package:series/series.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetMoviesPopularUsecase _getMoviesPopularUsecase;
  final GetSeriesPopularUsecase _getSeriesPopularUsecase;
  final GetTrendingUsecase _getTrendingUsecase;
  final GetGenresMoviesUsecase _genresMoviesUsecase;
  final GetMoviesByGenreUsecase _getMoviesByGenreUsecase;
  final GetGenresSeriesUsecase _getGenresSeriesUsecase;
  final GetSeriesByGenreUsecase _getSeriesByGenreUsecase;
  HomeBloc({
    required GetMoviesPopularUsecase getMoviesPopularUsecase,
    required GetSeriesPopularUsecase getSeriesPopularUsecase,
    required GetGenresMoviesUsecase getGenresMoviesUsecase,
    required GetTrendingUsecase getTrendingUsecase,
    required GetMoviesByGenreUsecase getMoviesByGenreUsecase,
    required GetGenresSeriesUsecase getGenresSeriesUsecase,
    required GetSeriesByGenreUsecase getSeriesByGenreUsecase,
  })  : _getMoviesPopularUsecase = getMoviesPopularUsecase,
        _getSeriesPopularUsecase = getSeriesPopularUsecase,
        _getTrendingUsecase = getTrendingUsecase,
        _genresMoviesUsecase = getGenresMoviesUsecase,
        _getMoviesByGenreUsecase = getMoviesByGenreUsecase,
        _getGenresSeriesUsecase = getGenresSeriesUsecase,
        _getSeriesByGenreUsecase = getSeriesByGenreUsecase,
        super(const HomeState(
          status: ControlStatus.initial,
          moviesPopular: [],
          seriesPopular: [],
          moviesAndSeriesTrending: [],
          moviesByGenre: [],
          seriesByGenre: [],
        )) {
    on<HomeInit>(_onHomeInit);
  }

  Future<void> _onHomeInit(HomeInit event, Emitter<HomeState> emit) async {
    try {
      emit(state.copyWith(status: ControlStatus.loading));

      (
        List<Serie> moviesAndSeriesTrending,
        List<Movie> moviesPopular
      ) moviesAndSeriesTrending = await _getTrending(1);

      List<Movie> listMovies = await _getMoviesPopular(1);

      List<Serie> listSeries = await _getSeriesPopular(1);

      List<Map<Genre, List<Movie>>> moviesByGenre = await _getMoviesGenre();

      List<Map<Genre, List<Serie>>> seriesByGenre = await _getSeriesGenre();

      List<dynamic> listMovieSerie = [
        ...moviesAndSeriesTrending.$1,
        ...moviesAndSeriesTrending.$2
      ];

      emit(state.copyWith(
        status: ControlStatus.success,
        moviesAndSeriesTrending: listMovieSerie,
        moviesPopular: listMovies,
        seriesPopular: listSeries,
        moviesByGenre: moviesByGenre,
        seriesByGenre: seriesByGenre,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ControlStatus.failure,
      ));
    }
  }

  Future<(List<Serie>, List<Movie>)> _getTrending(int page) async {
    Either<IFailure, (List<Serie>, List<Movie>)> failureOrTrending =
        await _getTrendingUsecase(ParamsGetTrending(page: page));

    return failureOrTrending.fold(
      (failure) => throw ServerException(),
      (trending) => trending,
    );
  }

  Future<List<Movie>> _getMoviesPopular(int page) async {
    Either<IFailure, List<Movie>> failureOrMovieList =
        await _getMoviesPopularUsecase(ParamsGetMoviesPopular(page: page));

    return failureOrMovieList.fold(
      (failure) => throw ServerException(),
      (movies) => movies,
    );
  }

  Future<List<Serie>> _getSeriesPopular(int page) async {
    Either<IFailure, List<Serie>> failureOrSerieList =
        await _getSeriesPopularUsecase(ParamsGetSeriesPopular(page: page));

    return failureOrSerieList.fold(
      (failure) => throw ServerException(),
      (series) => series,
    );
  }

  Future<List<Map<Genre, List<Movie>>>> _getMoviesGenre() async {
    List<Genre> genres;
    List<Map<Genre, List<Movie>>> moviesByGenre = [];

    Either<IFailure, List<Genre>> failureOrGenre =
        await _genresMoviesUsecase(NoParams());

    genres = failureOrGenre.fold(
      (failure) => throw ServerException(),
      (genres) => genres,
    );

    for (var genre in genres.getRange(0, 5)) {
      Either<IFailure, List<Movie>> failureOrMovies =
          await _getMoviesByGenreUsecase(ParamsGetMoviesByGenre(
        idGenre: genre.id,
        page: 1,
      ));

      failureOrMovies.fold(
        (failure) => throw ServerException(),
        (movies) => moviesByGenre.add({
          genre: movies,
        }),
      );
    }

    return moviesByGenre;
  }

  Future<List<Map<Genre, List<Serie>>>> _getSeriesGenre() async {
    List<Genre> genres;
    List<Map<Genre, List<Serie>>> seriesByGenre = [];

    Either<IFailure, List<Genre>> failureOrGenre =
        await _getGenresSeriesUsecase(NoParams());

    genres = failureOrGenre.fold(
      (failure) => throw ServerException(),
      (genres) => genres,
    );

    for (var genre in genres.getRange(0, 5)) {
      Either<IFailure, List<Serie>> failureOrSeries =
          await _getSeriesByGenreUsecase(ParamsGetSeriesByGenre(
        idGenre: genre.id,
        page: 1,
      ));

      failureOrSeries.fold(
        (failure) => throw ServerException(),
        (movies) => seriesByGenre.add({
          genre: movies,
        }),
      );
    }

    return seriesByGenre;
  }
}
