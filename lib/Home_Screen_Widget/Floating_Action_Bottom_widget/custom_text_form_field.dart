import 'package:flutter/material.dart';
import 'package:todo_app/MediaQuery/media_quary.dart';

import '../../AppColors/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String errorText;
  final double verticalPadding;
  final TextEditingController controller;

  CustomTextFormField(
      {required this.hintText,
      required this.controller,
      required this.verticalPadding,
      this.errorText = "The Text is Empty"});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: getHeight(0.02, context)),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.only(bottom: verticalPadding),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColorsLight.blackColor)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColorsLight.blackColor)),
            errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColorsLight.blackColor))),
        validator: (text) {
          if (text == null || text.isEmpty) {
            return errorText;
          }
          return null;
        },
        controller: controller,
      ),
    );
  }
}
