part of 'home_series_bloc.dart';

@immutable
abstract class HomeSeriesEvent extends Equatable {}

class HomeSeriesInitial extends HomeSeriesEvent {
  @override
  List<Object?> get props => [];
}
