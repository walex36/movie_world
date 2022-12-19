import 'package:lib_core/lib_core.dart';

class TmdbConst {
  static String movieById({required int idMovie}) =>
      '/movie/$idMovie?api_key=$tmdbKey&language=pt-BR';
  static String moviesPopular({required int page}) =>
      '/movie/popular?api_key=$tmdbKey&language=pt-BR&page=1';
  static String moviesTrending({required int page, required String time}) =>
      '/trending/movie/$time?api_key=$tmdbKey&language=pt-BR&page=1';
  static String creditsMovieById({required int idMovie}) =>
      '/movie/$idMovie/credits?api_key=$tmdbKey&language=pt-BR';
  static String watchMovie({required int idMovie}) =>
      '/movie/$idMovie/watch/providers?api_key=$tmdbKey';

  /// Series
  static String serieById({required int idMovie}) =>
      '/tv/$idMovie?api_key=$tmdbKey&language=pt-BR';
  static String seriePopular({required int page}) =>
      '/tv/popular?api_key=$tmdbKey&language=pt-BR&page=1';
  static String serieTrending({required int page, required String time}) =>
      '/trending/tv/$time?api_key=$tmdbKey&language=pt-BR&page=1';
  static String creditsTvById({required int idSerie}) =>
      '/tv/$idSerie/credits?api_key=$tmdbKey&language=pt-BR';
  static String watchSerie({required int idSerie}) =>
      '/tv/$idSerie/watch/providers?api_key=$tmdbKey&language=pt-BR';
  static String episodes({required int idSerie, required int seasonNumber}) =>
      '/tv/$idSerie/season/$seasonNumber?api_key=$tmdbKey&language=pt-BR';
}
