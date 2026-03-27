import 'package:flutter/material.dart';

import '../AppColors/app_colors.dart';
import 'Floating_Action_Bottom_widget/data_picker_widget.dart';

class CustomFloatingActionBottom extends StatelessWidget {
  const CustomFloatingActionBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        dataPacker(context);
      },
      child: Icon(
        Icons.add,
        color: AppColorsLight.whiteColor,
        size: 35,
      ),
    );
  }
}

void dataPacker(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) => DataPickerWidget(),
  );
}
