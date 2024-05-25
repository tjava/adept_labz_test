import 'package:adept_labz_test/core/constants/colors_constant.dart';
import 'package:adept_labz_test/core/utils/snack_bar.dart';
import 'package:adept_labz_test/core/widgets/column_sized_box.dart';
import 'package:adept_labz_test/features/photos/presentation/cubits/get_photos/get_photos_cubit.dart';
import 'package:adept_labz_test/features/photos/presentation/widgets/photo_item.dart';
import 'package:adept_labz_test/locator/locate.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage<dynamic>()
class PhotosPage extends StatefulWidget {
  const PhotosPage({super.key});

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
  late GetPhotosCubit _getPhotosCubit;

  @override
  void initState() {
    super.initState();

    _getPhotosCubit = locate<GetPhotosCubit>();

    _getPhotosCubit.getPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _getPhotosCubit,
      child: BlocConsumer<GetPhotosCubit, GetPhotosState>(
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
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 10,
                              itemBuilder: (BuildContext context, int index) {
                                return PhotoItem(photoEntity: state.listPhotoEntity[index]);
                              },
                              separatorBuilder: (BuildContext context, int index) {
                                return ColumnSizedBox(10.h);
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
