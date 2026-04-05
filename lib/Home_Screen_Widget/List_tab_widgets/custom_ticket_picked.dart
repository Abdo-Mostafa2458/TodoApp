import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../AppColors/app_colors.dart';
import '../../MediaQuery/media_quary.dart';
import '../../firebase/Task.dart';

class CustomTicketPicked extends StatelessWidget {
  Task task;

  CustomTicketPicked({required this.task});

  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: getWidth(0.06, context),
          vertical: getHeight(0.02, context)),
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
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: getHeight(0.01, context)),
              padding:
                  EdgeInsets.symmetric(horizontal: getWidth(0.05, context)),
              child: Column(
                children: [
                  FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        task.title,
                        style: Theme.of(context).textTheme.bodyLarge,
                      )),
                  SizedBox(
                    height: getHeight(0.002, context),
                  ),
                  FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(task.description,
                          style: Theme.of(context).textTheme.bodySmall)),
                  FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                          "${DateFormat('h:mm a').format(task.dateTime)}",
                          style: Theme.of(context).textTheme.bodySmall)),

                  // Text(
                  //     "${dateTime.hour}:${dateTime.second} ${DateFormat('a').format(DateTime.now())}",style: Theme.of(context).textTheme.bodySmall,),
                ],
              ),
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
