import 'package:flutter/material.dart';

import '../../AppColors/app_colors.dart';

class LocalizationWidget extends StatelessWidget {
  String hintText;
  String lableText;

  LocalizationWidget({required this.hintText, required this.lableText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lableText,
            style:
                Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 17),
          ),
          Container(
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
          )
        ],
      ),
    );
  }
}
