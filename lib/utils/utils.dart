import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:derapidos/theme.dart';

dprint(content) {
  if (kDebugMode) debugPrint('Debug Mode: $content');
}

showSnackBar(BuildContext context, String text) {
  final snackBar = SnackBar(
    backgroundColor: AppTheme.appColor,
    content: Text(
      text,
      style: TextStyle(
        color: AppTheme.whiteColor,
      ),
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

showLoading(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Center(
          child: SizedBox(
            height: 30.h,
            width: 30.w,
            child: Column(
              children: [
                LinearProgressIndicator(
                  backgroundColor: AppTheme.whiteColor,
                ),
              ],
            ),
          ),
        );
      });
}

Widget dropDownList(
    String? value, List<String?> list, Function(String?) onChanged) {
  // List.generate(50, (index) => null);
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 24.h,
      width: 120.w,
      decoration: BoxDecoration(
        color: AppTheme.whiteColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(4),

        // border: Border.all(color: Colors.black54),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
        child: DropdownButton<String>(
          hint: const Text('Select'),
          elevation: 12,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down_sharp),
          underline: const SizedBox(),
          value: value,
          items: list.map<DropdownMenuItem<String>>((value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  value!,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppTheme.appColor,
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    ),
  );
}

Widget generateList(
    String? value, List<String?> list, Function(String?) onChanged) {
  // List.generate(50, (index) => null);
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 24.h,
      width: 120.w,
      decoration: BoxDecoration(
        color: AppTheme.whiteColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
        child: DropdownButton<String>(
          hint: const Text('Select'),
          elevation: 12,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down_sharp),
          underline: const SizedBox(),
          value: value,
          items: List.generate(50, (value) {
            return DropdownMenuItem<String>(
              value: '$value',
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  '${value + 1}',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppTheme.appColor,
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    ),
  );
}
