import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:series/series.dart';
import 'presentation/controller/home_series_controller/home_series_bloc.dart';
import 'presentation/controller/list_series_controller/list_series_bloc.dart';
import 'presentation/pages/home_series_page.dart';

class SeriesModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        /// Bloc
        Bind((i) => HomeSeriesBloc()),
        Bind.factory(
          (i) => ListSeriesBloc(
            getSeriesPopularUsecase: i(),
            getSeriesTrendingUsecase: i(),
          ),
        ),
        Bind.singleton(
          (i) => DetailsSeriesBloc(
              getSeriesUsecase: i(),
              getHashImageUsecase: i(),
              getCreditsSeriesUsecase: i(),
              getWatchSeriesUsecase: i(),
              getEpisodesUsecase: i()),
        ),

        /// Usecases
        /// Repository
        /// Datasources
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => const HomeSeriesPage(),
        ),
        ChildRoute(
          '/seriesDetails',
          child: (_, args) => DetailsSeriePage(
            serie: args.data['serie'],
            typeSearchSerie: args.data['typeSearchSerie'],
          ),
        )
      ];
}
