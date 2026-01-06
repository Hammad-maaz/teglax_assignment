import 'package:flutter/material.dart';
import 'package:teglax_assignment/res/utils/colors.dart';

Widget buildTextFormField({
  required TextEditingController controller,
  required String hintText,
  bool isPassword = false,
  TextInputType keyboardType = TextInputType.text,
  required ValueChanged<String>? onChanged,
}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    child: TextFormField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyboardType,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: AppColors.black.withValues(alpha: .8)),
        ),

        /// enabled
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: AppColors.black.withValues(alpha: .3)),
        ),
      ),
    ),
  );
}
