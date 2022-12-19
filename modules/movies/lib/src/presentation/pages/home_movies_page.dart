import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:movies/src/presentation/controller/home_movies_controller/home_movies_bloc.dart';
import 'package:movies/src/presentation/widgets/home_movies_state/home_movies_success.dart';

class HomeMoviesPage extends StatefulWidget {
  const HomeMoviesPage({super.key});

  @override
  State<HomeMoviesPage> createState() => _HomeMoviesPageState();
}

class _HomeMoviesPageState extends State<HomeMoviesPage> {
  final HomeMoviesBloc bloc = Modular.get();

  @override
  void initState() {
    super.initState();
    bloc.add(HomeMoviesInital());
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
        actions: [
          IconButton(
            onPressed: () => Modular.to.pushNamed(
              RoutesConst.series,
            ),
            icon: Icon(Icons.movie),
          )
        ],
        title: Text(
          'Movies',
          style: TextStyle(
            color: theme.colorScheme.onPrimary,
            fontSize: 18,
          ),
        ),
        toolbarHeight: 71,
      ),
      body: BlocBuilder<HomeMoviesBloc, HomeMoviesState>(
        bloc: bloc,
        builder: (context, state) {
          switch (state.status) {
            case ControlStatus.initial:
            case ControlStatus.empty:
            case ControlStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case ControlStatus.success:
              return const HomeMoviesSuccess();
            case ControlStatus.failure:
            default:
              return const Center(child: Text('Falha ao carregar filmes'));
          }
        },
      ),
    );
  }
}
