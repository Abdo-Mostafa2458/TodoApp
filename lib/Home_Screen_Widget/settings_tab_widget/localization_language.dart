import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/AppColors/app_colors.dart';
import 'package:todo_app/Home_Screen_Widget/settings_tab_widget/row_check_element.dart';
import 'package:todo_app/Home_Screen_Widget/settings_tab_widget/row_uncheck_element.dart';
import 'package:todo_app/Provider/provider.dart';

class LocalizationLanguage extends StatelessWidget {
  const LocalizationLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppSettings>(context);
    return Container(
      width: double.infinity,
      // padding: EdgeInsets.symmetric(vertical: getHeight(0.06, context),horizontal:getWidth(0.06, context) ),
      decoration: BoxDecoration(
          color: AppColorsLight.mainGrayColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25), topLeft: Radius.circular(25))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => provider.changeAppLanguage("en"),
            child: provider.appLanguage == "en"
                ? RowCheckElement(
                    RowText: AppLocalizations.of(context)!.english)
                : RowUncheckElement(
                    RowText: AppLocalizations.of(context)!.english),
          ),
          GestureDetector(
            onTap: () => provider.changeAppLanguage("ar"),
            child: provider.appLanguage == "ar"
                ? RowCheckElement(RowText: AppLocalizations.of(context)!.arabic)
                : RowUncheckElement(
                    RowText: AppLocalizations.of(context)!.arabic),
          ),
        ],
      ),
    );
  }
}
