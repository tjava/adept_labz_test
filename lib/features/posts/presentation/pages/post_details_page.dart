import 'package:adept_labz_test/core/constants/assets_constant.dart';
import 'package:adept_labz_test/core/constants/colors_constant.dart';
import 'package:adept_labz_test/core/utils/snack_bar.dart';
import 'package:adept_labz_test/core/widgets/column_sized_box.dart';
import 'package:adept_labz_test/core/widgets/generic_rich_text.dart';
import 'package:adept_labz_test/core/widgets/row_sized_box.dart';
import 'package:adept_labz_test/features/posts/domain/entities/post_entity.dart';
import 'package:adept_labz_test/features/posts/presentation/cubits/get_comments/get_comments_cubit.dart';
import 'package:adept_labz_test/features/posts/presentation/widgets/comment_item.dart';
import 'package:adept_labz_test/locator/locate.dart';
import 'package:auto_route/auto_route.dart';
import 'package:adept_labz_test/core/widgets/generic_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage<dynamic>()
class PostDetailsPage extends StatefulWidget {
  final PostEntity postEntity;
  const PostDetailsPage({super.key, required this.postEntity});

  @override
  State<PostDetailsPage> createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends State<PostDetailsPage> {
  late GetCommentsCubit _commentsCubit;

  @override
  void initState() {
    super.initState();

    _commentsCubit = locate<GetCommentsCubit>();

    _commentsCubit.getComments();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _commentsCubit,
      child: BlocConsumer<GetCommentsCubit, GetCommentsState>(
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
          return Scaffold(
            appBar: AppBar(),
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: SingleChildScrollView(
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
                        ],
                      ),
                      ColumnSizedBox(15.h),
                      GenericRichText(
                        text: widget.postEntity.title.replaceAll('\n', ' '),
                        color: appYellow,
                        size: 15.sp,
                        textAlign: TextAlign.start,
                      ),
                      ColumnSizedBox(15.h),
                      GenericRichText(
                        text: widget.postEntity.body.replaceAll('\n', ' '),
                        color: appYellow,
                        size: 15.sp,
                        textAlign: TextAlign.start,
                      ),
                      ColumnSizedBox(10.h),
                      const Divider(),
                      ColumnSizedBox(10.h),
                      state is Loaded
                          ? Column(
                              children: [
                                for (int index = 0;
                                    index < state.listCommentEntity.length;
                                    index++) ...[
                                  CommentItem(commentEntity: state.listCommentEntity[index]),
                                  ColumnSizedBox(5.h),
                                  const Divider(),
                                  ColumnSizedBox(5.h),
                                ]
                              ],
                            )
                          : const Center(child: CircularProgressIndicator(color: appYellow)),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
