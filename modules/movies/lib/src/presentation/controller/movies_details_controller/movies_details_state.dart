part of 'movies_details_bloc.dart';

class MoviesDetailsState extends Equatable {
  final Movie movie;
  final String typeSearchMovies;
  final String blurImage;
  final ControlStatus status;
  final List<Actor> credits;
  final List<WatchCountry> watchCountry;
  final WatchCountry? watchCountrySelect;

  const MoviesDetailsState({
    required this.movie,
    required this.typeSearchMovies,
    required this.blurImage,
    required this.status,
    required this.credits,
    required this.watchCountry,
    required this.watchCountrySelect,
  });

  MoviesDetailsState copyWith({
    Movie? movie,
    String? typeSearchMovies,
    String? blurImage,
    ControlStatus? status,
    List<Actor>? credits,
    List<WatchCountry>? watchCountry,
    WatchCountry? watchCountrySelect,
  }) {
    return MoviesDetailsState(
      movie: movie ?? this.movie,
      typeSearchMovies: typeSearchMovies ?? this.typeSearchMovies,
      blurImage: blurImage ?? this.blurImage,
      status: status ?? this.status,
      credits: credits ?? this.credits,
      watchCountry: watchCountry ?? this.watchCountry,
      watchCountrySelect: watchCountrySelect ?? this.watchCountrySelect,
    );
  }

  @override
  List<Object?> get props => [
        movie,
        typeSearchMovies,
        blurImage,
        status,
        credits,
        watchCountry,
      ];
}
