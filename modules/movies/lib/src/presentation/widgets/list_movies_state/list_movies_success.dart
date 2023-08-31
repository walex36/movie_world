import 'package:flutter/material.dart';
import 'package:lib_movies/lib_movies.dart';
import 'package:movies/src/presentation/widgets/card_movie.dart';

class ListMoviesSuccess extends StatelessWidget {
  final String titleList;
  final List<Movie> listMovies;
  final TypeSearchMovies typeSearchMovies;
  const ListMoviesSuccess({
    super.key,
    required this.titleList,
    required this.listMovies,
    required this.typeSearchMovies,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            titleList,
            style: const TextStyle(
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
                      typeSearchMovies: typeSearchMovies.name,
                      cardReduced: true,
                    ))
                .toList(),
          ),
        )
      ],
    );
  }
}
