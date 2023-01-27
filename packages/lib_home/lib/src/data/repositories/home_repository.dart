// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'package:dartz/dartz.dart';
import 'package:lib_core/src/error/failures.dart';
import 'package:lib_home/src/data/datasources/i_home_remote_datasource.dart';
import 'package:lib_home/src/domain/repositories/i_home_repository.dart';

class HomeRepository implements IHomeRepository {
  final IHomeRemoteDatasource _homeRemoteDatasource;

  HomeRepository({required IHomeRemoteDatasource homeRemoteDatasource})
      : _homeRemoteDatasource = homeRemoteDatasource;

  @override
  Future<Either<HomeFailure, List<Map<String, dynamic>>>> getTrending(
      {required int page}) async {
    try {
      final List<Map<String, dynamic>> result =
          await _homeRemoteDatasource.getTrending(page: page);

      return Right(result);
    } catch (e) {
      return const Left(HomeFailure());
    }
  }
}
