import 'package:adept_labz_test/core/errors/exceptions.dart';
import 'package:adept_labz_test/features/posts/data/datasources/posts_remote_datasource.dart';
import 'package:adept_labz_test/features/posts/domain/entities/comment_entity.dart';
import 'package:adept_labz_test/features/posts/domain/entities/post_entity.dart';
import 'package:adept_labz_test/features/posts/domain/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:adept_labz_test/core/errors/failures.dart';

@LazySingleton(as: PostsRepository)
class PostsRepositoryImpl implements PostsRepository {
  final PostsRemoteDatasource postsRemoteDatasource;
  const PostsRepositoryImpl(this.postsRemoteDatasource);

  @override
  Future<Either<Failure, List<PostEntity>>> getPosts() async {
    try {
      final List<PostEntity> listPostEntity = await postsRemoteDatasource.getPosts();

      return Right<Failure, List<PostEntity>>(listPostEntity);
    } on ServerException catch (error) {
      if (error.statusCode >= 500) {
        return Left<Failure, List<PostEntity>>(
          ServerFailure(
            message: error.message,
            statusCode: error.statusCode,
          ),
        );
      }

      return Left<Failure, List<PostEntity>>(GenericFailure(message: error.message));
    }
  }

  @override
  Future<Either<Failure, List<CommentEntity>>> getComments() async {
    try {
      final List<CommentEntity> listCommentEntity = await postsRemoteDatasource.getComments();

      return Right<Failure, List<CommentEntity>>(listCommentEntity);
    } on ServerException catch (error) {
      if (error.statusCode >= 500) {
        return Left<Failure, List<CommentEntity>>(
          ServerFailure(
            message: error.message,
            statusCode: error.statusCode,
          ),
        );
      }

      return Left<Failure, List<CommentEntity>>(GenericFailure(message: error.message));
    }
  }
}
