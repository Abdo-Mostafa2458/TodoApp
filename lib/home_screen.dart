import 'package:flutter/material.dart';
import 'package:todo_app/AppColors/app_colors.dart';
import 'package:todo_app/Home_Screen_Widget/List_tab_widgets/list_tab.dart';
import 'package:todo_app/Home_Screen_Widget/settings_tab_widget/settings_tab.dart';
import 'package:todo_app/MediaQuery/media_quary.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  // List<Widget> tabs=[
  //   ListTab(),
  //   SettingsTab()
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do List"),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: getHeight(0.10, context),
            color: AppColorsLight.appbarBlueColor,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              // child: tabs[selectedIndex],
              child: selectedIndex == 0 ? ListTab() : SettingsTab(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: AppColorsLight.whiteColor,
          size: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10,
        child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                print("index :$index");
                selectedIndex = index;
                print("selectedIndex:$selectedIndex");
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'List',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ]),
      ),
    );
  }
}
