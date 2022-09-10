part of 'movies_details_bloc.dart';

@immutable
abstract class MoviesDetailsEvent extends Equatable {}

class InitMoviesDetails extends MoviesDetailsEvent {
  final int idMovie;

  InitMoviesDetails({
    required this.idMovie,
  });

  @override
  List<Object?> get props => [
        idMovie,
      ];
}
