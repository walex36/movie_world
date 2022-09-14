part of 'movies_details_bloc.dart';

@immutable
abstract class MoviesDetailsEvent extends Equatable {}

class InitMoviesDetails extends MoviesDetailsEvent {
  final Movie movieCache;

  InitMoviesDetails({
    required this.movieCache,
  });

  @override
  List<Object?> get props => [
        movieCache,
      ];
}

class ResetBlurMovieDetails extends MoviesDetailsEvent {
  @override
  List<Object?> get props => [];
}
