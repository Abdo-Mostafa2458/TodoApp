import 'package:flutter/material.dart';

import '../../AppColors/app_colors.dart';

class RowCheckElement extends StatelessWidget {
  final String RowText;

  RowCheckElement({required this.RowText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(RowText),
          Icon(
            Icons.check_outlined,
            color: AppColorsLight.appbarBlueColor,
            size: 30,
          )
        ],
      ),
    );
  }
}
