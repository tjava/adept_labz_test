// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:adept_labz_test/core/cubits/connectivity/connectivity_cubit.dart'
    as _i3;
import 'package:adept_labz_test/core/services/api_service.dart' as _i4;
import 'package:adept_labz_test/core/services/third_party_services_module.dart'
    as _i27;
import 'package:adept_labz_test/features/albums/data/datasources/albums_remote_datasource.dart'
    as _i5;
import 'package:adept_labz_test/features/albums/data/repositories/albums_repository_impl.dart'
    as _i10;
import 'package:adept_labz_test/features/albums/domain/repositories/albums_repository.dart'
    as _i9;
import 'package:adept_labz_test/features/albums/domain/usecases/get_albums_usecase.dart'
    as _i17;
import 'package:adept_labz_test/features/albums/presentation/cubits/get_albums/get_albums_cubit.dart'
    as _i21;
import 'package:adept_labz_test/features/home/data/datasources/home_remote_datasource.dart'
    as _i6;
import 'package:adept_labz_test/features/home/data/repositories/home_repository_impl.dart'
    as _i16;
import 'package:adept_labz_test/features/home/domain/repositories/home_repository.dart'
    as _i15;
import 'package:adept_labz_test/features/home/domain/usecases/get_user_usecase.dart'
    as _i22;
import 'package:adept_labz_test/features/home/presentation/cubits/get_user/get_user_cubit.dart'
    as _i24;
import 'package:adept_labz_test/features/photos/data/datasources/photos_remote_datasource.dart'
    as _i7;
import 'package:adept_labz_test/features/photos/data/repositories/photos_repository_impl.dart'
    as _i12;
import 'package:adept_labz_test/features/photos/domain/repositories/photos_repository.dart'
    as _i11;
import 'package:adept_labz_test/features/photos/domain/usecases/get_photos_usecase.dart'
    as _i20;
import 'package:adept_labz_test/features/photos/presentation/cubits/get_photos/get_photos_cubit.dart'
    as _i25;
import 'package:adept_labz_test/features/posts/data/datasources/posts_remote_datasource.dart'
    as _i8;
import 'package:adept_labz_test/features/posts/data/repositories/posts_repository_impl.dart'
    as _i14;
import 'package:adept_labz_test/features/posts/domain/repositories/posts_repository.dart'
    as _i13;
import 'package:adept_labz_test/features/posts/domain/usecases/get_comments_usecase.dart'
    as _i18;
import 'package:adept_labz_test/features/posts/domain/usecases/get_posts_usecase.dart'
    as _i19;
import 'package:adept_labz_test/features/posts/presentation/cubits/get_comments/get_comments_cubit.dart'
    as _i26;
import 'package:adept_labz_test/features/posts/presentation/cubits/get_posts/get_posts_cubit.dart'
    as _i23;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.factory<_i3.ConnectivityCubit>(() => _i3.ConnectivityCubit());
  await gh.lazySingletonAsync<_i4.ApiService>(
    () => thirdPartyServicesModule.apiService,
    preResolve: true,
  );
  gh.lazySingleton<_i5.AlbumsRemoteDatasource>(
      () => _i5.AlbumsRemoteDatasourceImpl(gh<_i4.ApiService>()));
  gh.lazySingleton<_i6.HomeRemoteDatasource>(
      () => _i6.HomeRemoteDatasourceImpl(gh<_i4.ApiService>()));
  gh.lazySingleton<_i7.PhotosRemoteDatasource>(
      () => _i7.PhotosRemoteDatasourceImpl(gh<_i4.ApiService>()));
  gh.lazySingleton<_i8.PostsRemoteDatasource>(
      () => _i8.PostsRemoteDatasourceImpl(gh<_i4.ApiService>()));
  gh.lazySingleton<_i9.AlbumsRepository>(
      () => _i10.AlbumsRepositoryImpl(gh<_i5.AlbumsRemoteDatasource>()));
  gh.lazySingleton<_i11.PhotosRepository>(
      () => _i12.PhotosRepositoryImpl(gh<_i7.PhotosRemoteDatasource>()));
  gh.lazySingleton<_i13.PostsRepository>(
      () => _i14.PostsRepositoryImpl(gh<_i8.PostsRemoteDatasource>()));
  gh.lazySingleton<_i15.HomeRepository>(
      () => _i16.HomeRepositoryImpl(gh<_i6.HomeRemoteDatasource>()));
  gh.lazySingleton<_i17.GetAlbumsUsecase>(() =>
      _i17.GetAlbumsUsecase(albumsRepository: gh<_i9.AlbumsRepository>()));
  gh.lazySingleton<_i18.GetCommentsUsecase>(() =>
      _i18.GetCommentsUsecase(postsRepository: gh<_i13.PostsRepository>()));
  gh.lazySingleton<_i19.GetPostsUsecase>(
      () => _i19.GetPostsUsecase(postsRepository: gh<_i13.PostsRepository>()));
  gh.lazySingleton<_i20.GetPhotosUsecase>(() =>
      _i20.GetPhotosUsecase(photosRepository: gh<_i11.PhotosRepository>()));
  gh.factory<_i21.GetAlbumsCubit>(
      () => _i21.GetAlbumsCubit(gh<_i17.GetAlbumsUsecase>()));
  gh.lazySingleton<_i22.GetUserUsecase>(
      () => _i22.GetUserUsecase(homeRepository: gh<_i15.HomeRepository>()));
  gh.factory<_i23.GetPostsCubit>(
      () => _i23.GetPostsCubit(gh<_i19.GetPostsUsecase>()));
  gh.factory<_i24.GetUserCubit>(
      () => _i24.GetUserCubit(gh<_i22.GetUserUsecase>()));
  gh.factory<_i25.GetPhotosCubit>(
      () => _i25.GetPhotosCubit(gh<_i20.GetPhotosUsecase>()));
  gh.factory<_i26.GetCommentsCubit>(
      () => _i26.GetCommentsCubit(gh<_i18.GetCommentsUsecase>()));
  return getIt;
}

class _$ThirdPartyServicesModule extends _i27.ThirdPartyServicesModule {}
