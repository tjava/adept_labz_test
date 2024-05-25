import 'package:adept_labz_test/core/services/api_service.dart';
import 'package:adept_labz_test/features/home/data/models/user_model.dart';
import 'package:injectable/injectable.dart';

abstract class HomeRemoteDatasource {
  Future<List<UserModel>> getUsers();
}

@LazySingleton(as: HomeRemoteDatasource)
class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  final ApiService apiService;
  HomeRemoteDatasourceImpl(this.apiService);

  @override
  Future<List<UserModel>> getUsers() async {
    return await apiService.getUsers();
  }
}
