// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_series_bloc.dart';

class HomeSeriesState extends Equatable {
  final ControlStatus status;
  final List<TypeSearchSeries> listTypeSearch;

  const HomeSeriesState({
    required this.status,
    required this.listTypeSearch,
  });

  @override
  List<Object?> get props => [
        status,
        listTypeSearch,
      ];

  HomeSeriesState copyWith({
    ControlStatus? status,
    List<TypeSearchSeries>? listTypeSearch,
  }) {
    return HomeSeriesState(
      status: status ?? this.status,
      listTypeSearch: listTypeSearch ?? this.listTypeSearch,
    );
  }
}
