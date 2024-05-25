import 'package:adept_labz_test/core/constants/colors_constant.dart';
import 'package:adept_labz_test/core/widgets/column_sized_box.dart';
import 'package:adept_labz_test/core/widgets/generic_rich_text.dart';
import 'package:adept_labz_test/core/widgets/generic_text.dart';
import 'package:adept_labz_test/core/widgets/pic_circle.dart';
import 'package:adept_labz_test/core/widgets/row_sized_box.dart';
import 'package:adept_labz_test/features/posts/domain/entities/comment_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentItem extends StatelessWidget {
  final CommentEntity commentEntity;
  const CommentItem({super.key, required this.commentEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const PicCircle(name: 'Tom Cruise '),
            RowSizedBox(10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GenericText(
                      text: 'Tom Cruise ',
                      color: appYellow,
                      size: 15.sp,
                    ),
                    GenericText(
                      text: '@tomcruise',
                      color: grey,
                      size: 14.sp,
                    ),
                  ],
                ),
                Row(
                  children: [
                    GenericText(
                      text: 'Replying to ',
                      color: grey,
                      size: 15.sp,
                    ),
                    GenericText(
                      text: '@bret',
                      color: appYellow,
                      size: 14.sp,
                    ),
                  ],
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
        ColumnSizedBox(10.h),
        GenericRichText(
          text: commentEntity.body.replaceAll('\n', ' '),
          color: appYellow,
          size: 15.sp,
          textAlign: TextAlign.start,
        ),
        ColumnSizedBox(10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.mode_comment_outlined,
              size: 24.sp,
              color: appYellow,
            ),
            Icon(
              Icons.autorenew_outlined,
              size: 24.sp,
              color: appYellow,
            ),
            Icon(
              Icons.favorite_outline,
              size: 24.sp,
              color: appYellow,
            ),
            Icon(
              Icons.share_outlined,
              size: 24.sp,
              color: appYellow,
            ),
          ],
        ),
      ],
    );
  }
}
