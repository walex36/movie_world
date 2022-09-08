part of 'list_movies_bloc.dart';

class ListMoviesState extends Equatable {
  final List<Movie> movieList;
  final ControlStatus status;

  const ListMoviesState({
    required this.movieList,
    required this.status,
  });

  @override
  List<Object?> get props => [
        movieList,
        status,
      ];

  ListMoviesState copyWith({
    List<Movie>? movieList,
    ControlStatus? status,
  }) {
    return ListMoviesState(
      movieList: movieList ?? this.movieList,
      status: status ?? this.status,
    );
  }
}
