import 'package:flutter/material.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_movies/lib_movies.dart';
import 'package:lib_core/lib_core.dart';

class CardMovie extends StatefulWidget {
  final Movie movie;
  final String typeSearchMovies;
  final bool cardReduced;
  const CardMovie({
    super.key,
    required this.movie,
    required this.typeSearchMovies,
    required this.cardReduced,
  });

  @override
  State<CardMovie> createState() => _CardMovieState();
}

class _CardMovieState extends State<CardMovie> {
  @override
  Widget build(BuildContext context) {
    if (widget.cardReduced) {
      return Padding(
        padding: const EdgeInsets.only(right: 5),
        child: InkWell(
          onTap: () => Modular.to.pushNamed(
            'moviesDetails',
            arguments: {
              'movie': widget.movie,
              'typeSearchMovies': widget.typeSearchMovies
            },
          ),
          child: Stack(
            children: [
              SizedBox(
                child: Hero(
                  tag: widget.movie.posterPath + widget.typeSearchMovies,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: widget.movie.posterPath,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                      value: downloadProgress.progress,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              Positioned(
                  top: 5,
                  child: Column(
                    children: [
                      Visibility(
                        visible: widget.movie.releaseDate.isSoon(),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: Text(
                              'Em Breve',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: widget.movie.releaseDate.isNovelty(),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: Text(
                              'Novo',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8),
        child: InkWell(
          onTap: () => Modular.to.pushNamed(
            'moviesDetails',
            arguments: {
              'movie': widget.movie,
              'typeSearchMovies': widget.typeSearchMovies
            },
          ),
          child: Row(
            children: [
              SizedBox(
                height: 200,
                child: Hero(
                  tag: widget.movie.posterPath + widget.typeSearchMovies,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: widget.movie.posterPath,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                      value: downloadProgress.progress,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: SizedBox(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(widget.movie.title, textAlign: TextAlign.center),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber.shade600,
                          ),
                          Text(widget.movie.voteAverage.toStringAsFixed(1)),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(widget.movie.releaseDate.dayMonthYear()),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }
  }
}
