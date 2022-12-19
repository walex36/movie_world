part of 'list_series_bloc.dart';

class ListSeriesState extends Equatable {
  final ControlStatus status;
  final String titleList;
  final List<Serie> listSeries;
  final TypeSearchSeries typeSearchSeries;

  const ListSeriesState({
    required this.status,
    required this.titleList,
    required this.listSeries,
    required this.typeSearchSeries,
  });

  @override
  List<Object?> get props => [
        status,
        titleList,
        listSeries,
        typeSearchSeries,
      ];

  ListSeriesState copyWith({
    ControlStatus? status,
    String? titleList,
    List<Serie>? listSeries,
    TypeSearchSeries? typeSearchSeries,
  }) {
    return ListSeriesState(
      status: status ?? this.status,
      titleList: titleList ?? this.titleList,
      listSeries: listSeries ?? this.listSeries,
      typeSearchSeries: typeSearchSeries ?? this.typeSearchSeries,
    );
  }
}
