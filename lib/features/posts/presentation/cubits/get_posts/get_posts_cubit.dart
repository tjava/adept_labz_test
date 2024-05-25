import 'package:adept_labz_test/core/errors/failures.dart';
import 'package:adept_labz_test/features/posts/domain/entities/post_entity.dart';
import 'package:adept_labz_test/features/posts/domain/usecases/get_posts_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'get_posts_state.dart';

@injectable
class GetPostsCubit extends Cubit<GetPostsState> {
  final GetPostsUsecase getPostsUsecase;
  GetPostsCubit(this.getPostsUsecase) : super(GetPostsInitial());

  Future<void> getPosts() async {
    emit(const Loading());

    final result = await getPostsUsecase();

    result.fold(
      (Failure failure) {
        if (failure is ServerFailure) {
          emit(Error(failure.message!));
        } else {
          emit(Error(failure.message!));
        }
      },
      (List<PostEntity> listPostEntity) => emit(Loaded(listPostEntity)),
    );
  }
}
