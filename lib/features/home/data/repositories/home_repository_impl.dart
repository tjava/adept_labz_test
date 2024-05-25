import 'package:adept_labz_test/core/errors/exceptions.dart';
import 'package:adept_labz_test/features/home/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:adept_labz_test/core/errors/failures.dart';
import 'package:adept_labz_test/features/home/data/datasources/home_remote_datasource.dart';
import 'package:adept_labz_test/features/home/domain/repositories/home_repository.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDatasource homeRemoteDatasource;
  const HomeRepositoryImpl(this.homeRemoteDatasource);

  @override
  Future<Either<Failure, UserEntity>> getUser() async {
    try {
      final List<UserEntity> listUserEntity = await homeRemoteDatasource.getUsers();

      return Right<Failure, UserEntity>(listUserEntity.first);
    } on ServerException catch (error) {
      if (error.statusCode >= 500) {
        return Left<Failure, UserEntity>(
          ServerFailure(
            message: error.message,
            statusCode: error.statusCode,
          ),
        );
      }

      return Left<Failure, UserEntity>(GenericFailure(message: error.message));
    }
  }
}
