import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/constants/colors.dart';
import '../models/course_grade_model.dart';
import '../widgets/couse_grade_tile.dart';

class NilaiMkPage extends StatefulWidget {
  const NilaiMkPage({super.key});

  @override
  State<NilaiMkPage> createState() => _NilaiMkPageState();
}

class _NilaiMkPageState extends State<NilaiMkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Nilai MK",
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_list),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: ListView(
          padding: EdgeInsets.all(24.0.h),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            SizedBox(height: 8.0.h),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "14 of 64 results",
                  style: TextStyle(
                    color: ColorName.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.0.h),
            CourseGradeTile(
              data: CourseGradeModel(
                information: '',
                attendance: 'Hadir',
                course: 'Kecerdasan Buatan',
                grade: 100,
                description: 'Tugas Praktikum',
              ),
            ),
            SizedBox(height: 30.0.h),
            CourseGradeTile(
              data: CourseGradeModel(
                information: '',
                attendance: 'Hadir',
                course: 'Basis Data',
                grade: 80,
                description: 'Tugas Praktikum',
              ),
            ),
            SizedBox(height: 30.0.h),
            CourseGradeTile(
              data: CourseGradeModel(
                information: '',
                attendance: 'Hadir',
                course: 'Pemrograman Dasar',
                grade: 98,
                description: 'Tugas Praktikum',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
