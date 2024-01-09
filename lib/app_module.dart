import 'package:home/home.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:movies/movies.dart';
import 'package:series/series.dart';

class AppModule extends Module {
  static String get initialRoute => RoutesConst.home;

  @override
  void routes(r) {
    r.module(RoutesConst.home, module: HomeModule());
    r.module(RoutesConst.movies, module: MoviesModule());
    r.module(RoutesConst.series, module: SeriesModule());
  }
}
