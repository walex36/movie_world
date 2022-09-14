import 'package:flutter/cupertino.dart';
import 'package:lib_blur_hash/lib_blur_hash.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_movies/lib_movies.dart';
import 'package:meta/meta.dart';

part 'movies_details_event.dart';
part 'movies_details_state.dart';

class MoviesDetailsBloc extends Bloc<MoviesDetailsEvent, MoviesDetailsState> {
  final GetMovieUsecase _getMovieUsecase;
  final GetHashImageUsecase _getHashImageUsecase;

  MoviesDetailsBloc({
    required GetMovieUsecase getMovieUsecase,
    required GetHashImageUsecase getHashImageUsecase,
  })  : _getMovieUsecase = getMovieUsecase,
        _getHashImageUsecase = getHashImageUsecase,
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
          blurImage: 'L02Fc7j[fQj[j[fQfQfQfQfQfQfQ',
          status: ControlStatus.initial,
        )) {
    on<InitMoviesDetails>(_onInitMoviesDetails);
    on<ResetBlurMovieDetails>(_onResetBlurMovieDetails);
  }

  void _onInitMoviesDetails(
    InitMoviesDetails event,
    Emitter<MoviesDetailsState> emit,
  ) async {
    emit(state.copyWith(
      status: ControlStatus.loading,
      movie: event.movieCache,
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

  void _onResetBlurMovieDetails(
    ResetBlurMovieDetails event,
    Emitter<MoviesDetailsState> emit,
  ) async {
    emit(state.copyWith(blurImage: 'L02Fc7j[fQj[j[fQfQfQfQfQfQfQ'));
  }
}
