import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/AppColors/app_colors.dart';
import 'package:todo_app/Home_Screen_Widget/Floating_Action_Bottom_widget/custom_text_form_field.dart';
import 'package:todo_app/MediaQuery/media_quary.dart';
import 'package:todo_app/Provider/provider.dart';

class DataPickerWidget extends StatefulWidget {
  const DataPickerWidget({super.key});

  @override
  State<DataPickerWidget> createState() => _DataPickerWidgetState();
}

class _DataPickerWidgetState extends State<DataPickerWidget> {
  DateTime pickedDate = DateTime.now();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppSettings>(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(getHeight(0.012, context)),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppLocalizations.of(context)!.new_task_title,
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
              hintText: AppLocalizations.of(context)!.add_task_title,
              verticalPadding: 10,
              errorText: "Please Enter Task Title",
            ),
            CustomTextFormField(
              hintText: AppLocalizations.of(context)!.description,
              verticalPadding: 50,
              errorText: "Please Enter Task Description",
            ),
            Padding(
              // padding: const EdgeInsets.all(12.0),
              padding: EdgeInsets.all(getHeight(0.012, context)),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.select_date,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(
                    width: getWidth(0.10, context),
                  ),
                  TextButton(
                      onPressed: () {
                        pickDate(context, provider.appLanguage);
                      },
                      child: Text(
                        "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}",
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ))
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: getHeight(0.015, context)),
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.blueAccent),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))))),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      if (mounted) {
                        //add Task
                      }
                    }
                  },
                  child: Text(
                    AppLocalizations.of(context)!.add_bottom,
                    style: Theme.of(context).textTheme.titleMedium,
                  )),
            )
          ],
        ),
      ),
    );
  }

  void pickDate(BuildContext context, String language) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: pickedDate,
      firstDate: pickedDate,
      lastDate: DateTime(2100),
      locale: Locale(language),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.blue, // 🔵 الهيدر + اليوم المختار
              onPrimary: Colors.white, // النص داخل الهيدر
              onSurface: Colors.black, // باقي الأيام
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue, // لون OK و CANCEL
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (selectedDate != null) {
      setState(() {
        pickedDate = selectedDate;
      });
    }
  }
}
