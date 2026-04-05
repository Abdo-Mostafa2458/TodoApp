import 'package:flutter/material.dart';

import '../firebase/Task.dart';
import '../firebase/firebase_utils.dart';

class AppSettings extends ChangeNotifier {
  String appLanguage = "en";
  ThemeMode appTheme = ThemeMode.light;

  void changeAppLanguage(String newLanguage) {
    if (appLanguage == newLanguage) return;
    appLanguage = newLanguage;
    notifyListeners();
  }

  void changeAppTheme(ThemeMode newTheme) {
    appTheme = newTheme;
    notifyListeners();
  }

  bool isLight() {
    return appTheme == ThemeMode.light;
  }
}

class AppBottomNavigationBar extends ChangeNotifier {
  int selectedIndex = 0;

  void changeSelectIndex(int newIndex) {
    selectedIndex = newIndex;
    notifyListeners();
  }
}

class AppDataPicker extends ChangeNotifier {
  DateTime pickedDate = DateTime.now();

  void changeSelectedDate(DateTime newPickedDate) {
    pickedDate = newPickedDate;
    notifyListeners();
  }
}

class AppFireBase extends ChangeNotifier {
  List<Task> taskList = [];
  DateTime pickedDate = DateTime.now(); // selected date 5/4

  void changePickedDate(DateTime newDate) {
    pickedDate = newDate;
    getAllTasks();
  }

  void getAllTasks() async {
    // get the Collection(Tasks)=>doucument(task)=>data and added to taskList
    taskList = await FirebaseUtils.getTasksFromFireStore();

    //fillter the tasks depends on selectedDate by user
    taskList = taskList.where(
      (task) {
        if (pickedDate.day == task.dateTime.day &&
            pickedDate.month == task.dateTime.month &&
            pickedDate.year == task.dateTime.year) {
          return true;
        }
        return false;
      },
    ).toList();
    //sort the tasks
    taskList.sort(
      (Task task_1, Task task_2) {
        return task_1.dateTime.compareTo(task_2.dateTime);
      },
    );
    notifyListeners();
  }
}
