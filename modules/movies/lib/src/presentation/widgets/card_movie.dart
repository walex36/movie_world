import 'package:flutter/material.dart';
import 'package:lib_movies/lib_movies.dart';

class CardMovie extends StatelessWidget {
  final Movie movie;
  const CardMovie({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 5),
      child: Column(
        children: [
          Container(
            height: 200,
            width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                    ))),
          ),
          const SizedBox(
            height: 5,
          ),
          Column(
            children: [
              Text("${movie.voteAverage} / 10"),
              Text(
                movie.title,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.fade,
              ),
            ],
          )
        ],
      ),
    );
  }
}
