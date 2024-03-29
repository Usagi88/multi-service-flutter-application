import 'dart:async';

import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fpapp/l10n/l10n.dart';

import 'package:fpapp/provider/locale_provider.dart';
import 'package:provider/provider.dart';


class LanguagePickerWidget extends StatefulWidget {
  const LanguagePickerWidget({Key? key}) : super(key: key);

  @override
  _LanguagePickerWidgetState createState() => _LanguagePickerWidgetState();
}

class _LanguagePickerWidgetState extends State<LanguagePickerWidget> with SingleTickerProviderStateMixin{
  AnimationController? _animationController;
  Tween<double> _tween = Tween(begin: 0.1, end: 1);

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),

    );
    Timer(Duration(milliseconds: 250), () => _animationController!.forward());
    _animationController!.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var language = Provider.of<LocaleProvider>(context);
    //final provider = Provider.of<LocaleProvider>(context);
    //final locale = provider.locale;

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _portraitModeOnly(context, language, _animationController, _tween);
  }

  //portrait
  ScaleTransition _portraitModeOnly(BuildContext context, language, _animationController, _tween){
    if (language.locale.toString() == 'dv' || language.locale.toString() == 'ar'){
      return ScaleTransition(
        scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.elasticOut)),
        child: AlertDialog(
          title: Align(
            alignment: Alignment.centerLeft,
              child: Text('Languages',style: TextStyle(fontWeight: FontWeight.w700,fontFamily: 'Roboto'),)
          ),
          content: Container(
            height: 300.0, // Change as per your requirement
            width: 300.0, // Change as per your requirement
            child: ListView(
              shrinkWrap: true,
              children: L10n.all.map((locale) {
                final flag = L10n.getCountryCode(locale.languageCode);
                final languageName = L10n.getLanguageName(locale.languageCode);
                return ListTile(
                  //leading: Text(flag, style: TextStyle(fontSize: 26),),
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  title: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(languageName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, fontFamily: 'Roboto' ),
                    ),
                  ),
                  trailing: CircleFlag(flag),
                  onTap: () {
                    language.changeLocale(Locale(locale.languageCode));
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ),
          ),
        ),
      );
    }
    return ScaleTransition(
      scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.elasticOut)),
      child: AlertDialog(
        title: Text('Languages',style: TextStyle(fontWeight: FontWeight.w700),),
        content: Container(
          height: 300.0, // Change as per your requirement
          width: 300.0, // Change as per your requirement
          child: ListView(
            shrinkWrap: true,
            children: L10n.all.map((locale) {
              final flag = L10n.getCountryCode(locale.languageCode);
              final languageName = L10n.getLanguageName(locale.languageCode);
              return ListTile(
                //leading: Text(flag, style: TextStyle(fontSize: 26),),
                contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                leading: CircleFlag(flag),
                title: Text(languageName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, ),),
                onTap: () {
                  language.changeLocale(Locale(locale.languageCode));
                  Navigator.pop(context);
                },
              );
            }).toList(),
          ),
        ),
      ),
    );

  }
}
