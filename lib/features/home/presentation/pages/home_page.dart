import 'package:adept_labz_test/core/constants/colors_constant.dart';
import 'package:adept_labz_test/core/utils/snack_bar.dart';
import 'package:adept_labz_test/core/widgets/column_sized_box.dart';
import 'package:adept_labz_test/core/widgets/generic_text.dart';
import 'package:adept_labz_test/features/home/presentation/cubits/get_user/get_user_cubit.dart';
import 'package:adept_labz_test/features/home/presentation/widgets/bio_data.dart';
import 'package:adept_labz_test/features/home/presentation/widgets/profile_image.dart';
import 'package:adept_labz_test/locator/locate.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage<dynamic>()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late GetUserCubit _getUserCubit;

  @override
  void initState() {
    super.initState();

    _getUserCubit = locate<GetUserCubit>();

    _getUserCubit.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _getUserCubit,
      child: BlocConsumer<GetUserCubit, GetUserState>(
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
              ? SafeArea(
                  child: Scaffold(
                    body: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ColumnSizedBox(10.w),
                            const ProfileImage(),
                            ColumnSizedBox(15.w),
                            GenericText(
                              text: state.userEntity.name,
                              color: appYellow,
                              size: 15.sp,
                              weight: FontWeight.w600,
                            ),
                            GenericText(
                              text: state.userEntity.email,
                              color: grey,
                              size: 14.sp,
                            ),
                            ColumnSizedBox(10.w),
                            const Divider(),
                            ColumnSizedBox(10.w),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: GenericText(
                                text: 'Bio',
                                color: appYellow,
                                size: 15.sp,
                                weight: FontWeight.w600,
                              ),
                            ),
                            ColumnSizedBox(10.w),
                            BioData(title: 'Full Name', value: state.userEntity.name),
                            ColumnSizedBox(10.w),
                            BioData(title: 'UserName', value: '@${state.userEntity.username}'),
                            ColumnSizedBox(10.w),
                            BioData(title: 'Email', value: state.userEntity.email),
                            ColumnSizedBox(10.w),
                            BioData(title: 'Phone', value: state.userEntity.phone),
                            ColumnSizedBox(10.w),
                            BioData(title: 'Website', value: state.userEntity.website),
                            ColumnSizedBox(10.w),
                            BioData(title: 'Company Name', value: state.userEntity.company.name),
                            ColumnSizedBox(10.w),
                            BioData(
                              title: 'Address',
                              value:
                                  '${state.userEntity.address.suite} ${state.userEntity.address.street} Street, ${state.userEntity.address.city}',
                            ),
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
