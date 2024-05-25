import 'package:adept_labz_test/core/errors/failures.dart';
import 'package:adept_labz_test/features/photos/domain/entities/photo_entity.dart';
import 'package:adept_labz_test/features/photos/domain/usecases/get_photos_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'get_photos_state.dart';

@injectable
class GetPhotosCubit extends Cubit<GetPhotosState> {
  final GetPhotosUsecase getPhotosUsecase;
  GetPhotosCubit(this.getPhotosUsecase) : super(GetPhotosInitial());

  Future<void> getPhotos() async {
    emit(const Loading());

    final result = await getPhotosUsecase();

    result.fold(
      (Failure failure) {
        if (failure is ServerFailure) {
          emit(Error(failure.message!));
        } else {
          emit(Error(failure.message!));
        }
      },
      (List<PhotoEntity> listPhotoEntity) => emit(Loaded(listPhotoEntity)),
    );
  }
}
