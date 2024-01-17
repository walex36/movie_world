import 'package:flutter/material.dart';
import 'package:home/src/presentation/controller/home_bloc/home_bloc.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
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
                          if (item is Serie) {
                            return CardSerie(
                              serie: item,
                              typeSearchSeries: TypeSearchSeries.trending.name,
                              cardReduced: true,
                            );
                          } else if (item is Movie) {
                            return CardMovie(
                              movie: item,
                              typeSearchMovies: TypeSearchMovies.trending.name,
                              cardReduced: true,
                            );
                          } else {
                            return Container();
                          }
                        }).toList()),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Filmes Populares',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        InkWell(
                          onTap: () => Modular.to.pushNamed(
                            'allMedia',
                            arguments: {
                              'listMedia': state.moviesPopular,
                              'midiaType': 'movie',
                              'titlePage': 'Filmes Populares',
                            },
                          ),
                          child: const Text(
                            'Ver Mais',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
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
                                cardReduced: true,
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
                                cardReduced: true,
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
