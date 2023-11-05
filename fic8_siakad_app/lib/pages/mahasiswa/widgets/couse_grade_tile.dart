import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/constants/colors.dart';
import '../../../common/widgets/row_text.dart';
import '../models/course_grade_model.dart';

class CourseGradeTile extends StatelessWidget {
  final CourseGradeModel data;
  const CourseGradeTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(50.0.r)),
            child: Image.network(
              'https://assets.ayobandung.com/crop/0x0:0x0/750x500/webp/photo/2021/12/15/1405406409.jpg',
              width: 40.h,
              height: 40.h,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            "Jesica Jane",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          subtitle: Text(
            "Mahasiswa",
            style: TextStyle(
              fontSize: 12.sp,
            ),
          ),
        ),
        SizedBox(height: 16.0.h),
        const Divider(),
        SizedBox(height: 16.0.h),
        RowText(
          label: 'Absensi',
          value: '',
          valueColor: ColorName.primary,
          valueWidget: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 4.0.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12.0.r)),
              color: ColorName.lightGreen,
            ),
            child: Text(
              data.attendance,
              style: TextStyle(
                color: ColorName.green,
                fontSize: 12.0.sp,
              ),
            ),
          ),
        ),
        SizedBox(height: 14.0.h),
        RowText(
          label: data.course,
          value: data.grade.toString(),
        ),
        SizedBox(height: 12.0.h),
        RowText(
          label: 'Keterangan',
          value: data.description,
        ),
        SizedBox(height: 12.0.h),
      ],
    );
  }
}
