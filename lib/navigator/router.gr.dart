// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:adept_labz_test/features/albums/domain/entities/album_entity.dart'
    as _i11;
import 'package:adept_labz_test/features/albums/presentation/pages/album_details_page.dart'
    as _i1;
import 'package:adept_labz_test/features/albums/presentation/pages/albums_page.dart'
    as _i2;
import 'package:adept_labz_test/features/home/presentation/pages/home_page.dart'
    as _i3;
import 'package:adept_labz_test/features/layout/presentation/pages/layout_page.dart'
    as _i4;
import 'package:adept_labz_test/features/photos/domain/entities/photo_entity.dart'
    as _i12;
import 'package:adept_labz_test/features/photos/presentation/pages/photo_details_page.dart'
    as _i5;
import 'package:adept_labz_test/features/photos/presentation/pages/photos_page.dart'
    as _i6;
import 'package:adept_labz_test/features/posts/domain/entities/post_entity.dart'
    as _i13;
import 'package:adept_labz_test/features/posts/presentation/pages/post_details_page.dart'
    as _i7;
import 'package:adept_labz_test/features/posts/presentation/pages/posts_page.dart'
    as _i8;
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    AlbumDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<AlbumDetailsRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AlbumDetailsPage(
          key: args.key,
          albumEntity: args.albumEntity,
        ),
      );
    },
    AlbumsRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AlbumsPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    LayoutRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LayoutPage(),
      );
    },
    PhotoDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<PhotoDetailsRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.PhotoDetailsPage(
          key: args.key,
          photoEntity: args.photoEntity,
        ),
      );
    },
    PhotosRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.PhotosPage(),
      );
    },
    PostDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<PostDetailsRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.PostDetailsPage(
          key: args.key,
          postEntity: args.postEntity,
        ),
      );
    },
    PostsRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.PostsPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AlbumDetailsPage]
class AlbumDetailsRoute extends _i9.PageRouteInfo<AlbumDetailsRouteArgs> {
  AlbumDetailsRoute({
    _i10.Key? key,
    required _i11.AlbumEntity albumEntity,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          AlbumDetailsRoute.name,
          args: AlbumDetailsRouteArgs(
            key: key,
            albumEntity: albumEntity,
          ),
          initialChildren: children,
        );

  static const String name = 'AlbumDetailsRoute';

  static const _i9.PageInfo<AlbumDetailsRouteArgs> page =
      _i9.PageInfo<AlbumDetailsRouteArgs>(name);
}

class AlbumDetailsRouteArgs {
  const AlbumDetailsRouteArgs({
    this.key,
    required this.albumEntity,
  });

  final _i10.Key? key;

  final _i11.AlbumEntity albumEntity;

  @override
  String toString() {
    return 'AlbumDetailsRouteArgs{key: $key, albumEntity: $albumEntity}';
  }
}

/// generated route for
/// [_i2.AlbumsPage]
class AlbumsRoute extends _i9.PageRouteInfo<void> {
  const AlbumsRoute({List<_i9.PageRouteInfo>? children})
      : super(
          AlbumsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AlbumsRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LayoutPage]
class LayoutRoute extends _i9.PageRouteInfo<void> {
  const LayoutRoute({List<_i9.PageRouteInfo>? children})
      : super(
          LayoutRoute.name,
          initialChildren: children,
        );

  static const String name = 'LayoutRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.PhotoDetailsPage]
class PhotoDetailsRoute extends _i9.PageRouteInfo<PhotoDetailsRouteArgs> {
  PhotoDetailsRoute({
    _i10.Key? key,
    required _i12.PhotoEntity photoEntity,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          PhotoDetailsRoute.name,
          args: PhotoDetailsRouteArgs(
            key: key,
            photoEntity: photoEntity,
          ),
          initialChildren: children,
        );

  static const String name = 'PhotoDetailsRoute';

  static const _i9.PageInfo<PhotoDetailsRouteArgs> page =
      _i9.PageInfo<PhotoDetailsRouteArgs>(name);
}

class PhotoDetailsRouteArgs {
  const PhotoDetailsRouteArgs({
    this.key,
    required this.photoEntity,
  });

  final _i10.Key? key;

  final _i12.PhotoEntity photoEntity;

  @override
  String toString() {
    return 'PhotoDetailsRouteArgs{key: $key, photoEntity: $photoEntity}';
  }
}

/// generated route for
/// [_i6.PhotosPage]
class PhotosRoute extends _i9.PageRouteInfo<void> {
  const PhotosRoute({List<_i9.PageRouteInfo>? children})
      : super(
          PhotosRoute.name,
          initialChildren: children,
        );

  static const String name = 'PhotosRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.PostDetailsPage]
class PostDetailsRoute extends _i9.PageRouteInfo<PostDetailsRouteArgs> {
  PostDetailsRoute({
    _i10.Key? key,
    required _i13.PostEntity postEntity,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          PostDetailsRoute.name,
          args: PostDetailsRouteArgs(
            key: key,
            postEntity: postEntity,
          ),
          initialChildren: children,
        );

  static const String name = 'PostDetailsRoute';

  static const _i9.PageInfo<PostDetailsRouteArgs> page =
      _i9.PageInfo<PostDetailsRouteArgs>(name);
}

class PostDetailsRouteArgs {
  const PostDetailsRouteArgs({
    this.key,
    required this.postEntity,
  });

  final _i10.Key? key;

  final _i13.PostEntity postEntity;

  @override
  String toString() {
    return 'PostDetailsRouteArgs{key: $key, postEntity: $postEntity}';
  }
}

/// generated route for
/// [_i8.PostsPage]
class PostsRoute extends _i9.PageRouteInfo<void> {
  const PostsRoute({List<_i9.PageRouteInfo>? children})
      : super(
          PostsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PostsRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
