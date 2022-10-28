// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_movies_bloc.dart';

class HomeMoviesState extends Equatable {
  final ControlStatus status;
  final List<TypeSearchMovies> listTypeSearch;

  const HomeMoviesState({
    required this.status,
    required this.listTypeSearch,
  });

  @override
  List<Object?> get props => [
        status,
        listTypeSearch,
      ];

  HomeMoviesState copyWith({
    ControlStatus? status,
    List<TypeSearchMovies>? listTypeSearch,
  }) {
    return HomeMoviesState(
      status: status ?? this.status,
      listTypeSearch: listTypeSearch ?? this.listTypeSearch,
    );
  }
}
