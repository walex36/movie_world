part of 'home_movies_bloc.dart';

@immutable
abstract class HomeMoviesEvent extends Equatable {}

class HomeMoviesInital extends HomeMoviesEvent {
  @override
  List<Object?> get props => [];
}
