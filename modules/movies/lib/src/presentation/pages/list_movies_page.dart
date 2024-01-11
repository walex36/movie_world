import 'package:flutter/material.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:movies/src/domain/domain.dart';
import 'package:movies/src/presentation/controller/list_movies_controller/list_movies_bloc.dart';
import 'package:movies/src/presentation/widgets/list_movies_state/list_movies_success.dart';

class ListMoviesPage extends StatefulWidget {
  final TypeSearchMovies typeSearchMovies;
  const ListMoviesPage({
    super.key,
    required this.typeSearchMovies,
  });

  @override
  State<ListMoviesPage> createState() => _ListMoviesPageState();
}

class _ListMoviesPageState extends State<ListMoviesPage> {
  final ListMoviesBloc bloc = Modular.get();

  @override
  void initState() {
    super.initState();
    bloc.add(InitListMovies(typeSearchMovies: widget.typeSearchMovies));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListMoviesBloc, ListMoviesState>(
      bloc: bloc,
      builder: (context, state) {
        switch (state.status) {
          case ControlStatus.initial:
          case ControlStatus.empty:
          case ControlStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case ControlStatus.success:
            return ListMoviesSuccess(
              titleList: state.titleList,
              listMovies: state.movieList,
              typeSearchMovies: widget.typeSearchMovies,
            );
          case ControlStatus.failure:
          default:
            return const Center(child: Text('Falha ao carregar filmes'));
        }
      },
    );
  }
}
