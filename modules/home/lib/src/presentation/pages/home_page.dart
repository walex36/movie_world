import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home/src/controller/home_bloc/home_bloc.dart';
import 'package:home/src/widgets/home_state/home_success.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc bloc = Modular.get();

  @override
  void initState() {
    super.initState();
    bloc.add(HomeInit());
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
          'Movie World',
          style: TextStyle(
            color: theme.colorScheme.onPrimary,
            fontSize: 18,
          ),
        ),
        toolbarHeight: 71,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        bloc: bloc,
        builder: (context, state) {
          switch (state.status) {
            case ControlStatus.initial:
            case ControlStatus.empty:
            case ControlStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case ControlStatus.success:
              return const HomeSuccess();
            case ControlStatus.failure:
            default:
              return const Center(child: Text('Falha ao iniciar'));
          }
        },
      ),
    );
  }
}
