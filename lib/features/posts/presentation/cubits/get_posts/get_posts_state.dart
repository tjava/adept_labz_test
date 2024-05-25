part of 'get_posts_cubit.dart';

sealed class GetPostsState extends Equatable {
  const GetPostsState();

  @override
  List<Object> get props => [];
}

final class GetPostsInitial extends GetPostsState {}

class Loading extends GetPostsState {
  const Loading();
}

class Loaded extends GetPostsState {
  final List<PostEntity> listPostEntity;
  const Loaded(this.listPostEntity);

  @override
  List<Object> get props => [listPostEntity];
}

class Error extends GetPostsState {
  final String message;

  const Error(this.message);

  @override
  List<Object> get props => [message];
}
