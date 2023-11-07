import 'package:fic8_siakad_app/pages/auth/auth_page.dart';
import 'package:fic8_siakad_app/pages/mahasiswa/mahasiswa_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/bloc_observer.dart';
import 'bloc/khs/khs_bloc.dart';
import 'bloc/qrcode/qrcode_bloc.dart';
import 'bloc/schedules/schedules_bloc.dart';
import 'color_schemes.g.dart';
import 'data/datasources/auth_local_datasource.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => KhsBloc(),
        ),
        BlocProvider(
          create: (context) => SchedulesBloc(),
        ),
        BlocProvider(
          create: (context) => QrcodeBloc(),
        ),
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: false,
          builder: (_, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                useMaterial3: true,
                colorScheme: lightColorScheme,
              ),
              darkTheme: ThemeData(
                useMaterial3: true,
                colorScheme: darkColorScheme,
              ),
              // theme: ThemeData(
              //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
              //   useMaterial3: true,
              // ),
              home: FutureBuilder<bool>(
                future: AuthLocalDatasource().isLogin(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data!) {
                    return const MahasiswaPage();
                  } else {
                    return const AuthPage();
                  }
                },
              ),
            );
          }),
    );
  }
}
