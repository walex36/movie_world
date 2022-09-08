import 'package:lib_dependencies/lib_dependencies.dart';

abstract class IFailure extends Equatable {
  final String message;

  const IFailure(this.message);

  @override
  List<Object?> get props => [
        message,
      ];
}

class MovieFailure extends IFailure {
  const MovieFailure({
    String message = 'Não foi possivel buscar filmes',
  }) : super(message);
}

class InitializersFailure extends IFailure {
  const InitializersFailure(
      {String message = 'Não foi possivel inicializar modulos'})
      : super(message);
}
