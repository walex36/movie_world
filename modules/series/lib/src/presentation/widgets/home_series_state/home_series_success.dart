import 'package:flutter/material.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import '../../controller/home_series_controller/home_series_bloc.dart';
import '../../pages/list_series_page.dart';

class HomeSeriesSuccess extends StatelessWidget {
  const HomeSeriesSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    HomeSeriesBloc bloc = Modular.get();

    return BlocBuilder<HomeSeriesBloc, HomeSeriesState>(
      bloc: bloc,
      builder: (context, state) {
        return ListView(
          children: state.listTypeSearch
              .map(
                (typeSearch) => ListSeriesPage(
                  typeSearchSeries: typeSearch,
                ),
              )
              .toList(),
        );
      },
    );
  }
}
