import 'package:flutter/material.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:series/src/domain/domain.dart';
import '../controller/list_series_controller/list_series_bloc.dart';
import '../widgets/list_series_state/list_series_success.dart';

class ListSeriesPage extends StatefulWidget {
  final TypeSearchSeries typeSearchSeries;
  const ListSeriesPage({
    super.key,
    required this.typeSearchSeries,
  });

  @override
  State<ListSeriesPage> createState() => _ListSeriesPageState();
}

class _ListSeriesPageState extends State<ListSeriesPage> {
  final ListSeriesBloc bloc = Modular.get();

  @override
  void initState() {
    super.initState();
    bloc.add(InitListMovies(typeSearchSeries: widget.typeSearchSeries));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListSeriesBloc, ListSeriesState>(
      bloc: bloc,
      builder: (context, state) {
        switch (state.status) {
          case ControlStatus.initial:
          case ControlStatus.empty:
          case ControlStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case ControlStatus.success:
            return ListSeriesSuccess(
              titleList: state.titleList,
              listSeries: state.listSeries,
              typeSearchSeries: widget.typeSearchSeries,
            );
          case ControlStatus.failure:
          default:
            return const Center(child: Text('Falha ao carregar filmes'));
        }
      },
    );
  }
}
