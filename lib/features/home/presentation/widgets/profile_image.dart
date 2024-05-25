import 'dart:io';

import 'package:adept_labz_test/core/constants/assets_constant.dart';
import 'package:adept_labz_test/features/home/presentation/widgets/image_picker_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:adept_labz_test/core/constants/colors_constant.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({
    super.key,
  });

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  String? _image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(
          color: grey,
          width: 1.4.h,
        ),
        image: _image == null
            ? const DecorationImage(image: AssetImage(avatar), fit: BoxFit.cover)
            : DecorationImage(image: FileImage(File(_image!)), fit: BoxFit.cover),
      ),
      child: GestureDetector(
        onTap: () async {
          imagePickerModal(
            context: context,
            getImage: (XFile? image) {
              if (image != null) {
                _image = image.path;
              }
              setState(() {});
              Navigator.pop(context);
            },
          );
        },
        child: Align(
          alignment: Alignment.bottomRight,
          child: Icon(
            Icons.photo_camera_outlined,
            size: 25.sp,
            color: appYellow,
          ),
        ),
      ),
    );
  }
}
