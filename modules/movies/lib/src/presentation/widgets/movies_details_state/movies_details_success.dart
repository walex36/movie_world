import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:movies/src/presentation/controller/movies_details_controller/movies_details_bloc.dart';

class MoviesDetailsSuccess extends StatelessWidget {
  const MoviesDetailsSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    MoviesDetailsBloc bloc = Modular.get();

    return BlocBuilder<MoviesDetailsBloc, MoviesDetailsState>(
      bloc: bloc,
      builder: (context, state) {
        return ListView(
          children: [
            SizedBox(
              child: Container(
                height: 200,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: NetworkImage(
                      'https://image.tmdb.org/t/p/w500${state.movie.posterPath}',
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
