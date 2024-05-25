part of 'get_photos_cubit.dart';

sealed class GetPhotosState extends Equatable {
  const GetPhotosState();

  @override
  List<Object> get props => [];
}

final class GetPhotosInitial extends GetPhotosState {}

class Loading extends GetPhotosState {
  const Loading();
}

class Loaded extends GetPhotosState {
  final List<PhotoEntity> listPhotoEntity;
  const Loaded(this.listPhotoEntity);

  @override
  List<Object> get props => [listPhotoEntity];
}

class Error extends GetPhotosState {
  final String message;

  const Error(this.message);

  @override
  List<Object> get props => [message];
}
