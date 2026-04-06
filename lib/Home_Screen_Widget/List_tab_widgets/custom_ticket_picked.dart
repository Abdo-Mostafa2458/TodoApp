import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Provider/provider.dart';

import '../../AppColors/app_colors.dart';
import '../../MediaQuery/media_quary.dart';
import '../../firebase/Task.dart';

class CustomTicketPicked extends StatelessWidget {
  final Task task;

  CustomTicketPicked({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    AppFireBase providerDataBase = Provider.of<AppFireBase>(context);
    // providerisDone = Provider.of<AppDataPicker>(context);

    return task.isDone
        ? DoneTask(context, providerDataBase)
        : notDoneTask(context, providerDataBase);
  }

  Widget notDoneTask(BuildContext context, AppFireBase providerDataBase) {
    return Container(
      padding: EdgeInsets.only(
        right: getWidth(0.03, context),
        left: getWidth(0.03, context),
        top: getHeight(0.020, context),
      ),
      child: Slidable(
        useTextDirection: false,
        key: const ValueKey(0),
        startActionPane: ActionPane(
          extentRatio: 0.35,
          motion: const DrawerMotion(),
          dismissible: DismissiblePane(onDismissed: () {}),
          dragDismissible: false,
          children: [
            SlidableAction(
              onPressed: (context) {
                // providerDataBase.deleteTask(task);
                providerDataBase.deleteTask(task);
                print("task deleted successful");
              },
              flex: 1,
              spacing: 3,
              backgroundColor: AppColorsLight.redColor,
              foregroundColor: AppColorsLight.whiteColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: getWidth(0.06, context),
            vertical: getHeight(0.02, context),
          ),
          width: double.infinity,
          height: getHeight(0.15, context),
          decoration: BoxDecoration(
            color: AppColorsLight.whiteColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 2),
                color: AppColorsLight.appbarBlueColor,
                height: double.infinity,
                width: 5,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: getHeight(0.01, context)),
                  padding: EdgeInsets.symmetric(
                    horizontal: getWidth(0.05, context),
                  ),
                  child: Column(
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          task.title,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      SizedBox(height: getHeight(0.002, context)),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          task.description,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          children: [
                            Icon(Icons.event_available,
                                color: AppColorsLight.blackColor),
                            SizedBox(
                              width: getWidth(0.01, context),
                            ),
                            Text(
                              DateFormat('h:mm a').format(task.dateTime),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(
                      vertical: getHeight(0.009, context),
                      horizontal: getWidth(0.050, context),
                    ),
                  ),
                  backgroundColor: WidgetStatePropertyAll(
                    AppColorsLight.appbarBlueColor,
                  ),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
                onPressed: () {
                  // providerisDone.isDoneTask(true);
                  providerDataBase.changeIsDone(task, doneTask: true);
                },
                child: Icon(
                  Icons.check_outlined,
                  size: 40,
                  color: AppColorsLight.whiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget DoneTask(BuildContext context, AppFireBase providerDataBase) {
    return Container(
      padding: EdgeInsets.only(
        right: getWidth(0.03, context),
        left: getWidth(0.03, context),
        top: getHeight(0.020, context),
      ),
      child: Slidable(
        useTextDirection: false,
        key: const ValueKey(0),
        startActionPane: ActionPane(
          extentRatio: 0.35,
          motion: const DrawerMotion(),
          dismissible: DismissiblePane(onDismissed: () {}),
          dragDismissible: false,
          children: [
            SlidableAction(
              onPressed: (context) {
                // providerDataBase.deleteTask(task);
                providerDataBase.deleteTask(task);
                print("task deleted successful");
              },
              flex: 1,
              spacing: 3,
              backgroundColor: AppColorsLight.redColor,
              foregroundColor: AppColorsLight.whiteColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: getWidth(0.06, context),
            vertical: getHeight(0.02, context),
          ),
          width: double.infinity,
          height: getHeight(0.15, context),
          decoration: BoxDecoration(
            color: AppColorsLight.whiteColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 2),
                color: AppColorsLight.greenColor,
                height: double.infinity,
                width: 5,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                      top: getHeight(0.01, context),
                      right: getWidth(0.09, context)),
                  padding: EdgeInsets.symmetric(
                    horizontal: getWidth(0.05, context),
                  ),
                  child: Column(
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          task.title,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color: AppColorsLight.greenColor,
                                  fontSize: 25),
                        ),
                      ),
                      SizedBox(height: getHeight(0.002, context)),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          task.description,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: AppColorsLight.blackColor),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          children: [
                            Icon(
                              Icons.event_available,
                              color: AppColorsLight.greenColor,
                            ),
                            SizedBox(
                              width: getWidth(0.01, context),
                            ),
                            Text(
                              DateFormat('h:mm a').format(task.dateTime),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: AppColorsLight.blackColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                'Done!',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 30, color: AppColorsLight.greenColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
