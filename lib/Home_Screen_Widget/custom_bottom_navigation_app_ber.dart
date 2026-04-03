import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Provider/provider.dart';

class CustomBottomNavigationAppBer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppHomeScreen>(context);
    return BottomAppBar(
      notchMargin: 10,
      child: BottomNavigationBar(
          currentIndex: provider.selectedIndex,
          onTap: (index) {
            // selectedIndex = index;
            provider.changeSelectIndex(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: AppLocalizations.of(context)!.list,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: AppLocalizations.of(context)!.settings,
            ),
          ]),
    );
  }
}
