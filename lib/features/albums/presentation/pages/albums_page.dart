import 'package:adept_labz_test/core/constants/colors_constant.dart';
import 'package:adept_labz_test/core/utils/snack_bar.dart';
import 'package:adept_labz_test/core/widgets/column_sized_box.dart';
import 'package:adept_labz_test/features/albums/presentation/cubits/get_albums/get_albums_cubit.dart';
import 'package:adept_labz_test/features/albums/presentation/widgets/album_item.dart';
import 'package:adept_labz_test/locator/locate.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage<dynamic>()
class AlbumsPage extends StatefulWidget {
  const AlbumsPage({super.key});

  @override
  State<AlbumsPage> createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  late GetAlbumsCubit _albumsCubit;

  @override
  void initState() {
    super.initState();

    _albumsCubit = locate<GetAlbumsCubit>();

    _albumsCubit.getAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _albumsCubit,
      child: BlocConsumer<GetAlbumsCubit, GetAlbumsState>(
        listener: (context, state) {
          if (state is Error) {
            ScaffoldMessenger.of(context).showSnackBar(
              showSnackBar(
                context: context,
                message: state.message,
                color: red,
              ),
            );
          }
        },
        builder: (context, state) {
          return state is Loaded
              ? Scaffold(
                  body: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.h),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ColumnSizedBox(10.h),
                            GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10.0.w,
                                mainAxisSpacing: 10.0.h,
                                childAspectRatio: 40.h / 40.h,
                              ),
                              itemCount: state.listAlbumEntity.length,
                              itemBuilder: (BuildContext context, int index) {
                                return AlbumItem(albumEntity: state.listAlbumEntity[index]);
                              },
                            ),
                            ColumnSizedBox(10.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : const Center(child: CircularProgressIndicator(color: appYellow));
        },
      ),
    );
  }
}
