import 'package:adept_labz_test/core/constants/colors_constant.dart';
import 'package:adept_labz_test/core/widgets/generic_text.dart';
import 'package:adept_labz_test/core/widgets/row_sized_box.dart';
import 'package:adept_labz_test/features/photos/domain/entities/photo_entity.dart';
import 'package:adept_labz_test/navigator/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhotoItem extends StatelessWidget {
  final PhotoEntity photoEntity;
  const PhotoItem({super.key, required this.photoEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushRoute(PhotoDetailsRoute(photoEntity: photoEntity)),
      child: Row(
        children: [
          Container(
            height: 60.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(5.r),
              border: Border.all(
                color: appYellow,
              ),
            ),
            child: Icon(
              Icons.image_outlined,
              size: 40.sp,
              color: appYellow,
            ),
          ),
          RowSizedBox(10.w),
          Expanded(
            flex: 15,
            child: GenericText(
              text: photoEntity.title,
              size: 14.sp,
              weight: FontWeight.w500,
              color: appYellow,
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 2,
            child: Icon(
              Icons.arrow_forward_ios,
              size: 20.sp,
              color: appYellow,
            ),
          ),
        ],
      ),
    );
  }
}
