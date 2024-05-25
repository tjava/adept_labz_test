import 'package:adept_labz_test/core/errors/exceptions.dart';
import 'package:adept_labz_test/features/albums/data/datasources/albums_remote_datasource.dart';
import 'package:adept_labz_test/features/albums/data/models/album_model.dart';
import 'package:adept_labz_test/features/albums/domain/repositories/albums_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:adept_labz_test/core/errors/failures.dart';

@LazySingleton(as: AlbumsRepository)
class AlbumsRepositoryImpl implements AlbumsRepository {
  final AlbumsRemoteDatasource albumsRemoteDatasource;
  const AlbumsRepositoryImpl(this.albumsRemoteDatasource);

  @override
  Future<Either<Failure, List<AlbumModel>>> getAlbums() async {
    try {
      final List<AlbumModel> listAlbumModel = await albumsRemoteDatasource.getAlbums();

      return Right<Failure, List<AlbumModel>>(listAlbumModel);
    } on ServerException catch (error) {
      if (error.statusCode >= 500) {
        return Left<Failure, List<AlbumModel>>(
          ServerFailure(
            message: error.message,
            statusCode: error.statusCode,
          ),
        );
      }

      return Left<Failure, List<AlbumModel>>(GenericFailure(message: error.message));
    }
  }
}
