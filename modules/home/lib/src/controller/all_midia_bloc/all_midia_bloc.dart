// ignore_for_file: depend_on_referenced_packages

import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:meta/meta.dart';

part 'all_midia_event.dart';
part 'all_midia_state.dart';

class AllMidiaBloc extends Bloc<AllMidiaEvent, AllMidiaState> {
  AllMidiaBloc()
      : super(const AllMidiaState(
          status: ControlStatus.initial,
          listMidia: [],
        )) {
    on<AllMidiaInitial>(_onAllMidiaInitial);
  }

  void _onAllMidiaInitial(AllMidiaInitial event, Emitter<AllMidiaState> emit) {
    emit(state.copyWith(
      status: ControlStatus.success,
      listMidia: event.listMedia,
    ));
  }
}
