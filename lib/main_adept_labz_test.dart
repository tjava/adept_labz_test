import 'package:adept_labz_test/core/constants/colors_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:adept_labz_test/core/cubits/connectivity/connectivity_cubit.dart';
import 'package:adept_labz_test/core/utils/globa_keys.dart';
import 'package:adept_labz_test/locator/locate.dart';
import 'package:adept_labz_test/navigator/router.dart';

class MainAdeptLabzTest extends StatefulWidget {
  const MainAdeptLabzTest({super.key});

  static final appRouter = AppRouter();

  @override
  State<MainAdeptLabzTest> createState() => _MainAdeptLabzTestState();
}

class _MainAdeptLabzTestState extends State<MainAdeptLabzTest> {
  late ConnectivityCubit _connectivityCubit;

  @override
  void initState() {
    super.initState();
    _connectivityCubit = locate<ConnectivityCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConnectivityCubit>.value(value: _connectivityCubit),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            title: 'Adept Labz Test',
            theme: ThemeData(
              useMaterial3: true,
              scaffoldBackgroundColor: backgrand,
              appBarTheme: const AppBarTheme(
                backgroundColor: backgrand,
                surfaceTintColor: backgrand,
                iconTheme: IconThemeData(color: appYellow),
                centerTitle: true,
                elevation: 0,
              ),
            ),
            scaffoldMessengerKey: scaffoldMessengerKey,
            routerConfig: MainAdeptLabzTest.appRouter.config(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
