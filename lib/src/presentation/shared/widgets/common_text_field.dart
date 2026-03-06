import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paycron_app/src/presentation/shared/themes/colors.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final int? minLine;
  final bool? enabled;
  final Color boarderColor;
  final double boarderWidth;
  final TextInputType keyboardType;
  final void Function(String)? onChanged;
  final bool readOnly;
  final double boarderRadious;
  final Widget? prefixIcon;

  const CommonTextField({
    super.key,
    this.controller,
    this.hintText,
    this.minLine,
    this.enabled,
    this.prefixIcon,
    this.boarderColor = Colors.black54,
    this.boarderWidth = 1.0,
    this.boarderRadious = 12,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        readOnly: readOnly,
        controller: controller,
        onChanged: onChanged,
        keyboardType: keyboardType,
        minLines: minLine,
        maxLines: minLine,
        enabled: enabled,
        style: TextStyle(fontSize: 14.sp),
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 12.sp, color: AppColors.textSecondary),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(boarderRadious.r),
            borderSide: BorderSide(color: boarderColor, width: boarderWidth),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(boarderRadious.r),
            borderSide: BorderSide(color: boarderColor, width: boarderWidth),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(boarderRadious.r),
            borderSide: BorderSide(color: boarderColor, width: boarderWidth),
          ),
        ),
      ),
    );
  }
}
