import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lib_movies/lib_movies.dart';
import 'package:movies/src/presentation/widgets/card_movie.dart';

class ListMoviesSuccess extends StatelessWidget {
  final List<Movie> listMovies;
  const ListMoviesSuccess({
    super.key,
    required this.listMovies,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Popular Movies',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: 280,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            children: listMovies
                .map((movie) => CardMovie(
                      movie: movie,
                    ))
                .toList(),
          ),
        )
      ],
    );
  }
}
