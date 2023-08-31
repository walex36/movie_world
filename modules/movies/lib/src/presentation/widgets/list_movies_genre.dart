import 'package:flutter/material.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_movies/lib_movies.dart';
import 'package:movies/movies.dart';

class ListMoviesGenre extends StatelessWidget {
  final List<Map<Genre, List<Movie>>> moviesByGenre;
  const ListMoviesGenre({super.key, required this.moviesByGenre});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: moviesByGenre
          .map(
            (genreAndMovies) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Filmes de ${genreAndMovies.keys.first.name}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 210,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      children: genreAndMovies.values.first
                          .map(
                            (movie) => CardMovie(
                              movie: movie,
                              typeSearchMovies: TypeSearchMovies.genre.name +
                                  genreAndMovies.keys.first.name,
                              cardReduced: true,
                            ),
                          )
                          .toList()),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
