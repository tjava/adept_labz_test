import 'package:adept_labz_test/core/constants/colors_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:adept_labz_test/core/utils/permission_util.dart';
import 'package:adept_labz_test/core/widgets/column_sized_box.dart';
import 'package:adept_labz_test/core/widgets/generic_text.dart';

void imagePickerModal({required BuildContext context, required Function(XFile?) getImage}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: appYellow,
    builder: (context) {
      return Container(
        height: 140.h,
        decoration: BoxDecoration(
          color: appYellow,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ColumnSizedBox(10.h),
            InkWell(
              onTap: () async {
                if (!await checkPermission(1)) return;
                final ImagePicker picker = ImagePicker();
                final XFile? image = await picker.pickImage(source: ImageSource.camera);
                if (image != null) {
                  getImage(image);
                }
              },
              child: SizedBox(
                height: 50.h,
                width: 200.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.camera_alt_outlined,
                      size: 30.sp,
                      color: white,
                    ),
                    GenericText(
                      text: 'Camera',
                      size: 18.sp,
                      color: white,
                    ),
                  ],
                ),
              ),
            ),
            const Divider(color: white),
            InkWell(
              onTap: () async {
                if (!await checkPermission(15)) return;
                final ImagePicker picker = ImagePicker();
                final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                getImage(image);
              },
              child: SizedBox(
                height: 50.h,
                width: 200.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.collections_outlined,
                      size: 30.sp,
                      color: white,
                    ),
                    GenericText(
                      text: 'Gallery',
                      size: 18.sp,
                      color: white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
