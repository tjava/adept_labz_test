import 'package:adept_labz_test/core/constants/colors_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:adept_labz_test/core/widgets/generic_text.dart';

class PicCircle extends StatelessWidget {
  final String name;
  const PicCircle({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 50.w,
      decoration: const BoxDecoration(
        color: appYellow,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: GenericText(
          text: name[0].toUpperCase(),
          size: 25.sp,
          weight: FontWeight.w500,
          color: white,
        ),
      ),
    );
  }
}
