import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import 'package:lib_series/lib_series.dart';
import 'package:series/series.dart';
import '../widgets/details_series_state/details_series_success.dart';

class DetailsSeriePage extends StatefulWidget {
  final Serie serie;
  final String typeSearchSerie;
  const DetailsSeriePage({
    super.key,
    required this.serie,
    required this.typeSearchSerie,
  });

  @override
  State<DetailsSeriePage> createState() => _DetailsSeriePageState();
}

class _DetailsSeriePageState extends State<DetailsSeriePage> {
  final DetailsSeriesBloc bloc = Modular.get();

  @override
  void initState() {
    super.initState();
    bloc.add(DetailsSeriesInitial(
      serieCache: widget.serie,
      typeSearchSeries: widget.typeSearchSerie,
    ));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: theme.colorScheme.primary,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 71,
      ),
      body: BlocBuilder<DetailsSeriesBloc, DetailsSeriesState>(
        bloc: bloc,
        builder: (context, state) {
          switch (state.status) {
            case ControlStatus.initial:
            case ControlStatus.empty:
            case ControlStatus.loading:
            case ControlStatus.success:
              return DetailsSeriesSuccess(
                serieCache: widget.serie,
              );
            case ControlStatus.failure:
            default:
              return const Center(child: Text('Falha ao carregar filme'));
          }
        },
      ),
    );
  }
}
