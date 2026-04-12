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



class AppDataBase extends ChangeNotifier {
  List<Task> taskList = [];
  DateTime pickedDate = DateTime.now();
  TextEditingController titleTask = TextEditingController();
  TextEditingController descriptionTask = TextEditingController();

  void changeSelectedDate(DateTime newPickedDate) {
    pickedDate = newPickedDate;
    notifyListeners();
  }

  // selected date 5/4

  void changePickedDate(DateTime newDate) {
    pickedDate = newDate;
    getAllTasks();
  }

  void editTaskData(Task task,
      {bool isDone = false,
      String title = '',
      String description = '',
      DateTime? dateTime}) async {
    await FirebaseUtils.UpdateTasksFromFireStore(task,
            isDone: isDone,
            title: title,
            description: description,
            dateTime: dateTime)
        .timeout(
      Duration(milliseconds: 5),
      onTimeout: () {
        getAllTasks();
      },
    );
  }

  void addTaskData(Task task) async {
    await FirebaseUtils.addTaskToFireStore(task);
    getAllTasks();
  }

  void getAllTasks() async {
    // get the Collection(Tasks)=>doucument(task)=>data and added to taskList
    taskList = await FirebaseUtils.getTasksFromFireStore();

    //fillter the tasks depends on selectedDate by user
    taskList = taskList.where(
      (task) {
        if (task.dateTime.day == pickedDate.day &&
            task.dateTime.month == pickedDate.month &&
            task.dateTime.year == pickedDate.year) {
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

  // void deleteTask(String taskId)async{
  //
  //
  //     // CollectionReference<Task> taskCollection= await FirebaseUtils.getCollections();//Collection
  //     //  taskCollection.doc(idTask).delete();
  //     await FirebaseUtils.deleteTasksFromFireStore(taskId);
  //
  //
  //
  //  getAllTasks();
  // }
  void deleteTask(Task task) async {
    // CollectionReference<Task> taskCollection= await FirebaseUtils.getCollections();//Collection
    //  taskCollection.doc(idTask).delete();
    await FirebaseUtils.deleteTasksFromFireStore(task);

    getAllTasks();
  }
}
