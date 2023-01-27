import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';
import '../controller/home_series_controller/home_series_bloc.dart';
import '../widgets/home_series_state/home_series_success.dart';

class HomeSeriesPage extends StatefulWidget {
  const HomeSeriesPage({super.key});

  @override
  State<HomeSeriesPage> createState() => _HomeSeriesPageState();
}

class _HomeSeriesPageState extends State<HomeSeriesPage> {
  final HomeSeriesBloc bloc = Modular.get();

  @override
  void initState() {
    super.initState();
    bloc.add(HomeSeriesInitial());
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: theme.colorScheme.primary,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        ),
        title: Text(
          'Series',
          style: TextStyle(
            color: theme.colorScheme.onPrimary,
            fontSize: 18,
          ),
        ),
        toolbarHeight: 71,
      ),
      body: BlocBuilder<HomeSeriesBloc, HomeSeriesState>(
        bloc: bloc,
        builder: (context, state) {
          switch (state.status) {
            case ControlStatus.initial:
            case ControlStatus.empty:
            case ControlStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case ControlStatus.success:
              return const HomeSeriesSuccess();
            case ControlStatus.failure:
            default:
              return const Center(child: Text('Falha ao carregar filmes'));
          }
        },
      ),
    );
  }
}
