import 'package:flutter/material.dart';
import 'package:todo_app/Home_Screen_Widget/settings_tab_widget/localization_widget.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 4),
      child: Column(
        children: [
          LocalizationWidget(
            hintText: "English",
            lableText: "Language",
          ),
          LocalizationWidget(
            hintText: "light",
            lableText: "Mode",
          ),
        ],
      ),
    );
  }
}
