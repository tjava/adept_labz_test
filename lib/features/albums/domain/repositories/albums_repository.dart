import 'package:adept_labz_test/features/albums/domain/entities/album_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:adept_labz_test/core/errors/failures.dart';

abstract class AlbumsRepository {
  Future<Either<Failure, List<AlbumEntity>>> getAlbums();
}
