import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: LayoutRoute.page,
      path: '/layout',
      initial: true,
      children: [
        AutoRoute(
          page: HomeRoute.page,
          path: '',
        ),
        AutoRoute(
          page: AlbumsRoute.page,
          path: 'albums',
        ),
        AutoRoute(
          page: PhotosRoute.page,
          path: 'photos',
        ),
        AutoRoute(
          page: PostsRoute.page,
          path: 'posts',
        ),
      ],
    ),
    AutoRoute(
      page: AlbumDetailsRoute.page,
      path: '/albumDetails',
    ),
    AutoRoute(
      page: PhotoDetailsRoute.page,
      path: '/photsDetails',
    ),
    AutoRoute(
      page: PostDetailsRoute.page,
      path: '/postDetails',
    ),
  ];
}
