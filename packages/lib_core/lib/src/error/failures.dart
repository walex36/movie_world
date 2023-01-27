import 'package:lib_dependencies/lib_dependencies.dart';

abstract class IFailure extends Equatable {
  final String message;

  const IFailure(this.message);

  @override
  List<Object?> get props => [
        message,
      ];
}

class HomeFailure extends IFailure {
  const HomeFailure({
    String message = 'Não foi possivel buscar filmes e series',
  }) : super(message);
}

class MovieFailure extends IFailure {
  const MovieFailure({
    String message = 'Não foi possivel buscar filmes',
  }) : super(message);
}

class SerieFailure extends IFailure {
  const SerieFailure({
    String message = 'Não foi possivel buscar series',
  }) : super(message);
}

class InitializersFailure extends IFailure {
  const InitializersFailure(
      {String message = 'Não foi possivel inicializar modulos'})
      : super(message);
}

class HashFailure extends IFailure {
  const HashFailure({
    String message = 'Não foi possivel converter image',
  }) : super(message);
}
