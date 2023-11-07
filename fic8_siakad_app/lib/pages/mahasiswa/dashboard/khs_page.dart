import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../bloc/khs/khs_bloc.dart';
import '../../../common/constants/colors.dart';
import '../../../common/widgets/row_text.dart';

class KhsPage extends StatefulWidget {
  const KhsPage({super.key});

  @override
  State<KhsPage> createState() => _KhsPageState();
}

class _KhsPageState extends State<KhsPage> {
  @override
  void initState() {
    super.initState();
    context.read<KhsBloc>().add(const KhsEvent.getKhs());
  }

  double ipk = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "KHS Mahasiswa",
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 6.w),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.filter_list),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 8.0.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: ListTile(
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
                  ),
                  const Text(
                    "14 of 64 results",
                    style: TextStyle(
                      color: ColorName.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.0.h),
              const Divider(),
              SizedBox(height: 16.0.h),
              const RowText(
                label: 'Mata Kuliah :',
                value: 'Nilai :',
                labelColor: ColorName.primary,
                valueColor: ColorName.primary,
              ),
              SizedBox(height: 14.0.h),
              Expanded(
                child: BlocBuilder<KhsBloc, KhsState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return const SizedBox();
                      },
                      loading: () {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      loaded: (data) {
                        int total = 0;
                        for (var element in data) {
                          total += int.parse(element.nilai);
                        }
                        ipk = total / data.length;
                        return Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 6.h),
                                    child: RowText(
                                      label: data[index].subject.title,
                                      value: data[index].grade.toString(),
                                    ),
                                  );
                                },
                                itemCount: data.length,
                              ),
                            ),
                            SizedBox(height: 40.0.h),
                            RowText(
                              label: 'IPK Semester :',
                              value: ipk.toString(),
                              labelColor: ColorName.primary,
                              valueColor: ColorName.primary,
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 3),
            ],
          ),
        ),
      ),
    );
  }
}
