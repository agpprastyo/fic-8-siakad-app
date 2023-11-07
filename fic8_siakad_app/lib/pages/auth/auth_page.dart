import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bloc/login/login_bloc.dart';
import '../../common/constants/images.dart';
import '../../common/widgets/buttons.dart';
import 'widgets/login_bottom_sheet.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            Images.logo,
            width: 115.0.w,
          ),
          SizedBox(height: 8.0.h),
          Text(
            "SIAKAD CWB",
            style: TextStyle(
              fontSize: 34.sp,
              fontWeight: FontWeight.w800,
              // color: ColorName.primary,
            ),
          ),
          SizedBox(height: 8.0.h),
          Text(
            "Melayani Edukasi, Memudahkan Administrasi!",
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              // color: ColorName.grey,
            ),
          ),
        ]),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.h, vertical: 24.0.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 8.0.h),
            Button.filled(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  useSafeArea: true,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return BlocProvider(
                      create: (context) => LoginBloc(),
                      child: const LoginBottomSheet(),
                    );
                  },
                );
              },
              label: 'LOGIN',
            ),
            SizedBox(height: 32.0.h),
            Text.rich(
              const TextSpan(
                text: "Dengan memilih salah satu, Anda menyetujuinya ",
                children: [
                  TextSpan(
                    text: 'Ketentuan Layanan & Kebijakan Privasi',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      // add underline
                      decoration: TextDecoration.underline,

                      // color: ColorName.primary,
                    ),
                  ),
                ],
              ),
              style: TextStyle(
                fontSize: 12.sp,
                // color: ColorName.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
