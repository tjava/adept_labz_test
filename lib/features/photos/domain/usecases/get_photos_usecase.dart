import 'package:adept_labz_test/features/photos/domain/entities/photo_entity.dart';
import 'package:adept_labz_test/features/photos/domain/repositories/photos_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:adept_labz_test/core/errors/failures.dart';
import 'package:adept_labz_test/core/usecase/usecase.dart';

@LazySingleton()
class GetPhotosUsecase extends UsecaseWithoutParams<List<PhotoEntity>> {
  final PhotosRepository photosRepository;

  GetPhotosUsecase({
    required this.photosRepository,
  });

  @override
  Future<Either<Failure, List<PhotoEntity>>> call() {
    return photosRepository.getPhotos();
  }
}
