import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../bloc/logout/logout_bloc.dart';
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
          Card(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 14.0.h),
              child: Column(
                children: [
                  SizedBox(height: 16.0.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(50.0.r)),
                        child: Image.network(
                          'https://hrcdn.net/s3_pub/hr-avatars/8524450b-3852-4a1e-b2eb-5e7045b178db/150x150.png',
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
                              border: Border.all(
                                  color:
                                      Theme.of(context).colorScheme.onSurface),
                            ),
                            child: Text(
                              widget.role,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            name,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).colorScheme.onSurface,
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
                  SizedBox(height: 8.0.h),
                  Dash(
                    length: MediaQuery.of(context).size.width - 75.w,
                    dashColor: Theme.of(context).colorScheme.onSurface,
                  ),
                  // SizedBox(height: 4.0.h),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.0.h),
          Card(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 14.0.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RowText(
                    icon: const ImageIcon(IconName.profileLine),
                    label: 'Edit Informasi Profil',
                    labelColor: Theme.of(context).colorScheme.onSurface,
                    value: '',
                    valueColor: Theme.of(context).colorScheme.onSurface,
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
                    labelColor: Theme.of(context).colorScheme.onSurface,
                    value: 'ON',
                    valueColor: Theme.of(context).colorScheme.onSurface,
                    onTap: () {},
                  ),
                  SizedBox(height: 12.0.h),
                  RowText(
                    icon: const Icon(Icons.translate),
                    label: 'Bahasa',
                    labelColor: Theme.of(context).colorScheme.onSurface,
                    value: 'Indonesia',
                    valueColor: Theme.of(context).colorScheme.onSurface,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 24.0.h),
          Card(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 14.0.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RowText(
                    icon: const ImageIcon(IconName.projector2Line),
                    label: 'Keamanan',
                    labelColor: Theme.of(context).colorScheme.onSurface,
                    value: '',
                    valueColor: Theme.of(context).colorScheme.onSurface,
                    onTap: () {},
                  ),
                  SizedBox(height: 12.0.h),
                  RowText(
                    icon: const ImageIcon(IconName.mentalHealthLine),
                    label: 'Tema',
                    labelColor: Theme.of(context).colorScheme.onSurface,
                    value: 'Mode Terang',
                    valueColor: Theme.of(context).colorScheme.onSurface,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 24.0.h),
          Card(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 14.0.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RowText(
                    icon: const ImageIcon(IconName.contactsLine),
                    label: 'Help & Support',
                    labelColor: Theme.of(context).colorScheme.onSurface,
                    value: '',
                    valueColor: Theme.of(context).colorScheme.onSurface,
                    onTap: () {},
                  ),
                  SizedBox(height: 12.0.h),
                  RowText(
                    icon: const ImageIcon(IconName.chatQuoteLine),
                    label: 'Contact us',
                    labelColor: Theme.of(context).colorScheme.onSurface,
                    value: '',
                    valueColor: Theme.of(context).colorScheme.onSurface,
                    onTap: () {},
                  ),
                  SizedBox(height: 12.0.h),
                  RowText(
                    icon: const Icon(Icons.lock),
                    label: 'Privacy policy',
                    labelColor: Theme.of(context).colorScheme.onSurface,
                    value: '',
                    valueColor: Theme.of(context).colorScheme.onSurface,
                    onTap: () {},
                  ),
                  SizedBox(height: 12.h),
                ],
              ),
            ),
          ),
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
                      return Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: SizedBox(
                          width: double.maxFinite,
                          height: 50.h,
                          child: ElevatedButton(
                            onPressed: () {
                              context
                                  .read<LogoutBloc>()
                                  .add(const LogoutEvent.logout());
                            },
                            child: Text(
                              'Logout',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ),
                        ),
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
    );
  }
}
