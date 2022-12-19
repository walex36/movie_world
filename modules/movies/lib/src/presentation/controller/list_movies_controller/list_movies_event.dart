part of 'list_movies_bloc.dart';

@immutable
abstract class ListMoviesEvent extends Equatable {}

class InitListMovies extends ListMoviesEvent {
  final TypeSearchMovies typeSearchMovies;

  InitListMovies({
    required this.typeSearchMovies,
  });

  @override
  List<Object?> get props => [
        typeSearchMovies,
      ];
}
