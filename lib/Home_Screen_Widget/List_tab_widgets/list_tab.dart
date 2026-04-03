import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Home_Screen_Widget/List_tab_widgets/custom_ticket_picked.dart';

class ListTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EasyDateTimeLine(
          initialDate: DateTime.now(),
          onDateChange: (selectedDate) {
            //`selectedDate` the new date selected.
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
            itemBuilder: (context, index) => CustomTicketPicked(),
            itemCount: 15,
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