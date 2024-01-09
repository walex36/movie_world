// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'all_midia_bloc.dart';

class AllMidiaState extends Equatable {
  final ControlStatus status;
  final List<dynamic> listMidia;

  const AllMidiaState({
    required this.status,
    required this.listMidia,
  });

  @override
  List<Object?> get props => [
        status,
        listMidia,
      ];

  AllMidiaState copyWith({
    ControlStatus? status,
    List<dynamic>? listMidia,
  }) {
    return AllMidiaState(
      status: status ?? this.status,
      listMidia: listMidia ?? this.listMidia,
    );
  }
}
