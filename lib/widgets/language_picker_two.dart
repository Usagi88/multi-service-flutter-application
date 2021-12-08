import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fpapp/l10n/l10n.dart';

import 'package:fpapp/provider/locale_provider.dart';
import 'package:provider/provider.dart';


class LanguagePickerTwoWidget extends StatefulWidget {
  const LanguagePickerTwoWidget({Key? key}) : super(key: key);

  @override
  _LanguagePickerWidgetState createState() => _LanguagePickerWidgetState();
}

class _LanguagePickerWidgetState extends State<LanguagePickerTwoWidget> {


  @override
  Widget build(BuildContext context) {
    var language = Provider.of<LocaleProvider>(context);
    final provider = Provider.of<LocaleProvider>(context);
    final locale = provider.locale;

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _portraitModeOnly(context, language);
  }

  //portrait
  AlertDialog _portraitModeOnly(BuildContext context, language){
    return AlertDialog(
      title: Text('Languages'),
      content: Container(
        height: 300.0, // Change as per your requirement
        width: 300.0, // Change as per your requirement
        child: ListView(
          shrinkWrap: true,
          children: L10n.all.map((locale) {
            final flag = L10n.getFlag(locale.languageCode);
            final languageName = L10n.getLanguageName(locale.languageCode);
            return ListTile(
              leading: Text(flag, style: TextStyle(fontSize: 26),),
              title: Text(languageName, style: TextStyle(fontSize: 16),),
              onTap: () {
                language.changeLocale(Locale(locale.languageCode));
                Navigator.pop(context);
              },
            );
          }).toList(),
        ),
      ),
    );

  }
}
