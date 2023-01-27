import 'package:home/home.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_endpoint/lib_endpoint.dart';
import 'package:movies/movies.dart';
import 'package:series/series.dart';

class AppModule extends Module {
  static String get initialRoute => RoutesConst.home;

  @override
  List<Bind<Object>> get binds => [
        Bind((i) => Dio()),
        Bind(
          (i) => DioConfig(
            client: i(),
            endpointConfig: endPointConfig,
          ),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          RoutesConst.home,
          module: HomeModule(),
        ),
        ModuleRoute(
          RoutesConst.movies,
          module: MoviesModule(),
        ),
        ModuleRoute(
          RoutesConst.series,
          module: SeriesModule(),
        )
      ];
}
