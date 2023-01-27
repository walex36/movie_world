import 'package:flutter/material.dart';
import 'package:home/src/controller/home_bloc.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_movies/lib_movies.dart';
import 'package:lib_series/lib_series.dart';
import 'package:movies/movies.dart';
import 'package:series/series.dart';

class HomeSuccess extends StatelessWidget {
  const HomeSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    HomeBloc bloc = Modular.get();
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: bloc,
      builder: (context, state) {
        return Scaffold(
          body: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Trending',
                      style: TextStyle(
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
                        children: state.moviesAndSeriesTrending.map((item) {
                          if (item['media_type'] == 'tv') {
                            Serie serie = SerieModel.fromMap(item).toEntity();
                            return CardSerie(
                              serie: serie,
                              typeSearchSeries: TypeSearchSeries.trending.name,
                            );
                          } else {
                            Movie movie = MovieModel.fromMap(item).toEntity();
                            return CardMovie(
                              movie: movie,
                              typeSearchMovies: TypeSearchMovies.trending.name,
                            );
                          }
                        }).toList()),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Filmes Populares',
                      style: TextStyle(
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
                        children: state.moviesPopular
                            .map(
                              (movie) => CardMovie(
                                movie: movie,
                                typeSearchMovies: TypeSearchMovies.popular.name,
                              ),
                            )
                            .toList()),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Séries Populares',
                      style: TextStyle(
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
                        children: state.seriesPopular
                            .map(
                              (serie) => CardSerie(
                                serie: serie,
                                typeSearchSeries: TypeSearchSeries.popular.name,
                              ),
                            )
                            .toList()),
                  ),
                  ListMoviesGenre(moviesByGenre: state.moviesByGenre),
                  ListSeriesGenre(seriesByGenre: state.seriesByGenre),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
