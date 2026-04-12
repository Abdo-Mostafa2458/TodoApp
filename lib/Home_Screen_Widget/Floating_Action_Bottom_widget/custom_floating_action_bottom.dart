import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../AppColors/app_colors.dart';
import '../../MediaQuery/media_quary.dart';
import '../../Provider/provider.dart';
import '../../firebase/Task.dart';
import '../../firebase/firebase_utils.dart';
import 'data_picker_widget.dart';

class CustomFloatingActionBottom extends StatelessWidget {
  late AppDataBase providerDataBase;

  late AppDataPicker providerDatePicked;

  @override
  Widget build(BuildContext context) {
    providerDataBase = Provider.of<AppDataBase>(context, listen: true);
    providerDatePicked = Provider.of<AppDataPicker>(context, listen: true);
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

  void dataPacker(BuildContext context) {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => DataPickerWidget(
        titleWidget: AppLocalizations.of(context)!.new_task_title,
        hintTextForm_1: AppLocalizations.of(context)!.add_task_title,
        hintTextForm_2: AppLocalizations.of(context)!.description,
        elevatedButtonText: AppLocalizations.of(context)!.add_bottom,
        spacingTextForm_1: 10,
        spacingTextForm_2: 50,
        paddingSelectedDate: EdgeInsets.all(getHeight(0.012, context)),
        paddingWidgetDatePicker: EdgeInsets.all(getHeight(0.012, context)),
        onClicked: addFun,
      ),
    );
  }

  void addFun() {
    print("add function ");
    print("Button Clicked ");

    print("Form Valid ✅");
    Task task = Task(
      title: providerDataBase.titleTask.text, //abdo
      description: providerDataBase.descriptionTask.text, //should sleep
      dateTime: providerDatePicked.pickedDate,
    );

    FirebaseUtils.addTaskToFireStore(task).timeout(
      Duration(seconds: 1),
      onTimeout: () {
        print("Task Added 🔥");

        providerDataBase.changePickedDate(task.dateTime);
        // providerDataBase.getAllTasks();
        print("data changed : ${task.dateTime}");
        providerDatePicked.pickedDate =
            DateTime.now(); //to reset the date picker
        providerDataBase.titleTask.clear();
        providerDataBase.descriptionTask.clear();

        // Navigator.pop(context);
      },
    );
    //  FirebaseUtils.addTaskToFireStore(task);
    // providerDataBase.addTaskData(task);
    // print("Task Added 🔥");
    // providerDataBase.changePickedDate(task.dateTime);
    // providerDatePicked.pickedDate = DateTime.now();
  }
}
