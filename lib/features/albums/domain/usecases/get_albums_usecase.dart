import 'package:adept_labz_test/features/albums/domain/entities/album_entity.dart';
import 'package:adept_labz_test/features/albums/domain/repositories/albums_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:adept_labz_test/core/errors/failures.dart';
import 'package:adept_labz_test/core/usecase/usecase.dart';

@LazySingleton()
class GetAlbumsUsecase extends UsecaseWithoutParams<List<AlbumEntity>> {
  final AlbumsRepository albumsRepository;

  GetAlbumsUsecase({
    required this.albumsRepository,
  });

  @override
  Future<Either<Failure, List<AlbumEntity>>> call() {
    return albumsRepository.getAlbums();
  }
}
