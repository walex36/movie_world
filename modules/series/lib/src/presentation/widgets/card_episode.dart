import 'package:flutter/material.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:series/src/domain/domain.dart';

class CardEpisode extends StatefulWidget {
  final Episode episode;
  final String posterSerie;
  const CardEpisode({
    super.key,
    required this.episode,
    required this.posterSerie,
  });

  @override
  State<CardEpisode> createState() => _CardEpisodeState();
}

class _CardEpisodeState extends State<CardEpisode> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => Modular.to.pushNamed(
      //   'moviesDetails',
      //   arguments: {
      //     'movie': widget.movie,
      //     'typeSearchMovies': widget.typeSearchMovies.name
      //   },
      // ),
      child: Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 250),
          child: Column(
            children: [
              SizedBox(
                height: 150,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: widget.episode.stillPath.isEmpty
                      ? widget.posterSerie
                      : widget.episode.stillPath,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                    value: downloadProgress.progress,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Column(
                children: [
                  Text(
                    widget.episode.name,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.fade,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
