import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../AppColors/app_colors.dart';
import '../../MediaQuery/media_quary.dart';

class CustomTicketPicked extends StatelessWidget {
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getWidth(0.05, context)),
      margin: EdgeInsets.only(
          top: getHeight(0.020, context),
          right: getWidth(0.020, context),
          left: getWidth(0.020, context)),
      width: double.infinity,
      height: getHeight(0.15, context),
      decoration: BoxDecoration(
          color: AppColorsLight.whiteColor,
          borderRadius: BorderRadius.circular(25)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 2),
            color: AppColorsLight.appbarBlueColor,
            height: double.infinity,
            width: 5,
          ),
          Container(
            margin: EdgeInsets.only(right: 60, top: 20),
            child: Column(
              children: [
                Text("Play basket ball"),
                Text(
                    "${dateTime.hour}:${dateTime.second} ${DateFormat('a').format(DateTime.now())}"),
              ],
            ),
          ),
          ElevatedButton(
              style: ButtonStyle(
                  padding: WidgetStatePropertyAll(EdgeInsets.symmetric(
                      vertical: getHeight(0.009, context),
                      horizontal: getWidth(0.050, context))),
                  backgroundColor:
                      WidgetStatePropertyAll(AppColorsLight.appbarBlueColor),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))))),
              onPressed: () {},
              child: Icon(
                Icons.check_outlined,
                size: 40,
                color: AppColorsLight.whiteColor,
              ))
        ],
      ),
    );
  }
}
