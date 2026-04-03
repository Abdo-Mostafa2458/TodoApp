import 'package:flutter/material.dart';

import '../../AppColors/app_colors.dart';
typedef bottomFun = void Function(BuildContext context);

class LocalizationWidget extends StatelessWidget {
  final String hintText;
  final bottomFun onClicked;

  LocalizationWidget({required this.hintText, required this.onClicked});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClicked(context);
      },
      child: Container(
        width: double.infinity,
        height: 50,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
            color: AppColorsLight.whiteColor,
            border: Border.all(color: AppColorsLight.appbarBlueColor),
            borderRadius: BorderRadius.all(Radius.circular(3))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              hintText,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: AppColorsLight.appbarBlueColor),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: AppColorsLight.appbarBlueColor,
            )
          ],
        ),
      ),
    );
  }
}
