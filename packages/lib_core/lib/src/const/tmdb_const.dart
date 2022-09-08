import 'package:lib_core/lib_core.dart';

class TmdbConst {
  static String movieById(int idMovie) => '/movie/$idMovie?api_key=$tmdbKey';
  static String get moviesPopular => '/movie/popular?api_key=$tmdbKey';
}
