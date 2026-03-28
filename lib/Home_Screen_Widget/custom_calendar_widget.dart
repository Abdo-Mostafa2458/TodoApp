import 'package:flutter/material.dart';

import '../AppColors/app_colors.dart';
import '../MediaQuery/media_quary.dart';

class CustomCalendarWidget extends StatelessWidget {
  const CustomCalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          height: getHeight(0.10, context),
          color: AppColorsLight.appbarBlueColor,
        ),
        Text("data")
      ],
    );
  }
}
