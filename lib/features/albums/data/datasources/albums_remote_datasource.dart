import 'package:adept_labz_test/core/services/api_service.dart';
import 'package:adept_labz_test/features/albums/data/models/album_model.dart';
import 'package:injectable/injectable.dart';

abstract class AlbumsRemoteDatasource {
  Future<List<AlbumModel>> getAlbums();
}

@LazySingleton(as: AlbumsRemoteDatasource)
class AlbumsRemoteDatasourceImpl implements AlbumsRemoteDatasource {
  final ApiService apiService;
  AlbumsRemoteDatasourceImpl(this.apiService);

  @override
  Future<List<AlbumModel>> getAlbums() async {
    return await apiService.getAlbums();
  }
}
