// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:lib_blur_hash/lib_blur_hash.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_movies/lib_movies.dart';

part 'movies_details_event.dart';
part 'movies_details_state.dart';

class MoviesDetailsBloc extends Bloc<MoviesDetailsEvent, MoviesDetailsState> {
  final GetMovieUsecase _getMovieUsecase;
  final GetHashImageUsecase _getHashImageUsecase;
  final GetCreditsUsecase _getCreditsUsecase;
  final GetWatchUsecase _getWatchUsecase;

  MoviesDetailsBloc({
    required GetMovieUsecase getMovieUsecase,
    required GetHashImageUsecase getHashImageUsecase,
    required GetCreditsUsecase getCreditsUsecase,
    required GetWatchUsecase getWatchUsecase,
  })  : _getMovieUsecase = getMovieUsecase,
        _getHashImageUsecase = getHashImageUsecase,
        _getCreditsUsecase = getCreditsUsecase,
        _getWatchUsecase = getWatchUsecase,
        super(MoviesDetailsState(
          movie: Movie(
            adult: false,
            backdropPath: '',
            belongsToCollection: const Collection(
                id: 0, name: '', posterPath: '', backdropPath: ''),
            budget: 0,
            genres: const [],
            homepage: '',
            id: 0,
            imdbId: '',
            originalLanguage: '',
            originalTitle: '',
            overview: '',
            popularity: 0,
            posterPath: '',
            productionCompanies: const [],
            productionCountries: const [],
            releaseDate: DateTime(2022),
            spokenLanguages: const [],
            status: '',
            tagline: '',
            revenue: 0,
            runtime: 0,
            title: '',
            video: false,
            voteAverage: 0,
            voteCount: 0,
          ),
          typeSearchMovies: 'popular',
          blurImage: 'L02Fc7j[fQj[j[fQfQfQfQfQfQfQ',
          status: ControlStatus.initial,
          credits: const [],
          watchCountry: const [],
          watchCountrySelect: null,
        )) {
    on<InitMoviesDetails>(_onInitMoviesDetails);
  }

  Future<void> _onInitMoviesDetails(
    InitMoviesDetails event,
    Emitter<MoviesDetailsState> emit,
  ) async {
    emit(state.copyWith(
      status: ControlStatus.loading,
      movie: event.movieCache,
      typeSearchMovies: event.typeSearchMovies,
      blurImage: 'L02Fc7j[fQj[j[fQfQfQfQfQfQfQ',
      credits: [],
      watchCountry: [],
      watchCountrySelect: null,
    ));

    final failureOrMovie = await _getMovieUsecase(
      ParamsGetMovie(idMovieParam: event.movieCache.id),
    );

    failureOrMovie.fold(
      (failure) => emit(state.copyWith(status: ControlStatus.failure)),
      (movie) => emit(state.copyWith(
        status: ControlStatus.success,
        movie: movie,
      )),
    );

    final failureOrCredits = await _getCreditsUsecase(ParamsGetCredits(
      idMovie: event.movieCache.id,
    ));

    failureOrCredits.fold(
      (failure) => null,
      (credits) => emit(state.copyWith(
        credits: credits,
      )),
    );

    final failureOrWatch = await _getWatchUsecase(ParamsGetWatch(
      idMovie: event.movieCache.id,
    ));

    failureOrWatch.fold(
      (failure) => null,
      (watch) {
        WatchCountry? watchSelect;
        for (var element in watch) {
          if (element.country.name == 'BR') {
            watchSelect = element;
            break;
          }
        }

        emit(state.copyWith(
          watchCountry: watch.isEmpty ? [] : watch,
          watchCountrySelect: watch.isEmpty ? null : watchSelect ?? watch.first,
        ));
      },
    );

    final failureOrHash = await _getHashImageUsecase(ParamsGetHashImage(
      urlImage: state.movie.posterPath,
    ));

    failureOrHash.fold(
      (failrue) => null,
      (hash) => emit(state.copyWith(
        blurImage: hash,
      )),
    );
  }
}
