import 'package:adept_labz_test/features/photos/domain/entities/photo_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:adept_labz_test/core/errors/failures.dart';

abstract class PhotosRepository {
  Future<Either<Failure, List<PhotoEntity>>> getPhotos();
}
