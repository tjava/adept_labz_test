import 'package:adept_labz_test/core/constants/assets_constant.dart';
import 'package:adept_labz_test/core/constants/colors_constant.dart';
import 'package:adept_labz_test/core/widgets/column_sized_box.dart';
import 'package:adept_labz_test/core/widgets/generic_rich_text.dart';
import 'package:adept_labz_test/core/widgets/generic_text.dart';
import 'package:adept_labz_test/core/widgets/row_sized_box.dart';
import 'package:adept_labz_test/features/posts/domain/entities/post_entity.dart';
import 'package:adept_labz_test/navigator/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostItem extends StatelessWidget {
  final PostEntity postEntity;
  const PostItem({super.key, required this.postEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushRoute(PostDetailsRoute(postEntity: postEntity)),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 50.h,
                width: 50.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(avatar),
                  ),
                ),
              ),
              RowSizedBox(10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GenericText(
                    text: 'Leanne Graham',
                    color: appYellow,
                    size: 15.sp,
                  ),
                  GenericText(
                    text: '@bret',
                    color: grey,
                    size: 14.sp,
                  ),
                ],
              ),
              const Spacer(),
              Icon(
                Icons.keyboard_arrow_down,
                size: 25.sp,
                color: appYellow,
              ),
            ],
          ),
          ColumnSizedBox(15.h),
          GenericRichText(
            text: postEntity.title.replaceAll('\n', ' '),
            color: appYellow,
            size: 15.sp,
            textAlign: TextAlign.start,
          ),
          ColumnSizedBox(15.h),
          GenericRichText(
            text: postEntity.body.replaceAll('\n', ' '),
            color: appYellow,
            size: 15.sp,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
