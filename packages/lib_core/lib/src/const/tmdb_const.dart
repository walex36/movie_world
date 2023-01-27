import 'package:lib_core/lib_core.dart';

class TmdbConst {
  /// All
  static String trending({required int page}) =>
      '/trending/all/week?api_key=$tmdbKey&language=pt-BR&page=$page';

  /// Movies
  static String movieById({required int idMovie}) =>
      '/movie/$idMovie?api_key=$tmdbKey&language=pt-BR';
  static String moviesPopular({required int page}) =>
      '/movie/popular?api_key=$tmdbKey&language=pt-BR&page=$page';
  static String moviesTrending({required int page, required String time}) =>
      '/trending/movie/$time?api_key=$tmdbKey&language=pt-BR&page=$page';
  static String creditsMovieById({required int idMovie}) =>
      '/movie/$idMovie/credits?api_key=$tmdbKey&language=pt-BR';
  static String watchMovie({required int idMovie}) =>
      '/movie/$idMovie/watch/providers?api_key=$tmdbKey&language=pt-BR';
  static String genreMovie() =>
      '/genre/movie/list?api_key=$tmdbKey&language=pt-BR';
  static String moviesByGenre({required int idGenre, required int page}) =>
      '/discover/movie?api_key=$tmdbKey&language=pt-BR&sort_by=popularity.desc&'
      'include_adult=false&include_video=false&page=1&with_genres=$idGenre&'
      'with_watch_monetization_types=flatrate';

  /// Series
  static String serieById({required int idMovie}) =>
      '/tv/$idMovie?api_key=$tmdbKey&language=pt-BR';
  static String seriePopular({required int page}) =>
      '/tv/popular?api_key=$tmdbKey&language=pt-BR&page=$page';
  static String serieTrending({required int page, required String time}) =>
      '/trending/tv/$time?api_key=$tmdbKey&language=pt-BR&page=$page';
  static String creditsTvById({required int idSerie}) =>
      '/tv/$idSerie/credits?api_key=$tmdbKey&language=pt-BR';
  static String watchSerie({required int idSerie}) =>
      '/tv/$idSerie/watch/providers?api_key=$tmdbKey&language=pt-BR';
  static String episodes({required int idSerie, required int seasonNumber}) =>
      '/tv/$idSerie/season/$seasonNumber?api_key=$tmdbKey&language=pt-BR';
  static String genreSerie() =>
      '/genre/tv/list?api_key=$tmdbKey&language=pt-BR';
  static String seriesByGenre({required int idGenre, required int page}) =>
      '/discover/tv?api_key=$tmdbKey&language=pt-BR&sort_by=popularity.desc&'
      'include_adult=false&include_video=false&page=1&with_genres=$idGenre&'
      'with_watch_monetization_types=flatrate';
}
