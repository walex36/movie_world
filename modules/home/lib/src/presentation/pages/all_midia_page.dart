import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home/src/controller/all_midia_bloc/all_midia_bloc.dart';
import 'package:home/src/controller/home_bloc/home_bloc.dart';
import 'package:home/src/widgets/all_media_state/all_media_success.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';

class AllMediaPage extends StatefulWidget {
  final List<dynamic> listMedia;
  final String midiaType;
  const AllMediaPage({
    super.key,
    required this.listMedia,
    required this.midiaType,
  });

  @override
  State<AllMediaPage> createState() => _AllMediaPageState();
}

class _AllMediaPageState extends State<AllMediaPage> {
  late AllMidiaBloc bloc = Modular.get<AllMidiaBloc>();

  @override
  void initState() {
    super.initState();
    bloc.add(AllMidiaInitial(
      listMedia: widget.listMedia,
    ));
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
      body: BlocBuilder<AllMidiaBloc, AllMidiaState>(
        bloc: bloc,
        builder: (context, state) {
          switch (state.status) {
            case ControlStatus.initial:
            case ControlStatus.empty:
            case ControlStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case ControlStatus.success:
              return AllMediaSuccess(
                listMedia: state.listMidia,
                midiaType: widget.midiaType,
                updateEvent: HomeInit(),
              );
            case ControlStatus.failure:
            default:
              return const Center(child: Text('Falha ao iniciar'));
          }
        },
      ),
    );
  }
}
