import 'package:adept_labz_test/core/constants/colors_constant.dart';
import 'package:adept_labz_test/core/utils/snack_bar.dart';
import 'package:adept_labz_test/core/widgets/column_sized_box.dart';
import 'package:adept_labz_test/features/posts/presentation/cubits/get_posts/get_posts_cubit.dart';
import 'package:adept_labz_test/features/posts/presentation/widgets/post_item.dart';
import 'package:adept_labz_test/locator/locate.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage<dynamic>()
class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  late GetPostsCubit _getPostsCubit;

  @override
  void initState() {
    super.initState();

    _getPostsCubit = locate<GetPostsCubit>();

    _getPostsCubit.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _getPostsCubit,
      child: BlocConsumer<GetPostsCubit, GetPostsState>(
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
                              itemCount: state.listPostEntity.length,
                              itemBuilder: (BuildContext context, int index) {
                                return PostItem(postEntity: state.listPostEntity[index]);
                              },
                              separatorBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5.h),
                                  child: const Divider(),
                                );
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
