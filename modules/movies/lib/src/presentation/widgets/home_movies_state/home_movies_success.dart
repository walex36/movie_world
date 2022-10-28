import 'package:flutter/material.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:movies/src/presentation/controller/home_movies_controller/home_movies_bloc.dart';
import 'package:movies/src/presentation/pages/list_movies_page.dart';

class HomeMoviesSuccess extends StatelessWidget {
  const HomeMoviesSuccess({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    HomeMoviesBloc bloc = Modular.get();

    return BlocBuilder<HomeMoviesBloc, HomeMoviesState>(
      bloc: bloc,
      builder: (context, state) {
        return ListView(
          children: state.listTypeSearch
              .map(
                (typeSearch) => ListMoviesPage(
                  typeSearchMovies: typeSearch,
                ),
              )
              .toList(),
        );
      },
    );
  }
}
