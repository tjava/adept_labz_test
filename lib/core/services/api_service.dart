import 'package:adept_labz_test/features/albums/data/models/album_model.dart';
import 'package:adept_labz_test/features/home/data/models/user_model.dart';
import 'package:adept_labz_test/features/photos/data/models/photo_model.dart';
import 'package:adept_labz_test/features/posts/data/models/comment_model.dart';
import 'package:adept_labz_test/features/posts/data/models/post_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart' as retrofit;
import 'package:adept_labz_test/core/constants/api_constant.dart';

part 'api_service.g.dart';

@retrofit.RestApi(baseUrl: baseUrl)
abstract class ApiService {
  static Future<ApiService> getInstance() async {
    return ApiService(Dio());
  }

  factory ApiService(Dio dio) = _ApiService;

  @retrofit.GET(albumsEndpoint)
  Future<List<AlbumModel>> getAlbums();

  @retrofit.GET(photosEndpoint)
  Future<List<PhotoModel>> getPhotos();

  @retrofit.GET(postsEndpoint)
  Future<List<PostModel>> getPosts();

  @retrofit.GET(commentsEndpoint)
  Future<List<CommentModel>> getComments();

  @retrofit.GET(usersEndpoint)
  Future<List<UserModel>> getUsers();
}
