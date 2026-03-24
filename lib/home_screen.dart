import 'package:flutter/material.dart';
import 'package:todo_app/AppColors/app_colors.dart';

class HomeScreen extends StatelessWidget {
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
            height: 50,
            color: AppColorsLight.appbarBlueColor,
          )
        ],
      ),
    );
  }
}
