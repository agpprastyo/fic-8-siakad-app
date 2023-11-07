import 'package:fic8_siakad_app/pages/mahasiswa/widgets/sample_map_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/constants/images.dart';
import '../../common/widgets/menu_card.dart';
import '../../common/widgets/search_input.dart';
import 'absensi_page.dart';
import 'jadwal_matkul_page.dart';
import 'khs_page.dart';
import 'nilai_mk_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Perkuliahan",
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
            // color: ColorName.primary,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SampleMapPage()));
            },
            icon: const Icon(
              Icons.map,
              // color: ColorName.green,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AbsensiPage()));
            },
            icon: const Icon(
              Icons.qr_code_scanner,
              // color: ColorName.primary,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              // color: ColorName.primary,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          SizedBox(height: 10.0.h),
          SearchInput(
            controller: searchController,
          ),
          SizedBox(height: 40.0.h),
          MenuCard(
            label: 'Kartu Hasil\nStudi',
            backgroundColor: const Color(0xff686BFF),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const KhsPage()));
            },
            imagePath: Images.khs,
          ),
          SizedBox(height: 40.0.h),
          MenuCard(
            label: 'Nilai\nMata Kuliah',
            backgroundColor: const Color(0xffFFB023),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const NilaiMkPage()));
            },
            imagePath: Images.nMatkul,
          ),
          SizedBox(height: 40.0.h),
          MenuCard(
            label: 'Jadwal\nMata Kuliah',
            backgroundColor: const Color(0xffFF68F0),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const JadwalMatkulPage()));
            },
            // onPressed: () {
            //   Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => const JadwalMatkulPage()));

            imagePath: Images.jadwal,
          ),
        ],
      ),
    );
  }
}
