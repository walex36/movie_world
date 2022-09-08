part of 'list_movies_bloc.dart';

@immutable
abstract class ListMoviesEvent extends Equatable {}

class InitListMovies extends ListMoviesEvent {
  @override
  List<Object?> get props => [];
}
