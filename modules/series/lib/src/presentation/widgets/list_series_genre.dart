import 'package:flutter/material.dart';
import 'package:lib_core/lib_core.dart';
import 'package:series/src/domain/domain.dart';
import 'package:series/series.dart';

class ListSeriesGenre extends StatelessWidget {
  final List<Map<Genre, List<Serie>>> seriesByGenre;
  const ListSeriesGenre({super.key, required this.seriesByGenre});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: seriesByGenre
          .map(
            (genreAndSeries) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Séries de ${genreAndSeries.keys.first.name}',
                    style: const TextStyle(
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
                      children: genreAndSeries.values.first
                          .map(
                            (serie) => CardSerie(
                              serie: serie,
                              typeSearchSeries: TypeSearchSeries.genre.name +
                                  genreAndSeries.keys.first.name,
                              cardReduced: true,
                            ),
                          )
                          .toList()),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
