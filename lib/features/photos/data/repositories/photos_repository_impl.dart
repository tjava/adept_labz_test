import 'package:adept_labz_test/core/errors/exceptions.dart';
import 'package:adept_labz_test/features/photos/data/datasources/photos_remote_datasource.dart';
import 'package:adept_labz_test/features/photos/data/models/photo_model.dart';
import 'package:adept_labz_test/features/photos/domain/repositories/photos_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:adept_labz_test/core/errors/failures.dart';

@LazySingleton(as: PhotosRepository)
class PhotosRepositoryImpl implements PhotosRepository {
  final PhotosRemoteDatasource photosRemoteDatasource;
  const PhotosRepositoryImpl(this.photosRemoteDatasource);

  @override
  Future<Either<Failure, List<PhotoModel>>> getPhotos() async {
    try {
      final List<PhotoModel> listPhotoModel = await photosRemoteDatasource.getPhotos();

      return Right<Failure, List<PhotoModel>>(listPhotoModel);
    } on ServerException catch (error) {
      if (error.statusCode >= 500) {
        return Left<Failure, List<PhotoModel>>(
          ServerFailure(
            message: error.message,
            statusCode: error.statusCode,
          ),
        );
      }

      return Left<Failure, List<PhotoModel>>(GenericFailure(message: error.message));
    }
  }
}
