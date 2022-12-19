import 'package:flutter/material.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_series/lib_series.dart';

class CardSerie extends StatefulWidget {
  final Serie serie;
  final TypeSearchSeries typeSearchSeries;
  const CardSerie({
    super.key,
    required this.serie,
    required this.typeSearchSeries,
  });

  @override
  State<CardSerie> createState() => _CardSerieState();
}

class _CardSerieState extends State<CardSerie> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Modular.to.pushNamed(
        'seriesDetails',
        arguments: {
          'serie': widget.serie,
          'typeSearchSeries': widget.typeSearchSeries.name
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
                tag: widget.serie.posterPath + widget.typeSearchSeries.name,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: widget.serie.posterPath,
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
                Text("${widget.serie.voteAverage} / 10"),
                Text(
                  widget.serie.name,
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
