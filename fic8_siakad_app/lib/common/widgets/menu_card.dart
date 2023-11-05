import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';

class MenuCard extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final String imagePath;

  const MenuCard({
    super.key,
    required this.label,
    required this.backgroundColor,
    required this.onPressed,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(20.0.h),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(32.5.r)),
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      color: ColorName.white,
                    ),
                  ),
                  SizedBox(height: 5.0.h),
                  ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorName.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.h),
                      child: const Text('Lihat'),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                width: 91.w,
                height: 106.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(94.25.h),
                  color: ColorName.white.withOpacity(0.2),
                ),
              ),
              SizedBox(width: 8.0.w),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 40.0.h),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              imagePath,
              height: 90.0.h,
            ),
          ),
        ),
      ],
    );
  }
}
