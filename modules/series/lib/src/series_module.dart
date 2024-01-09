import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:series/series.dart';
import 'presentation/controller/home_series_controller/home_series_bloc.dart';
import 'presentation/controller/list_series_controller/list_series_bloc.dart';
import 'presentation/pages/home_series_page.dart';

class SeriesModule extends Module {
  @override
  void binds(i) {
    /// Bloc
    i.addSingleton(HomeSeriesBloc.new);
    i.add(ListSeriesBloc.new);
    i.add(DetailsSeriesBloc.new);

    /// Usecases
    /// Repository
    /// Datasources
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (_) => const HomeSeriesPage());
    r.child(
      '/seriesDetails',
      child: (_) => DetailsSeriePage(
        serie: r.args.data['serie'],
        typeSearchSerie: r.args.data['typeSearchSerie'],
      ),
    );
  }
}
