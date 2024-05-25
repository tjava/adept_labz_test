import 'package:injectable/injectable.dart';
import 'package:adept_labz_test/core/services/api_service.dart';

@Injectable()
@module
abstract class ThirdPartyServicesModule {
  @LazySingleton()
  @preResolve
  Future<ApiService> get apiService => ApiService.getInstance();
}
