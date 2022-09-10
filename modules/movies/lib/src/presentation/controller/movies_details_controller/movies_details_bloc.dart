import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_movies/lib_movies.dart';
import 'package:meta/meta.dart';

part 'movies_details_event.dart';
part 'movies_details_state.dart';

class MoviesDetailsBloc extends Bloc<MoviesDetailsEvent, MoviesDetailsState> {
  final GetMovieUsecase _getMovieUsecase;

  MoviesDetailsBloc({
    required GetMovieUsecase getMovieUsecase,
  })  : _getMovieUsecase = getMovieUsecase,
        super(MoviesDetailsState(
          movie: Movie(
            adult: false,
            backdropPath: '',
            belongsToCollection: const Collection(
                id: 0, name: '', posterPath: '', backdropPath: ''),
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
            title: '',
            video: false,
            voteAverage: 0,
            voteCount: 0,
          ),
          status: ControlStatus.initial,
        )) {
    on<InitMoviesDetails>(_onInitMoviesDetails);
  }

  void _onInitMoviesDetails(
    InitMoviesDetails event,
    Emitter<MoviesDetailsState> emit,
  ) async {
    emit(state.copyWith(status: ControlStatus.loading));

    final failureOrMovie = await _getMovieUsecase(
      ParamsGetMovie(idMovieParam: event.idMovie),
    );

    failureOrMovie.fold(
      (failure) => emit(state.copyWith(status: ControlStatus.failure)),
      (movie) => emit(state.copyWith(
        movie: movie,
        status: ControlStatus.success,
      )),
    );
  }
}
