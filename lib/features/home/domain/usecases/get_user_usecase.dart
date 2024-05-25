import 'package:adept_labz_test/features/home/domain/entities/user_entity.dart';
import 'package:adept_labz_test/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:adept_labz_test/core/errors/failures.dart';
import 'package:adept_labz_test/core/usecase/usecase.dart';

@LazySingleton()
class GetUserUsecase extends UsecaseWithoutParams<UserEntity> {
  final HomeRepository homeRepository;

  GetUserUsecase({
    required this.homeRepository,
  });

  @override
  Future<Either<Failure, UserEntity>> call() {
    return homeRepository.getUser();
  }
}
