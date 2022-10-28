import 'package:flutter/material.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_movies/lib_movies.dart';
import 'package:movies/src/presentation/widgets/card_actor.dart';
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
                                Text(state.movie.releaseDate.year.toString()),
                              ],
                            )
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
