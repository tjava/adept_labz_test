import 'package:adept_labz_test/features/home/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:adept_labz_test/core/errors/failures.dart';

abstract class HomeRepository {
  Future<Either<Failure, UserEntity>> getUser();
}
