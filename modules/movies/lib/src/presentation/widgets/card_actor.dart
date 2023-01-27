import 'package:flutter/material.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_core/lib_core.dart';

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
          SizedBox(
            height: 200,
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: widget.actor.profilePath,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(
                  value: downloadProgress.progress,
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Column(
            children: [
              Text(
                widget.actor.knownForDepartment,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                widget.actor.originalName,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.actor.character,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ],
          )
        ],
      ),
    );
  }
}
