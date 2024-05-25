import 'package:adept_labz_test/core/errors/failures.dart';
import 'package:adept_labz_test/features/home/domain/entities/user_entity.dart';
import 'package:adept_labz_test/features/home/domain/usecases/get_user_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'get_user_state.dart';

@injectable
class GetUserCubit extends Cubit<GetUserState> {
  final GetUserUsecase getUserUsecase;
  GetUserCubit(this.getUserUsecase) : super(GetUserInitial());

  Future<void> getUser() async {
    emit(const Loading());

    final result = await getUserUsecase();

    result.fold(
      (Failure failure) {
        if (failure is ServerFailure) {
          emit(Error(failure.message!));
        } else {
          emit(Error(failure.message!));
        }
      },
      (UserEntity userEntity) => emit(Loaded(userEntity)),
    );
  }
}
