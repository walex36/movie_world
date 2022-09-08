import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:movies/src/presentation/controller/list_movies_controller/list_movies_bloc.dart';

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
          statusBarBrightness: theme.brightness,
          statusBarIconBrightness: theme.brightness,
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
              return ListView(
                children: state.movieList
                    .map((e) => SizedBox(
                          height: 300,
                          width: 150,
                          child: Image(
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500${e.posterPath}')),
                        ))
                    .toList(),
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
