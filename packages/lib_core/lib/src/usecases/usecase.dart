import 'package:lib_core/lib_core.dart';
import 'package:lib_dependencies/lib_dependencies.dart';

abstract class UseCase<Type, Params> {
  Future<Either<IFailure, Type>> call(Params params);
}

abstract class UseCaseSync<Type, Params> {
  Either<IFailure, Type> call(Params params);
}

void voidRight;

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
