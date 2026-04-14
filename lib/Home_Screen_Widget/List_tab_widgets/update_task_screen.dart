import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Home_Screen_Widget/Floating_Action_Bottom_widget/data_picker_widget.dart';
import 'package:todo_app/Provider/provider.dart';

import '../../AppColors/app_colors.dart';
import '../../MediaQuery/media_quary.dart';
import '../../firebase/Task.dart';
import '../../firebase/firebase_utils.dart';

class UpdateTaskScreen extends StatefulWidget {
  final Task task;

  const UpdateTaskScreen({super.key, required this.task});

  @override
  State<UpdateTaskScreen> createState() => _UpdateTaskScreenState();
}

class _UpdateTaskScreenState extends State<UpdateTaskScreen> {
  late AppDataBase providerDataBase;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      providerDataBase = Provider.of<AppDataBase>(context, listen: false);
      // providerDataBase.titleTask.text = widget.task.title;
      // providerDataBase.descriptionTask.text = widget.task.description;
      providerDataBase.changeSelectedDate(widget.task.dateTime);
    });
  }

  @override
  Widget build(BuildContext context) {
    providerDataBase = Provider.of<AppDataBase>(context, listen: false);
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
                left: getWidth(0.030, context),
                right: getWidth(0.030, context),
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
                  spacingBetweenSelectedData: 50,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void editFunction() async {
    await FirebaseUtils.UpdateTasksFromFireStore(
      widget.task,
      title: providerDataBase.titleTask.text,
      description: providerDataBase.descriptionTask.text,
      dateTime: providerDataBase.pickedDate,
    );
    providerDataBase.changePickedDate(providerDataBase.pickedDate);
    providerDataBase.titleTask.clear();
    providerDataBase.descriptionTask.clear();
  }
}
