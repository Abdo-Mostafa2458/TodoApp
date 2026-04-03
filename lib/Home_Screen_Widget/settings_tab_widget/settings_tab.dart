import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Home_Screen_Widget/settings_tab_widget/localization_language.dart';
import 'package:todo_app/Home_Screen_Widget/settings_tab_widget/localization_theme.dart';
import 'package:todo_app/Home_Screen_Widget/settings_tab_widget/localization_widget.dart';
import 'package:todo_app/Provider/provider.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppSettings>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 4),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.language,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: 17),
            ),
            LocalizationWidget(
              hintText: provider.appLanguage == "en"
                  ? AppLocalizations.of(context)!.english
                  : AppLocalizations.of(context)!.arabic,
              onClicked: changeLocallizationLanguage,
            ),
            Text(
              AppLocalizations.of(context)!.mode,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: 17),
            ),
            LocalizationWidget(
              hintText: provider.isLight()
                  ? AppLocalizations.of(context)!.light
                  : AppLocalizations.of(context)!.dark,
              onClicked: changeLocallizationTheme,
            ),
          ],
        ),
      ),
    );
  }
}

void changeLocallizationLanguage(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) => LocalizationLanguage(),
  );
}

void changeLocallizationTheme(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) => LocalizationTheme(),
  );
}
