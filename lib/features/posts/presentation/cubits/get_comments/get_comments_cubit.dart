import 'package:adept_labz_test/core/errors/failures.dart';
import 'package:adept_labz_test/features/posts/domain/entities/comment_entity.dart';
import 'package:adept_labz_test/features/posts/domain/usecases/get_comments_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'get_comments_state.dart';

@injectable
class GetCommentsCubit extends Cubit<GetCommentsState> {
  final GetCommentsUsecase getCommentsUsecase;
  GetCommentsCubit(this.getCommentsUsecase) : super(GetCommentsInitial());

  Future<void> getComments() async {
    emit(const Loading());

    final result = await getCommentsUsecase();

    result.fold(
      (Failure failure) {
        if (failure is ServerFailure) {
          emit(Error(failure.message!));
        } else {
          emit(Error(failure.message!));
        }
      },
      (List<CommentEntity> listCommentEntity) => emit(Loaded(listCommentEntity)),
    );
  }
}
