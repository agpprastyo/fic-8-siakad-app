import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../bloc/logout/logout_bloc.dart';
import '../../common/constants/colors.dart';
import '../../common/constants/icons.dart';
import '../../common/widgets/custom_scaffold.dart';
import '../../common/widgets/row_text.dart';
import '../../data/datasources/auth_local_datasource.dart';
import '../auth/auth_page.dart';

class ProfilePage extends StatefulWidget {
  final String role;
  const ProfilePage({
    Key? key,
    required this.role,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = "";
  String email = "";
  String roles = "";
  String formattedDate = '';

  @override
  void initState() {
    super.initState();
    _fetchCurrentDate();
    // Call the getUser method to retrieve user data from SharedPreferences
    _fetchUserData();
  }

  Future<void> _fetchCurrentDate() async {
    final currentDate = DateTime.now();
    formattedDate = DateFormat('EEEE, d MMMM y').format(currentDate);
    setState(() {
      formattedDate = formattedDate;
      print(formattedDate);
    });
  }

  Future<void> _fetchUserData() async {
    final authLocalDataSource = AuthLocalDatasource();
    final user = await authLocalDataSource.getUser();

    // Update the state with the user data
    setState(() {
      name = user.name;
      email = user.email;
      roles = user.roles;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      paddingTop: 0.0,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SizedBox(height: 30.0.h),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
              color: ColorName.white,
              boxShadow: [
                BoxShadow(
                  color: ColorName.black.withOpacity(0.25),
                  offset: const Offset(0, 3),
                  spreadRadius: 0,
                  blurRadius: 4.0,
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
            child: Column(
              children: [
                SizedBox(height: 16.0.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(50.0.r)),
                        child: Image.network(
                          'https://hrcdn.net/s3_pub/hr-avatars/8524450b-3852-4a1e-b2eb-5e7045b178db/150x150.png',
                          width: 72.0.h,
                          height: 72.0.h,
                          fit: BoxFit.cover,
                        ),
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
                            widget.role,
                            style: TextStyle(
                              color: ColorName.primary,
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            color: ColorName.primary,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          formattedDate,
                          style: TextStyle(
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 5.0.h),
                Dash(
                  length: MediaQuery.of(context).size.width - 60.0.w,
                  dashColor: const Color(0xffD5DFE7),
                ),
                SizedBox(height: 16.0.h),
              ],
            ),
          ),
          SizedBox(height: 60.0.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 14.0.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
              color: ColorName.white,
              boxShadow: [
                BoxShadow(
                  color: ColorName.black.withOpacity(0.25),
                  offset: const Offset(0, 3),
                  spreadRadius: 0,
                  blurRadius: 4.0,
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RowText(
                  icon: const ImageIcon(IconName.profileLine),
                  label: 'Edit Informasi Profil',
                  value: '',
                  valueColor: ColorName.primary,
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const EditProfilePage(),
                    //   ),
                    // );
                  },
                ),
                SizedBox(height: 12.0.h),
                RowText(
                  icon: const Icon(Icons.notifications),
                  label: 'Notifikasi',
                  value: 'ON',
                  valueColor: ColorName.primary,
                  onTap: () {},
                ),
                SizedBox(height: 12.0.h),
                RowText(
                  icon: const Icon(Icons.translate),
                  label: 'Bahasa',
                  value: 'Indonesia',
                  valueColor: ColorName.primary,
                  onTap: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: 24.0.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 14.0.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
              color: ColorName.white,
              boxShadow: [
                BoxShadow(
                  color: ColorName.black.withOpacity(0.25),
                  offset: const Offset(0, 3),
                  spreadRadius: 0,
                  blurRadius: 4.0,
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RowText(
                  icon: const ImageIcon(IconName.projector2Line),
                  label: 'Keamanan',
                  value: '',
                  valueColor: ColorName.primary,
                  onTap: () {},
                ),
                SizedBox(height: 12.0.h),
                RowText(
                  icon: const ImageIcon(IconName.mentalHealthLine),
                  label: 'Tema',
                  value: 'Mode Terang',
                  valueColor: ColorName.primary,
                  onTap: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: 24.0.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 14.0.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
              color: ColorName.white,
              boxShadow: [
                BoxShadow(
                  color: ColorName.black.withOpacity(0.25),
                  offset: const Offset(0, 3),
                  spreadRadius: 0,
                  blurRadius: 4.0,
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RowText(
                  icon: const ImageIcon(IconName.contactsLine),
                  label: 'Help & Support',
                  value: '',
                  valueColor: ColorName.primary,
                  onTap: () {},
                ),
                SizedBox(height: 12.0.h),
                RowText(
                  icon: const ImageIcon(IconName.chatQuoteLine),
                  label: 'Contact us',
                  value: '',
                  valueColor: ColorName.primary,
                  onTap: () {},
                ),
                SizedBox(height: 12.0.h),
                RowText(
                  icon: const Icon(Icons.lock),
                  label: 'Privacy policy',
                  value: '',
                  valueColor: ColorName.primary,
                  onTap: () {},
                ),
                SizedBox(height: 12.h),
                Center(
                  child: BlocProvider(
                    create: (context) => LogoutBloc(),
                    child: BlocConsumer<LogoutBloc, LogoutState>(
                      listener: (context, state) {
                        state.maybeWhen(
                          orElse: () {},
                          loaded: () {
                            AuthLocalDatasource().removeAuthData();
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return const AuthPage();
                            }));
                          },
                          error: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('logout error'),
                              ),
                            );
                          },
                        );
                      },
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse: () {
                            return ElevatedButton(
                              onPressed: () {
                                context
                                    .read<LogoutBloc>()
                                    .add(const LogoutEvent.logout());
                              },
                              child: const Text('Logout'),
                            );
                          },
                          loaded: () {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
