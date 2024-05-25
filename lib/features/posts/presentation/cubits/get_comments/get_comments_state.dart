part of 'get_comments_cubit.dart';

sealed class GetCommentsState extends Equatable {
  const GetCommentsState();

  @override
  List<Object> get props => [];
}

final class GetCommentsInitial extends GetCommentsState {}

class Loading extends GetCommentsState {
  const Loading();
}

class Loaded extends GetCommentsState {
  final List<CommentEntity> listCommentEntity;
  const Loaded(this.listCommentEntity);

  @override
  List<Object> get props => [listCommentEntity];
}

class Error extends GetCommentsState {
  final String message;

  const Error(this.message);

  @override
  List<Object> get props => [message];
}
