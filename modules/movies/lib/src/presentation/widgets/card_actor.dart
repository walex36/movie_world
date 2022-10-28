import 'package:flutter/material.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_movies/lib_movies.dart';

class CardActor extends StatefulWidget {
  final Actor actor;
  const CardActor({
    super.key,
    required this.actor,
  });

  @override
  State<CardActor> createState() => _CardActorState();
}

class _CardActorState extends State<CardActor> {
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
            child: Hero(
              tag: widget.actor.profilePath,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: widget.actor.profilePath,
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
              // Text("${widget.movie.voteAverage} / 10"),
              Text(
                widget.actor.originalName + ' / ' + widget.actor.character,
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
