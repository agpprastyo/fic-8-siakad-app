import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/constants/colors.dart';
import '../models/course_schedule_model.dart';

class CourseScheduleTile extends StatelessWidget {
  final CourseScheduleModel data;
  const CourseScheduleTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 65.0,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0.w),
              child: Column(
                children: [
                  Text(data.startTime),
                  Text(
                    data.endTime,
                    style: const TextStyle(
                      color: ColorName.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 12.0.h),
          const VerticalDivider(),
          SizedBox(width: 12.0.h),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.course,
                  style: const TextStyle(
                    color: ColorName.primary,
                  ),
                ),
                SizedBox(height: 18.0.h),
                Text('Dosen: ${data.lecturer}'),
                SizedBox(height: 18.0.h),
                Text(
                  data.description,
                  style: const TextStyle(
                    color: ColorName.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
