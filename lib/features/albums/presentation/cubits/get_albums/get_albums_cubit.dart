import 'package:adept_labz_test/core/errors/failures.dart';
import 'package:adept_labz_test/features/albums/domain/entities/album_entity.dart';
import 'package:adept_labz_test/features/albums/domain/usecases/get_albums_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'get_albums_state.dart';

@injectable
class GetAlbumsCubit extends Cubit<GetAlbumsState> {
  final GetAlbumsUsecase getAlbumsUsecase;
  GetAlbumsCubit(this.getAlbumsUsecase) : super(GetAlbumsInitial());

  Future<void> getAlbums() async {
    emit(const Loading());

    final result = await getAlbumsUsecase();

    result.fold(
      (Failure failure) {
        if (failure is ServerFailure) {
          emit(Error(failure.message!));
        } else {
          emit(Error(failure.message!));
        }
      },
      (List<AlbumEntity> listAlbumEntity) => emit(Loaded(listAlbumEntity)),
    );
  }
}
