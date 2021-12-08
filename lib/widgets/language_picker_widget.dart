import 'package:flutter/material.dart';

import 'package:fpapp/l10n/l10n.dart';

import 'package:fpapp/provider/locale_provider.dart';
import 'package:provider/provider.dart';


class LanguagePickerWidget extends StatefulWidget {
  const LanguagePickerWidget({Key? key}) : super(key: key);

  @override
  _LanguagePickerWidgetState createState() => _LanguagePickerWidgetState();
}

class _LanguagePickerWidgetState extends State<LanguagePickerWidget> {


  @override
  Widget build(BuildContext context) {
    var language = Provider.of<LocaleProvider>(context);
    final provider = Provider.of<LocaleProvider>(context);
    final locale = provider.locale;

    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: locale,
        //icon: Container(width: 16),
        items: L10n.all.map(
              (locale) {
            final flag = L10n.getFlag(locale.languageCode);

            return DropdownMenuItem(
              child: Center(
                child: Text(
                  flag,
                  style: TextStyle(fontSize: 32),
                ),
              ),
              value: locale,
              onTap: () {
                print(Locale('dv'));
                language.changeLocale(Locale(locale.languageCode));
              },
            );
          },
        ).toList(),
        onChanged: (_) {},
      ),
    );
  }
}
