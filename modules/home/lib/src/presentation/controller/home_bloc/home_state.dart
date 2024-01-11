part of 'home_bloc.dart';

class HomeState extends Equatable {
  final ControlStatus status;
  final List<Movie> moviesPopular;
  final List<Serie> seriesPopular;
  final List<dynamic> moviesAndSeriesTrending;
  final List<Map<Genre, List<Movie>>> moviesByGenre;
  final List<Map<Genre, List<Serie>>> seriesByGenre;

  const HomeState({
    required this.status,
    required this.moviesPopular,
    required this.seriesPopular,
    required this.moviesAndSeriesTrending,
    required this.moviesByGenre,
    required this.seriesByGenre,
  });

  @override
  List<Object?> get props => [
        status,
        moviesPopular,
        seriesPopular,
        moviesAndSeriesTrending,
        moviesByGenre,
        seriesByGenre,
      ];

  HomeState copyWith({
    ControlStatus? status,
    List<Movie>? moviesPopular,
    List<Serie>? seriesPopular,
    List<dynamic>? moviesAndSeriesTrending,
    List<Map<Genre, List<Movie>>>? moviesByGenre,
    List<Map<Genre, List<Serie>>>? seriesByGenre,
  }) {
    return HomeState(
      status: status ?? this.status,
      moviesPopular: moviesPopular ?? this.moviesPopular,
      seriesPopular: seriesPopular ?? this.seriesPopular,
      moviesAndSeriesTrending:
          moviesAndSeriesTrending ?? this.moviesAndSeriesTrending,
      moviesByGenre: moviesByGenre ?? this.moviesByGenre,
      seriesByGenre: seriesByGenre ?? this.seriesByGenre,
    );
  }
}
