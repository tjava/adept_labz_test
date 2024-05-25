import 'package:adept_labz_test/features/posts/domain/entities/comment_entity.dart';
import 'package:adept_labz_test/features/posts/domain/entities/post_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:adept_labz_test/core/errors/failures.dart';

abstract class PostsRepository {
  Future<Either<Failure, List<PostEntity>>> getPosts();
  Future<Either<Failure, List<CommentEntity>>> getComments();
}
