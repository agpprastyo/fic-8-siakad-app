import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../bloc/login/login_bloc.dart';
import '../../../common/constants/colors.dart';
import '../../../common/widgets/buttons.dart';
import '../../../common/widgets/custom_text_field.dart';
import '../../../data/datasources/auth_local_datasource.dart';
import '../../../data/models/request/auth_request_model.dart';
import '../../dosen/dosen_page.dart';
import '../../mahasiswa/mahasiswa_page.dart';

class LoginBottomSheet extends StatefulWidget {
  const LoginBottomSheet({
    super.key,
  });

  @override
  State<LoginBottomSheet> createState() => _LoginBottomSheetState();
}

class _LoginBottomSheetState extends State<LoginBottomSheet> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 20.h,
          right: 20.h,
          left: 20.h,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: ListView(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Text(
                "Masuk",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 40.0.w),
            ],
          ),
          const Divider(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.0.h),
              Text(
                "Selamat Datang",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 8.0.h),
              const Text(
                "Masukkan Email dan password agar bisa mengakses informasi administrasi.",
                style: TextStyle(
                  color: ColorName.grey,
                ),
              ),
              SizedBox(height: 50.0.h),
              CustomTextField(
                controller: usernameController,
                label: 'Email',
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 12.0.h),
              CustomTextField(
                controller: passwordController,
                label: 'Password',
                obscureText: true,
              ),
              SizedBox(height: 24.0.h),
              BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  state.maybeWhen(
                    orElse: () {},
                    loaded: (data) {
                      AuthLocalDatasource().saveAuthData(data);
                      if (data.user.roles == 'admin') {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return const MahasiswaPage();
                        }));
                      } else {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return const DosenPage();
                        }));
                      }
                    },
                    error: (message) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Error'),
                              content: Text(message),
                            );
                          });
                    },
                  );
                },
                child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return Button.filled(
                          onPressed: () {
                            final requestModel = AuthRequestModel(
                              email: usernameController.text,
                              password: passwordController.text,
                            );
                            context
                                .read<LoginBloc>()
                                .add(LoginEvent.login(requestModel));
                          },
                          label: 'Masuk',
                        );
                      },
                      loading: () {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 12.0.h),
            ],
          ),
        ],
      ),
    );
  }
}
