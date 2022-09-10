part of 'movies_details_bloc.dart';

class MoviesDetailsState extends Equatable {
  final Movie movie;
  final ControlStatus status;

  const MoviesDetailsState({
    required this.movie,
    required this.status,
  });

  MoviesDetailsState copyWith({
    Movie? movie,
    ControlStatus? status,
  }) {
    return MoviesDetailsState(
      movie: movie ?? this.movie,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        movie,
        status,
      ];
}
