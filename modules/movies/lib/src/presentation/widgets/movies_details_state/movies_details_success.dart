import 'package:flutter/material.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:movies/src/domain/domain.dart';
import 'package:movies/src/presentation/widgets/card_actor.dart';
import 'package:movies/src/presentation/widgets/list_where_watch.dart';
import '../../controller/movies_details_controller/movies_details_bloc.dart';

class MoviesDetailsSuccess extends StatefulWidget {
  final Movie movieCache;
  const MoviesDetailsSuccess({
    super.key,
    required this.movieCache,
  });

  @override
  State<MoviesDetailsSuccess> createState() => _MoviesDetailsSuccessState();
}

class _MoviesDetailsSuccessState extends State<MoviesDetailsSuccess> {
  MoviesDetailsBloc bloc = Modular.get<MoviesDetailsBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesDetailsBloc, MoviesDetailsState>(
      bloc: bloc,
      builder: (context, state) {
        return Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: AnimatedOpacity(
                opacity: state.blurImage != 'L02Fc7j[fQj[j[fQfQfQfQfQfQfQ'
                    ? 1.0
                    : 0.0,
                duration: const Duration(milliseconds: 1000),
                child: BlurHash(
                  hash: state.blurImage,
                  imageFit: BoxFit.fill,
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
                              tag: widget.movieCache.posterPath +
                                  state.typeSearchMovies,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: widget.movieCache.posterPath,
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
                                    visible: state.movie.releaseDate.isSoon(),
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
                                        state.movie.releaseDate.isNovelty(),
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
                              state.movie.title,
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
                                    state.movie.voteAverage.toStringAsFixed(1)),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(state.movie.releaseDate.dayMonthYear()),
                              ],
                            ),
                            Wrap(
                              alignment: WrapAlignment.center,
                              children: state.movie.genres
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
                      state.movie.tagline,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      state.movie.budget > 0
                          ? Column(
                              children: [
                                const Text(
                                  'Orçamento',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  'R\$ ${state.movie.budget.moneyFormat()}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            )
                          : Container(),
                      state.movie.budget > 0
                          ? Column(
                              children: [
                                const Text(
                                  'Tempo',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  Duration(seconds: state.movie.runtime)
                                      .secondsToHour(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            )
                          : Container(),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Produzido por:',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  state.movie.productionCompanies.isEmpty
                      ? Container()
                      : Wrap(
                          alignment: WrapAlignment.center,
                          children: state.movie.productionCompanies
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
                        'Sinopse:',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        state.movie.overview,
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
                    height: 10,
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
                    'Atores:',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
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
