import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Home_Screen_Widget/Floating_Action_Bottom_widget/data_picker_widget.dart';
import 'package:todo_app/Provider/provider.dart';

import '../../AppColors/app_colors.dart';
import '../../MediaQuery/media_quary.dart';
import '../../firebase/Task.dart';
import '../../firebase/firebase_utils.dart';

class UpdateTaskScreen extends StatelessWidget {
  final Task task;

  UpdateTaskScreen({required this.task});

  var formKey = GlobalKey<FormState>();
  late AppDataBase providerDataBase;

  late AppDataPicker providerDatePicked;

  @override
  Widget build(BuildContext context) {
    providerDataBase = Provider.of<AppDataBase>(context, listen: true);
    providerDatePicked = Provider.of<AppDataPicker>(context, listen: true);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.title),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: getHeight(0.10, context),
            color: AppColorsLight.appbarBlueColor,
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            // padding: EdgeInsets.symmetric(vertical: 5),
            margin: EdgeInsets.only(
                left: getWidth(0.10, context),
                right: getWidth(0.10, context),
                bottom: getHeight(0.20, context),
                top: getHeight(0.05, context)),
            child: Card(
              color: Colors.white,
              borderOnForeground: true,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                    vertical: getHeight(0.03, context),
                    horizontal: getWidth(0.03, context)),
                child: DataPickerWidget(
                  titleWidget: "Edit Task",
                  hintTextForm_1: "Add Title Task",
                  hintTextForm_2: "Add Description Task",
                  marginSelectedDate:
                      EdgeInsets.only(top: getHeight(0.020, context)),
                  spacingTextForm_1: 10,
                  spacingTextForm_2: 40,
                  elevatedButtonText: "Edit",
                  onClicked: editFunction,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void editFunction() async {
    print("${providerDataBase.titleTask.text}---------"); //  --------
    print("edit function");
    print("Button Clicked ");
    // providerDataBase.editTaskData(task,title:providerDataBase.titleTask.text,description: providerDataBase.descriptionTask.text,dateTime:providerDatePicked.pickedDate );
    await FirebaseUtils.UpdateTasksFromFireStore(task,
            title: providerDataBase.titleTask.text,
            description: providerDataBase.descriptionTask.text,
            dateTime: providerDatePicked.pickedDate)
        .timeout(
      Duration(milliseconds: 5),
      onTimeout: () {
        providerDataBase.getAllTasks();
      },
    );
    providerDataBase.titleTask.clear();
    providerDataBase.descriptionTask.clear();
  }
}
