import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:adept_labz_test/core/constants/colors_constant.dart';
import 'package:adept_labz_test/navigator/router.gr.dart';

@RoutePage<dynamic>()
class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        AlbumsRoute(),
        PhotosRoute(),
        PostsRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) => BottomNavigationBar(
        backgroundColor: backgrand,
        selectedItemColor: appYellow,
        unselectedItemColor: grey2,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: TextStyle(
          fontSize: 10.sp,
        ),
        selectedLabelStyle: TextStyle(
          fontSize: 10.sp,
        ),
        currentIndex: tabsRouter.activeIndex,
        onTap: (index) async {
          tabsRouter.setActiveIndex(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: grey2,
            ),
            activeIcon: Icon(
              Icons.home,
              color: appYellow,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.photo_album,
              color: grey2,
            ),
            activeIcon: Icon(
              Icons.photo_album,
              color: appYellow,
            ),
            label: 'Albums',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.photo_library,
              color: grey2,
            ),
            activeIcon: Icon(
              Icons.photo_library,
              color: appYellow,
            ),
            label: 'Photos',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.post_add,
              color: grey2,
            ),
            activeIcon: Icon(
              Icons.post_add,
              color: appYellow,
            ),
            label: 'Posts',
          ),
        ],
      ),
    );
  }
}
