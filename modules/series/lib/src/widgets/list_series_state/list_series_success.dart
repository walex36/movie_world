import 'package:flutter/material.dart';
import 'package:lib_series/lib_series.dart';
import 'package:series/src/widgets/card_serie.dart';

class ListSeriesSuccess extends StatelessWidget {
  final String titleList;
  final List<Serie> listSeries;
  final TypeSearchSeries typeSearchSeries;
  const ListSeriesSuccess({
    super.key,
    required this.titleList,
    required this.listSeries,
    required this.typeSearchSeries,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              titleList,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 280,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              children: listSeries
                  .map((serie) => CardSerie(
                        serie: serie,
                        typeSearchSeries: typeSearchSeries,
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
