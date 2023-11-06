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
        Container(
          margin: EdgeInsets.only(right: 20.w),
          height: 112.0.h,
          width: 96.0.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.h),
            color: Colors.red,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                imagePath,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10.h,
          child: SizedBox(
            width: 96.0.w,
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w700,
                color: ColorName.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
