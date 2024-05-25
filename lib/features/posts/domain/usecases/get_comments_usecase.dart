import 'package:adept_labz_test/features/posts/domain/entities/comment_entity.dart';
import 'package:adept_labz_test/features/posts/domain/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:adept_labz_test/core/errors/failures.dart';
import 'package:adept_labz_test/core/usecase/usecase.dart';

@LazySingleton()
class GetCommentsUsecase extends UsecaseWithoutParams<List<CommentEntity>> {
  final PostsRepository postsRepository;

  GetCommentsUsecase({
    required this.postsRepository,
  });

  @override
  Future<Either<Failure, List<CommentEntity>>> call() {
    return postsRepository.getComments();
  }
}
