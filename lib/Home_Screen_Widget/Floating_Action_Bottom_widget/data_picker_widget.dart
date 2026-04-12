import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/AppColors/app_colors.dart';
import 'package:todo_app/Home_Screen_Widget/Floating_Action_Bottom_widget/custom_text_form_field.dart';
import 'package:todo_app/MediaQuery/media_quary.dart';
import 'package:todo_app/Provider/provider.dart';
import 'package:todo_app/firebase/Task.dart';
import 'package:todo_app/firebase/firebase_utils.dart';

typedef elevBottonFun = void Function();

class DataPickerWidget extends StatelessWidget {
  String titleWidget;
  String hintTextForm_1;
  String hintTextForm_2;
  String elevatedButtonText;
  double spacingTextForm_1;
  double spacingTextForm_2;
  double spacingBetweenSelectedData;
  elevBottonFun onClicked;
  EdgeInsetsGeometry? paddingSelectedDate;
  EdgeInsetsGeometry? marginSelectedDate;
  EdgeInsetsGeometry? paddingWidgetDatePicker;

  DataPickerWidget(
      {this.titleWidget = '',
      this.hintTextForm_1 = '',
      this.hintTextForm_2 = '',
      this.spacingTextForm_1 = 0,
      this.spacingTextForm_2 = 0,
      this.paddingSelectedDate,
      this.spacingBetweenSelectedData = 0,
      this.marginSelectedDate,
      this.paddingWidgetDatePicker,
      this.elevatedButtonText = '',
      required this.onClicked});

  var formKey = GlobalKey<FormState>();

  TextEditingController titleTask = TextEditingController();

  TextEditingController descriptionTask = TextEditingController();
  late AppDataBase providerDataBase;

  late AppDataPicker providerDatePicked;
  late Task task;

  @override
  Widget build(BuildContext context) {
    AppSettings provider = Provider.of<AppSettings>(context);
    providerDataBase = Provider.of<AppDataBase>(context, listen: false);
    providerDatePicked = Provider.of<AppDataPicker>(context, listen: true);
    return Container(
      width: double.infinity,
      padding: paddingWidgetDatePicker,
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              titleWidget,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: AppColorsLight.blackColor),
            ),
            SizedBox(
              height: getHeight(0.050, context),
            ),
            CustomTextFormField(
              hintText: hintTextForm_1,
              verticalPadding: spacingTextForm_1,
              errorText: "Please Enter Task Title",
              controller: providerDataBase.titleTask,
            ),
            CustomTextFormField(
              hintText: hintTextForm_2,
              verticalPadding: spacingTextForm_2,
              errorText: "Please Enter Task Description",
              controller: providerDataBase.descriptionTask,
            ),
            Container(
              // padding: const EdgeInsets.all(12.0),
              padding: paddingSelectedDate,
              margin: marginSelectedDate,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    AppLocalizations.of(context)!.select_date,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  // SizedBox(
                  //   width: getWidth(0.10, context),
                  // ),
                  TextButton(
                      onPressed: () {
                        pickDate(context, provider.appLanguage);
                      },
                      child: Text(
                        "${providerDatePicked.pickedDate.day}/${providerDatePicked.pickedDate.month}/${providerDatePicked.pickedDate.year}",
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ))
                ],
              ),
            ),
            Container(
              padding:
                  EdgeInsets.symmetric(vertical: getHeight(0.015, context)),
              margin: marginSelectedDate,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.blueAccent),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))))),
                  onPressed: () {
                    // isEditFun? editFun(task):addFun();
                    // isEditFun? print('editfun'):Navigator.pop(context);
                    if (formKey.currentState!.validate()) {
                      onClicked.call();
                      Navigator.pop(context);
                      //  FirebaseUtils.addTaskToFireStore(task);
                      // providerDataBase.addTaskData(task);
                      // print("Task Added 🔥");
                      // providerDataBase.changePickedDate(task.dateTime);
                      // providerDatePicked.pickedDate = DateTime.now();
                    } else {
                      print("Form NOT Valid ❌");
                    }
                  },
                  child: Text(
                    elevatedButtonText,
                    style: Theme.of(context).textTheme.titleMedium,
                  )),
            )
          ],
        ),
      ),
    );
  }

  void pickDate(
    BuildContext context,
    String language,
  ) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: providerDatePicked.pickedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      locale: Locale(language),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.blue,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (selectedDate != null) {
      DateTime now = DateTime.now();
      DateTime finalDate = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        now.hour, // الساعة الحالية
        now.minute, // الدقيقة الحالية
      );

      // بنحدث الـ Providers بالوقت الجديد "المدمج"
      providerDatePicked.changeSelectedDate(finalDate);
      providerDataBase.changePickedDate(finalDate);
    }
    // providerDataBase.changePickedDate(selectedDate);//---------------------------
  }

  void addFun() {
    print("add function ");
    print("Button Clicked ");
    if (formKey.currentState!.validate()) {
      print("Form Valid ✅");
      Task task = Task(
        title: titleTask.text,
        description: descriptionTask.text,
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

          // Navigator.pop(context);
        },
      );
      //  FirebaseUtils.addTaskToFireStore(task);
      // providerDataBase.addTaskData(task);
      // print("Task Added 🔥");
      // providerDataBase.changePickedDate(task.dateTime);
      // providerDatePicked.pickedDate = DateTime.now();
    } else {
      print("Form NOT Valid ❌");
    }
  }

  void editFun(Task task) async {
    print("edit function");
    print("Button Clicked ");
    await FirebaseUtils.UpdateTasksFromFireStore(task,
        isDone: false, title: '');
    providerDataBase.getAllTasks();
  }
}

/*
* onPressed: () async {
                    print("Button Clicked 🔥");

                    if (formKey.currentState!.validate()) {
                      print("Form Valid ✅");

                      Task task = Task(
                        title: titleTask.text,
                        description: descriptionTask.text,
                        dateTime: pickedDate,
                      );

                      await FirebaseUtils.addTaskToFireStore(task);

                      print("Task Added 🔥");

                      if (mounted) {
                        Navigator.pop(context);
                      }
                    } else {
                      print("Form NOT Valid ❌");
                    }
                  }*/