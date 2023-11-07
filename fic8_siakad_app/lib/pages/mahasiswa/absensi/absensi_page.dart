import 'package:fic8_siakad_app/pages/mahasiswa/absensi/qrcode_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../../common/constants/colors.dart';
import '../../../common/constants/icons.dart';
import '../../../common/widgets/buttons.dart';
import '../../../common/widgets/custom_scaffold.dart';

class AbsensiPage extends StatefulWidget {
  const AbsensiPage({super.key});

  @override
  State<AbsensiPage> createState() => _AbsensiPageState();
}

class _AbsensiPageState extends State<AbsensiPage> {
  final List<TimeOfDay> times = [
    const TimeOfDay(hour: 8, minute: 0),
    const TimeOfDay(hour: 9, minute: 15),
    const TimeOfDay(hour: 10, minute: 30),
    const TimeOfDay(hour: 11, minute: 45),
    const TimeOfDay(hour: 12, minute: 0),
    const TimeOfDay(hour: 13, minute: 30),
    const TimeOfDay(hour: 14, minute: 45),
    const TimeOfDay(hour: 15, minute: 0),
    const TimeOfDay(hour: 16, minute: 15),
    const TimeOfDay(hour: 17, minute: 30),
  ];
  late GoogleMapController mapController;
  double? latitude;
  double? longitude;

  Future<void> getCurrentPosition() async {
    try {
      Location location = Location();

      bool serviceEnabled;
      PermissionStatus permissionGranted;
      LocationData locationData;

      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          return;
        }
      }

      permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          return;
        }
      }

      locationData = await location.getLocation();
      latitude = locationData.latitude;
      longitude = locationData.longitude;

      setState(() {});
    } on PlatformException catch (e) {
      if (e.code == 'IO_ERROR') {
        debugPrint(
            'A network error occurred trying to lookup the supplied coordinates: ${e.message}');
      } else {
        debugPrint('Failed to lookup coordinates: ${e.message}');
      }
    } catch (e) {
      debugPrint('An unknown error occurred: $e');
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    getCurrentPosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LatLng center = LatLng(latitude ?? 0, longitude ?? 0);
    Marker marker = Marker(
      markerId: const MarkerId("marker_1"),
      position: LatLng(latitude ?? 0, longitude ?? 0),
    );
    return CustomScaffold(
      // useExtraPadding: true,
      appbar: AppBar(
        title: Text('Absensi'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30.0.w),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Card(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 28.0.w, vertical: 10.0.h),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(50.0.r)),
                        child: Image.network(
                          'https://avatars.githubusercontent.com/u/534678?v=4',
                          width: 72.0.h,
                          height: 72.0.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10.0.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 11.0.w, vertical: 2.0.h),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0.r)),
                              border: Border.all(color: ColorName.primary),
                            ),
                            child: Text(
                              'Mahasiswa',
                              style: TextStyle(
                                color: ColorName.primary,
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Text(
                            "Saiful Bahri",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: ColorName.primary,
                            ),
                          ),
                          Text(
                            "Senin, 28 Agustus 2023",
                            style: TextStyle(
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Dash(
                  length: MediaQuery.of(context).size.width - 80.0.w,
                  dashColor: const Color(0xffD5DFE7),
                ),
                const SizedBox(height: 12.0),
                StreamBuilder(
                  stream: Stream.periodic(const Duration(seconds: 1), (i) => i),
                  builder: (context, snapshot) {
                    final currentTime = DateTime.now();
                    final formattedTime =
                        "${currentTime.hour.toString().padLeft(2, '0')}:${currentTime.minute.toString().padLeft(2, '0')} WIB";

                    return Text(
                      formattedTime,
                      style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.blue,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0.h),
          SizedBox(
            height: 200.h,
            child: latitude == null
                ? const SizedBox()
                : GoogleMap(
                    // onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: center,
                      zoom: 15.0,
                    ),
                    markers: {marker},
                    mapType: MapType.normal,
                  ),
          ),
          SizedBox(height: 20.0.h),
          Button.filled(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const QrCodePage(),
                ),
              );
            },
            label: 'SCAN',
            icon: const ImageIcon(
              IconName.scan,
              color: ColorName.white,
            ),
            borderRadius: 50.0.r,
          ),
          SizedBox(height: 30.0.h),
          Container(
            padding: EdgeInsets.all(20.0.h),
            decoration: BoxDecoration(
                color: ColorName.primary,
                borderRadius: BorderRadius.all(Radius.circular(10.0.r))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Riwayat Absensi",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: ColorName.white,
                  ),
                ),
                SizedBox(height: 5.h),
                for (int i = 0; i < times.length; i++)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0.h),
                    child: Text(
                      "JAM ${times[i].format(context)}",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: ColorName.white,
                      ),
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
