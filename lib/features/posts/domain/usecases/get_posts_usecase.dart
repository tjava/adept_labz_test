import 'package:adept_labz_test/features/posts/domain/entities/post_entity.dart';
import 'package:adept_labz_test/features/posts/domain/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:adept_labz_test/core/errors/failures.dart';
import 'package:adept_labz_test/core/usecase/usecase.dart';

@LazySingleton()
class GetPostsUsecase extends UsecaseWithoutParams<List<PostEntity>> {
  final PostsRepository postsRepository;

  GetPostsUsecase({
    required this.postsRepository,
  });

  @override
  Future<Either<Failure, List<PostEntity>>> call() {
    return postsRepository.getPosts();
  }
}
