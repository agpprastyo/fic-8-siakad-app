import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchInput extends StatelessWidget {
  final TextEditingController controller;
  final Function(String value)? onChanged;

  const SearchInput({
    super.key,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground,
        borderRadius: BorderRadius.circular(32.0.r),
      ),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Cari di sini',
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(16.0.h),
        ),
      ),
    );
  }
}
