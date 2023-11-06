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
    return SearchBar(
      leading: Padding(
        padding: EdgeInsets.only(left: 8.0.h),
        child: const Icon(
          Icons.search,
          // color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      hintText: 'Cari di sini',
      controller: controller,
      onChanged: onChanged,
      elevation: MaterialStateProperty.all(2),
    );
  }
}
