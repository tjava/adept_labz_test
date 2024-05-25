import 'package:adept_labz_test/core/services/api_service.dart';
import 'package:adept_labz_test/features/posts/data/models/comment_model.dart';
import 'package:adept_labz_test/features/posts/data/models/post_model.dart';
import 'package:injectable/injectable.dart';

abstract class PostsRemoteDatasource {
  Future<List<PostModel>> getPosts();
  Future<List<CommentModel>> getComments();
}

@LazySingleton(as: PostsRemoteDatasource)
class PostsRemoteDatasourceImpl implements PostsRemoteDatasource {
  final ApiService apiService;
  PostsRemoteDatasourceImpl(this.apiService);

  @override
  Future<List<PostModel>> getPosts() async {
    return await apiService.getPosts();
  }

  @override
  Future<List<CommentModel>> getComments() async {
    return await apiService.getComments();
  }
}
