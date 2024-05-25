import 'package:adept_labz_test/features/albums/domain/entities/album_entity.dart';
import 'package:adept_labz_test/navigator/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:adept_labz_test/core/constants/colors_constant.dart';
import 'package:adept_labz_test/core/widgets/column_sized_box.dart';
import 'package:adept_labz_test/core/widgets/generic_text.dart';

class AlbumItem extends StatelessWidget {
  final AlbumEntity albumEntity;

  const AlbumItem({super.key, required this.albumEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushRoute(AlbumDetailsRoute(albumEntity: albumEntity)),
      child: Column(
        children: [
          ColumnSizedBox(15.w),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(
                  color: appYellow,
                ),
              ),
              child: Icon(
                Icons.folder_outlined,
                size: 50.sp,
                color: appYellow,
              ),
            ),
          ),
          ColumnSizedBox(10.h),
          GenericText(
            text: albumEntity.title,
            size: 14.sp,
            weight: FontWeight.w500,
            color: appYellow,
          ),
        ],
      ),
    );
  }
}
