import 'package:flutter/material.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_series/lib_series.dart';
import 'package:lib_core/lib_core.dart';

class CardSerie extends StatefulWidget {
  final Serie serie;
  final String typeSearchSeries;
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
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: InkWell(
        onTap: () => Modular.to.pushNamed(
          'seriesDetails',
          arguments: {
            'serie': widget.serie,
            'typeSearchSerie': widget.typeSearchSeries
          },
        ),
        child: Stack(
          children: [
            Hero(
              tag: widget.serie.posterPath + widget.typeSearchSeries,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: widget.serie.posterPath,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(
                  value: downloadProgress.progress,
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Positioned(
                top: 5,
                child: Column(
                  children: [
                    Visibility(
                      visible: widget.serie.firstAirDate.isSoon(),
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
                      visible: widget.serie.firstAirDate.isNovelty(),
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
  }
}
