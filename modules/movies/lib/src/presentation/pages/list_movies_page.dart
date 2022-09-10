import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:movies/src/presentation/controller/list_movies_controller/list_movies_bloc.dart';
import 'package:movies/src/presentation/widgets/card_movie.dart';
import 'package:movies/src/presentation/widgets/list_movies_state/list_movies_success.dart';

class ListMoviesPage extends StatefulWidget {
  const ListMoviesPage({super.key});

  @override
  State<ListMoviesPage> createState() => _ListMoviesPageState();
}

class _ListMoviesPageState extends State<ListMoviesPage> {
  final ListMoviesBloc bloc = Modular.get();

  @override
  void initState() {
    super.initState();
    bloc.add(InitListMovies());
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: theme.colorScheme.primary,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        ),
        title: Text(
          'Movies',
          style: TextStyle(
            color: theme.colorScheme.onPrimary,
            fontSize: 18,
          ),
        ),
        toolbarHeight: 71,
      ),
      body: BlocBuilder<ListMoviesBloc, ListMoviesState>(
        bloc: bloc,
        builder: (context, state) {
          switch (state.status) {
            case ControlStatus.initial:
            case ControlStatus.empty:
            case ControlStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case ControlStatus.success:
              return ListMoviesSuccess(
                listMovies: state.movieList,
              );
            case ControlStatus.failure:
            default:
              return const Center(child: Text('Falha ao carregar filmes'));
          }
        },
      ),
    );
  }
}
