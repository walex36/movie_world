import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_series/lib_series.dart';
import 'package:series/src/controller/details_series_controller/details_series_bloc.dart';
import 'package:series/src/controller/home_series_controller/home_series_bloc.dart';
import 'package:series/src/controller/list_series_controller/list_series_bloc.dart';
import 'package:series/src/pages/details_series_page.dart';
import 'package:series/src/pages/home_series_page.dart';

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
        Bind(
          (i) => GetSeriesPopularUsecase(repository: i()),
        ),
        Bind(
          (i) => GetSeriesTrendingUsecase(repository: i()),
        ),
        Bind(
          (i) => GetSeriesUsecase(repository: i()),
        ),
        Bind(
          (i) => GetCreditsSeriesUsecase(repository: i()),
        ),
        Bind(
          (i) => GetWatchSeriesUsecase(repository: i()),
        ),
        Bind(
          (i) => GetEpisodesUsecase(repository: i()),
        ),

        /// Repository
        Bind<ISeriesRepository>(
          (i) => SeriesRepository(remoteDatasource: i()),
        ),

        /// Datasources
        Bind<ISeriesRemoteDatasource>(
          (i) => SeriesDioDatasource(client: i()),
        ),
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
            typeSearchSerie: args.data['typeSearchSeries'],
          ),
        )
      ];
}
