import 'package:fic8_siakad_app/common/extensions/date_time_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/schedules/schedules_bloc.dart';
import '../../common/constants/images.dart';
import 'models/course_schedule_model.dart';
import 'widgets/course_schedule_tile.dart';
import 'widgets/course_with_image.dart';

class JadwalMatkulPage extends StatefulWidget {
  const JadwalMatkulPage({super.key});

  @override
  State<JadwalMatkulPage> createState() => _JadwalMatkulPageState();
}

class _JadwalMatkulPageState extends State<JadwalMatkulPage> {
  @override
  void initState() {
    super.initState();
    context.read<SchedulesBloc>().add(const SchedulesEvent.getSchedules());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          // padding: const EdgeInsets.all(24.0),
          // shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          children: [
            Text(
              "Jadwal MK",
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 20.0.h),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CourseWithImage(
                    name: 'Basis Data',
                    imagePath: Images.basisData,
                  ),
                  CourseWithImage(
                    name: 'Algoritma',
                    imagePath: Images.algoritma,
                  ),
                  CourseWithImage(
                    name: 'RPL',
                    imagePath: Images.rpl,
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.0.h),
            Text(
              DateTime.now().toFormattedDateWithDay(),
              style: TextStyle(
                fontSize: 12.sp,
              ),
            ),
            SizedBox(height: 18.0.h),
            Expanded(
              child: BlocBuilder<SchedulesBloc, SchedulesState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    loaded: (data) {
                      return ListView.builder(
                        padding: const EdgeInsets.all(0),
                        shrinkWrap: true,
                        // physics: const NeverScrollableScrollPhysics(),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return CourseScheduleTile(
                            data: CourseScheduleModel(
                              dateStart: DateTime.now(),
                              longTimeTeaching: 90,
                              course: data[index].subject.title,
                              lecturer: data[index].subject.lecturer.name,
                              description: data[index].ruangan,
                              startTime: data[index].jamMulai,
                              endTime: data[index].jamSelesai,
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
