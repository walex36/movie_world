import 'package:flutter/material.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_core/lib_core.dart';
import 'package:movies/movies.dart';
import 'package:series/series.dart';
import '../card_episode.dart';

class DetailsSeriesSuccess extends StatefulWidget {
  final Serie serieCache;
  final bool isBlur;
  const DetailsSeriesSuccess({
    super.key,
    required this.serieCache,
    required this.isBlur,
  });

  @override
  State<DetailsSeriesSuccess> createState() => _DetailsSeriesSuccessState();
}

class _DetailsSeriesSuccessState extends State<DetailsSeriesSuccess> {
  DetailsSeriesBloc bloc = Modular.get<DetailsSeriesBloc>();
  ScrollController episodesScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<DetailsSeriesBloc, DetailsSeriesState>(
      bloc: bloc,
      builder: (context, state) {
        return Stack(
          children: [
            AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: state.blurImage.isNotEmpty ? 1 : 0,
              child: Visibility(
                visible: widget.isBlur,
                child: SizedBox(
                  height: size.height,
                  width: size.width,
                  child: BlurHash(
                    hash: state.blurImage,
                    imageFit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: 250,
                            width: 170,
                            child: Hero(
                              tag: widget.serieCache.posterPath +
                                  state.typeSearchSeries,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: widget.serieCache.posterPath,
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                              top: 5,
                              child: Column(
                                children: [
                                  Visibility(
                                    visible: state.serie.firstAirDate.isSoon(),
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
                                    visible:
                                        state.serie.firstAirDate.isNovelty(),
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
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              state.serie.name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber.shade600,
                                ),
                                Text(
                                  state.serie.voteAverage.toStringAsFixed(1),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  state.serie.lastAirDate.dayMonthYear(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Wrap(
                              alignment: WrapAlignment.center,
                              children: state.serie.genres
                                  .map((genre) => Card(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(4),
                                          child: Text(
                                            genre.name,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      state.serie.tagline,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     state.serie.budget > 0
                  //         ? Column(
                  //             children: [
                  //               const Text(
                  //                 'Orçamento',
                  //                 style: TextStyle(
                  //                   color: Colors.white,
                  //                   fontWeight: FontWeight.w600,
                  //                   fontSize: 14,
                  //                 ),
                  //               ),
                  //               Text(
                  //                 'R\$ ' + state.movie.budget.moneyFormat(),
                  //                 style: const TextStyle(
                  //                   fontWeight: FontWeight.w400,
                  //                 ),
                  //               ),
                  //             ],
                  //           )
                  //         : Container(),
                  //     state.movie.budget > 0
                  //         ? Column(
                  //             children: [
                  //               const Text(
                  //                 'Tempo',
                  //                 style: TextStyle(
                  //                   color: Colors.white,
                  //                   fontWeight: FontWeight.w600,
                  //                   fontSize: 14,
                  //                 ),
                  //               ),
                  //               Text(
                  //                 Duration(seconds: state.movie.runtime)
                  //                     .secondsToHour(),
                  //                 style: const TextStyle(
                  //                   fontWeight: FontWeight.w400,
                  //                 ),
                  //               ),
                  //             ],
                  //           )
                  //         : Container(),
                  //   ],
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Produzido por',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  state.serie.productionCompanies.isEmpty
                      ? Container()
                      : Wrap(
                          alignment: WrapAlignment.center,
                          children: state.serie.productionCompanies
                              .map((company) => Card(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Tooltip(
                                            triggerMode: TooltipTriggerMode.tap,
                                            message: company.name,
                                            child: company.logoPath.isNotEmpty
                                                ? SizedBox(
                                                    height: 20,
                                                    child: CachedNetworkImage(
                                                      fit: BoxFit.cover,
                                                      imageUrl:
                                                          company.logoPath,
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Container(),
                                                    ),
                                                  )
                                                : Text(
                                                    company.name,
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Sinopse',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        state.serie.overview,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Visibility(
                    visible: state.serie.seasons.isNotEmpty &&
                        state.seasonSelect != null,
                    child: Row(
                      children: [
                        Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton<Season>(
                              value: state.seasonSelect,
                              isDense: true,
                              dropdownColor: Colors.white,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                              underline: const SizedBox.shrink(),
                              icon: const Icon(
                                Icons.arrow_drop_down_outlined,
                                color: Colors.black,
                              ),
                              items: state.serie.seasons
                                  .map(
                                    (e) => DropdownMenuItem<Season>(
                                      value: e,
                                      child: Text(e.name),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                if (state.seasonSelect!.name != value!.name) {
                                  bloc.add(
                                    SelectSeason(
                                      season: value,
                                    ),
                                  );
                                  if (state.status.isSuccess) {
                                    setState(() {
                                      episodesScrollController.jumpTo(0);
                                    });
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 200,
                    child: state.status.isLoading
                        ? const Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ],
                          )
                        : ListView(
                            controller: episodesScrollController,
                            scrollDirection: Axis.horizontal,
                            children: state.episodeSeasonSelect
                                .map((ep) => CardEpisode(
                                      episode: ep,
                                      posterSerie: state.serie.posterPath,
                                    ))
                                .toList(),
                          ),
                  ),

                  state.watchCountry.isEmpty
                      ? Container()
                      : ListWhereWatch(
                          listWatch: state.watchCountry,
                          watchSelect: state.watchCountrySelect ??
                              state.watchCountry.first,
                        ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Atores',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: state.credits
                          .map((actor) => actor.profilePath.isNotEmpty
                              ? CardActor(actor: actor)
                              : Container())
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
