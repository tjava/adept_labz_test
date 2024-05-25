part of 'get_albums_cubit.dart';

sealed class GetAlbumsState extends Equatable {
  const GetAlbumsState();

  @override
  List<Object> get props => [];
}

final class GetAlbumsInitial extends GetAlbumsState {}

class Loading extends GetAlbumsState {
  const Loading();
}

class Loaded extends GetAlbumsState {
  final List<AlbumEntity> listAlbumEntity;
  const Loaded(this.listAlbumEntity);

  @override
  List<Object> get props => [listAlbumEntity];
}

class Error extends GetAlbumsState {
  final String message;

  const Error(this.message);

  @override
  List<Object> get props => [message];
}
