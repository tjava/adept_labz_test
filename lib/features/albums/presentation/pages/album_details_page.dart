import 'package:adept_labz_test/core/constants/colors_constant.dart';
import 'package:adept_labz_test/core/widgets/column_sized_box.dart';
import 'package:adept_labz_test/core/widgets/generic_rich_text.dart';
import 'package:adept_labz_test/features/albums/domain/entities/album_entity.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage<dynamic>()
class AlbumDetailsPage extends StatelessWidget {
  final AlbumEntity albumEntity;
  const AlbumDetailsPage({super.key, required this.albumEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ColumnSizedBox(15.w),
              Container(
                height: 150.h,
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
              ColumnSizedBox(10.h),
              GenericRichText(
                text: albumEntity.title,
                size: 14.sp,
                weight: FontWeight.w500,
                color: appYellow,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
