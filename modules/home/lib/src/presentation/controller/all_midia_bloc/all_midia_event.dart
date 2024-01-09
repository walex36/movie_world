part of 'all_midia_bloc.dart';

@immutable
abstract class AllMidiaEvent extends Equatable {}

class AllMidiaInitial extends AllMidiaEvent {
  final List<dynamic> listMedia;

  AllMidiaInitial({
    required this.listMedia,
  });

  @override
  List<Object?> get props => [
        listMedia,
      ];
}
