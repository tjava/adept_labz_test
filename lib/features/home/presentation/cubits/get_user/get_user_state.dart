part of 'get_user_cubit.dart';

sealed class GetUserState extends Equatable {
  const GetUserState();

  @override
  List<Object> get props => [];
}

final class GetUserInitial extends GetUserState {}

class Loading extends GetUserState {
  const Loading();
}

class Loaded extends GetUserState {
  final UserEntity userEntity;
  const Loaded(this.userEntity);

  @override
  List<Object> get props => [userEntity];
}

class Error extends GetUserState {
  final String message;

  const Error(this.message);

  @override
  List<Object> get props => [message];
}
