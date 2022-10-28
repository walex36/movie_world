part of 'list_movies_bloc.dart';

class ListMoviesState extends Equatable {
  final List<Movie> movieList;
  final String titleList;
  final TypeSearchMovies typeSearchMovies;
  final ControlStatus status;

  const ListMoviesState({
    required this.movieList,
    required this.titleList,
    required this.typeSearchMovies,
    required this.status,
  });

  @override
  List<Object?> get props => [
        movieList,
        titleList,
        typeSearchMovies,
        status,
      ];

  ListMoviesState copyWith({
    List<Movie>? movieList,
    String? titleList,
    TypeSearchMovies? typeSearchMovies,
    ControlStatus? status,
  }) {
    return ListMoviesState(
      movieList: movieList ?? this.movieList,
      titleList: titleList ?? this.titleList,
      typeSearchMovies: typeSearchMovies ?? this.typeSearchMovies,
      status: status ?? this.status,
    );
  }
}
