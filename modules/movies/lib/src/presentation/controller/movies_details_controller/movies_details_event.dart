part of 'movies_details_bloc.dart';

@immutable
abstract class MoviesDetailsEvent extends Equatable {}

class InitMoviesDetails extends MoviesDetailsEvent {
  final Movie movieCache;
  final String typeSearchMovies;

  InitMoviesDetails({
    required this.movieCache,
    required this.typeSearchMovies,
  });

  @override
  List<Object?> get props => [
        movieCache,
        typeSearchMovies,
      ];
}
