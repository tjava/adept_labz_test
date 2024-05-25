import 'package:adept_labz_test/core/constants/colors_constant.dart';
import 'package:adept_labz_test/core/widgets/generic_rich_text.dart';
import 'package:adept_labz_test/core/widgets/generic_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BioData extends StatelessWidget {
  final String title;
  final String value;
  const BioData({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GenericText(
          text: '$title: ',
          size: 15.sp,
          weight: FontWeight.w600,
        ),
        Expanded(
          child: GenericRichText(
            text: value,
            color: appYellow,
            size: 15.sp,
            weight: FontWeight.w600,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
