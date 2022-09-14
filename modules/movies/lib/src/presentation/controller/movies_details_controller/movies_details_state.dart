part of 'movies_details_bloc.dart';

class MoviesDetailsState extends Equatable {
  final Movie movie;
  final String blurImage;
  final ControlStatus status;

  const MoviesDetailsState({
    required this.movie,
    required this.blurImage,
    required this.status,
  });

  MoviesDetailsState copyWith({
    Movie? movie,
    String? blurImage,
    ControlStatus? status,
  }) {
    return MoviesDetailsState(
      movie: movie ?? this.movie,
      blurImage: blurImage ?? this.blurImage,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        movie,
        blurImage,
        status,
      ];
}
