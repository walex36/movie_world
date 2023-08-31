import 'package:flutter/material.dart';
import 'package:home/src/controller/home_bloc/home_bloc.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_movies/lib_movies.dart';
import 'package:lib_series/lib_series.dart';
import 'package:movies/movies.dart';
import 'package:series/series.dart';

class AllMediaSuccess extends StatefulWidget {
  final List<dynamic> listMedia;
  final String midiaType;
  final HomeEvent updateEvent;
  const AllMediaSuccess({
    super.key,
    required this.listMedia,
    required this.midiaType,
    required this.updateEvent,
  });

  @override
  State<AllMediaSuccess> createState() => _AllMediaSuccessState();
}

class _AllMediaSuccessState extends State<AllMediaSuccess> {
  HomeBloc bloc = Modular.get<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => bloc.add(widget.updateEvent),
      child: ListView(
        children: widget.listMedia.map((media) {
          if (widget.midiaType == 'tv') {
            Serie serie = media;
            return CardSerie(
              serie: serie,
              typeSearchSeries: TypeSearchSeries.trending.name,
              cardReduced: false,
            );
          } else {
            Movie movie = media;
            return CardMovie(
              movie: movie,
              typeSearchMovies: TypeSearchMovies.trending.name,
              cardReduced: false,
            );
          }
        }).toList(),
      ),
    );
  }
}
