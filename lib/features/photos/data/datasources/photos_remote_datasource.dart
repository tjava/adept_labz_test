import 'package:adept_labz_test/core/services/api_service.dart';
import 'package:adept_labz_test/features/photos/data/models/photo_model.dart';
import 'package:injectable/injectable.dart';

abstract class PhotosRemoteDatasource {
  Future<List<PhotoModel>> getPhotos();
}

@LazySingleton(as: PhotosRemoteDatasource)
class PhotosRemoteDatasourceImpl implements PhotosRemoteDatasource {
  final ApiService apiService;
  PhotosRemoteDatasourceImpl(this.apiService);

  @override
  Future<List<PhotoModel>> getPhotos() async {
    return await apiService.getPhotos();
  }
}
