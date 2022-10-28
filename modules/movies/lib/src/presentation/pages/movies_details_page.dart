import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_movies/lib_movies.dart';
import 'package:movies/src/presentation/controller/movies_details_controller/movies_details_bloc.dart';
import 'package:movies/src/presentation/widgets/movies_details_state/movies_details_success.dart';

class MoviesDetailsPage extends StatefulWidget {
  final Movie movie;
  final String typeSearchMovies;
  const MoviesDetailsPage({
    super.key,
    required this.movie,
    required this.typeSearchMovies,
  });

  @override
  State<MoviesDetailsPage> createState() => _MoviesDetailsPageState();
}

class _MoviesDetailsPageState extends State<MoviesDetailsPage> {
  final MoviesDetailsBloc bloc = Modular.get();

  @override
  void initState() {
    super.initState();
    bloc.add(InitMoviesDetails(
      movieCache: widget.movie,
      typeSearchMovies: widget.typeSearchMovies,
    ));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: theme.colorScheme.primary,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 71,
      ),
      body: BlocBuilder<MoviesDetailsBloc, MoviesDetailsState>(
        bloc: bloc,
        builder: (context, state) {
          switch (state.status) {
            case ControlStatus.initial:
            case ControlStatus.empty:
            case ControlStatus.loading:
            case ControlStatus.success:
              return MoviesDetailsSuccess(
                movieCache: widget.movie,
              );
            case ControlStatus.failure:
            default:
              return const Center(child: Text('Falha ao carregar filme'));
          }
        },
      ),
    );
  }
}
