import 'package:flutter/material.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_movies/lib_movies.dart';
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
  void dispose() {
    bloc.add(ResetBlurMovieDetails());
    super.dispose();
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
            ListView(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Center(
                        child: SizedBox(
                          height: 200,
                          width: 150,
                          child: Hero(
                            tag: widget.movieCache.posterPath,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                imageUrl:
                                    'https://image.tmdb.org/t/p/w500${widget.movieCache.posterPath}',
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Text(
                  state.movie.title,
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  state.movie.genres.toString(),
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
