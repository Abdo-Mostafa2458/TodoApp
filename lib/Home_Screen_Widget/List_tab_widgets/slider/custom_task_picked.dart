import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Home_Screen_Widget/List_tab_widgets/update_task_screen.dart';
import 'package:todo_app/Provider/provider.dart';

import '../../../AppColors/app_colors.dart';
import '../../../MediaQuery/media_quary.dart';
import '../../../firebase/Task.dart';

class CustomTaskPicked extends StatelessWidget {
  final Task task;

  const CustomTaskPicked({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    AppDataBase providerDataBase = Provider.of<AppDataBase>(context);

    return task.isDone
        ? DoneTask(context, providerDataBase)
        : notDoneTask(context, providerDataBase);
    // return notDoneTask(context, providerDataBase);
  }

  Widget notDoneTask(BuildContext context, AppDataBase providerDataBase) {
    return Padding(
      padding: EdgeInsets.only(
        right: getWidth(0.03, context),
        left: getWidth(0.03, context),
        top: getHeight(0.020, context),
      ),
      child: Slidable(
        useTextDirection: false,
        key: ValueKey(task.id),
        startActionPane: ActionPane(
          extentRatio: 0.35,
          motion: const DrawerMotion(),
          dismissible: DismissiblePane(onDismissed: () {}),
          dragDismissible: false,
          children: [
            CustomSlidableAction(
              onPressed: (context) {
                providerDataBase.deleteTask(task);
              },
              backgroundColor: AppColorsLight.redColor,
              foregroundColor: AppColorsLight.whiteColor,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.delete, size: 32),
                  SizedBox(height: getHeight(0.002, context)),
                  const Text(
                    'Delete',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
        endActionPane: ActionPane(
          extentRatio: 0.35,
          motion: const DrawerMotion(),
          dismissible: DismissiblePane(onDismissed: () {}),
          dragDismissible: false,
          children: [
            CustomSlidableAction(
              onPressed: (context) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdateTaskScreen(task: task),
                    ));
              },
              backgroundColor: AppColorsLight.appbarBlueColor,
              foregroundColor: AppColorsLight.whiteColor,
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.edit, size: 32),
                  SizedBox(height: getHeight(0.002, context)),
                  const Text(
                    'Edit',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      task.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: AppColorsLight.blackColor,
                          ),
                    ),
                    SizedBox(height: getHeight(0.005, context)),
                    Text(
                      task.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.event_note,
                            color: AppColorsLight.blackColor),
                        SizedBox(width: getWidth(0.01, context)),
                        Text(
                          DateFormat('h:mm a')
                              .format(providerDataBase.pickedDate),
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: AppColorsLight.blackColor),
                        ),
                      ],
                    ),
                  ],
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
                  backgroundColor: const WidgetStatePropertyAll(
                    AppColorsLight.appbarBlueColor,
                  ),
                  shape: const WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
                onPressed: () {
                  providerDataBase.editTaskData(task,
                      isDone: true,
                      title: task.title,
                      description: task.description,
                      dateTime: providerDataBase.pickedDate);
                },
                child: const Icon(
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

  Widget DoneTask(BuildContext context, AppDataBase providerDataBase) {
    return Padding(
      padding: EdgeInsets.only(
        right: getWidth(0.03, context),
        left: getWidth(0.03, context),
        top: getHeight(0.020, context),
      ),
      child: Slidable(
        useTextDirection: false,
        key: ValueKey(task.id),
        startActionPane: ActionPane(
          extentRatio: 0.35,
          motion: const DrawerMotion(),
          dismissible: DismissiblePane(onDismissed: () {}),
          dragDismissible: false,
          children: [
            CustomSlidableAction(
              onPressed: (context) {
                providerDataBase.deleteTask(task);
              },
              backgroundColor: AppColorsLight.redColor,
              foregroundColor: AppColorsLight.whiteColor,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.delete, size: 32),
                  SizedBox(height: getHeight(0.002, context)),
                  const Text(
                    'Delete',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      task.title,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColorsLight.greenColor, fontSize: 25),
                    ),
                    SizedBox(height: getHeight(0.002, context)),
                    Text(
                      task.description,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: AppColorsLight.blackColor),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.event_available,
                            color: AppColorsLight.greenColor),
                        SizedBox(width: getWidth(0.01, context)),
                        Text(
                          DateFormat('h:mm a').format(task.dateTime),
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: AppColorsLight.blackColor),
                        ),
                      ],
                    ),
                  ],
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
