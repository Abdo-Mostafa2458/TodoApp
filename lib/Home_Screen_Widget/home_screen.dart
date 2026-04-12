import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/AppColors/app_colors.dart';
import 'package:todo_app/Home_Screen_Widget/Floating_Action_Bottom_widget/custom_floating_action_bottom.dart';
import 'package:todo_app/Home_Screen_Widget/List_tab_widgets/list_tab.dart';
import 'package:todo_app/Home_Screen_Widget/custom_bottom_navigation_app_ber.dart';
import 'package:todo_app/Home_Screen_Widget/settings_tab_widget/settings_tab.dart';
import 'package:todo_app/MediaQuery/media_quary.dart';
import 'package:todo_app/Provider/provider.dart';

class HomeScreen extends StatelessWidget {
  // List<Widget> tabs=[
  //   ListTab(),
  //   SettingsTab()
  // ];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppBottomNavigationBar>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.title),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: getHeight(0.10, context),
            color: AppColorsLight.appbarBlueColor,
          ),
          Expanded(
            child: provider.selectedIndex == 0 ? ListTab() : SettingsTab(),
          ),
        ],
      ),
      floatingActionButton: CustomFloatingActionBottom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavigationAppBer(),
    );
  }
}
// Column(
// children: [
// Container(
// width: double.infinity,
// height: getHeight(0.10, context),
// color: AppColorsLight.appbarBlueColor,
// ),
//
// Expanded(
// child: Container(
// width: double.infinity,
// height: double.infinity,
// // child: tabs[selectedIndex],
// child: provider.selectedIndex == 0 ? ListTab() : SettingsTab(),
// ),
// ),
// ],
// )