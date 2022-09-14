import 'package:flutter/material.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_movies/lib_movies.dart';

class CardMovie extends StatefulWidget {
  final Movie movie;
  const CardMovie({super.key, required this.movie});

  @override
  State<CardMovie> createState() => _CardMovieState();
}

class _CardMovieState extends State<CardMovie> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Modular.to.pushNamed(
        'moviesDetails',
        arguments: {
          'movie': widget.movie,
        },
      ),
      child: Container(
        width: 150,
        margin: const EdgeInsets.only(right: 5),
        child: Column(
          children: [
            Container(
              height: 200,
              width: 150,
              child: Hero(
                tag: widget.movie.posterPath,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: widget.movie.posterPath,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                    value: downloadProgress.progress,
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Column(
              children: [
                Text("${widget.movie.voteAverage} / 10"),
                Text(
                  widget.movie.title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
