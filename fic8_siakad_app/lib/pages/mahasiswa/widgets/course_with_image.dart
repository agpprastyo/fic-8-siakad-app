import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/constants/colors.dart';

class CourseWithImage extends StatelessWidget {
  final String name;
  final String imagePath;

  const CourseWithImage({
    super.key,
    required this.name,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          imagePath,
          height: 112.0.h,
          width: 96.0.w,
          fit: BoxFit.cover,
        ),
        Container(
          height: 112.0.h,
          width: 96.0.w,
          padding: EdgeInsets.only(bottom: 20.0.h),
          alignment: Alignment.bottomCenter,
          child: Text(
            name,
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w700,
              color: ColorName.white,
            ),
          ),
        ),
      ],
    );
  }
}
