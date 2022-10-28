import 'package:lib_core/lib_core.dart';

class TmdbConst {
  static String movieById({required int idMovie}) =>
      '/movie/$idMovie?api_key=$tmdbKey&language=pt-BR';
  static String moviesPopular({required int page}) =>
      '/movie/popular?api_key=$tmdbKey&language=pt-BR&page=1';
  static String moviesTrending({required int page, required String time}) =>
      '/trending/movie/$time?api_key=$tmdbKey&language=pt-BR&page=1';
  static String creditsById({required int idMovie}) =>
      '/movie/$idMovie/credits?api_key=$tmdbKey&language=pt-BR';
}
