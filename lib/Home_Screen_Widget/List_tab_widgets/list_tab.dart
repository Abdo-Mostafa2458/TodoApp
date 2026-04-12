import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Home_Screen_Widget/List_tab_widgets/slider/custom_task_picked.dart';
import 'package:todo_app/Provider/provider.dart';

class ListTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppDataBase providerDataBase = Provider.of<AppDataBase>(context);
    if (providerDataBase.taskList.isEmpty) {
      providerDataBase.getAllTasks();
    }
    return Column(
      children: [
        EasyDateTimeLine(
          key: ValueKey(providerDataBase.pickedDate),
          initialDate: providerDataBase.pickedDate,
          onDateChange: (selectedDate) {
            //`selectedDate` the new date selected.
            providerDataBase.changePickedDate(selectedDate);
            print("change date sucess");
            // providerDataBase.getAllTasks();
            print("add date task sucess");
          },
          headerProps: const EasyHeaderProps(
            monthPickerType: MonthPickerType.switcher,
            dateFormatter: DateFormatter.fullDateDMY(),
          ),
          dayProps: const EasyDayProps(
            dayStructure: DayStructure.dayStrDayNumMonth,
            borderColor: Colors.black,
            activeDayStyle: DayStyle(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff3371FF),
                    Color(0xff8426D6),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => CustomTaskPicked(
              task: providerDataBase.taskList[index],
            ),
            itemCount: providerDataBase.taskList.length,
            scrollDirection: Axis.vertical,
          ),
        )
      ],
    );
  }
}

// Stack(
// children: [
// Column(
// children: [
// Expanded(
// child: Container(
// width: double.infinity,
// height: double.infinity,
// color: AppColorsLight.appbarBlueColor,
// alignment: Alignment.center,
// ),
// ),
// Expanded(
// flex: 18,
// child: Container(
// width: double.infinity,
// height: double.infinity,
// color: Colors.red,
// ),
// )
// ],
// ),
// Positioned(
// top: 15,
// left: 180,
// child: Text("data",)),
// ],
// )