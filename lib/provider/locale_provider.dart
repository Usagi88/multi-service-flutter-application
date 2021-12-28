import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier {
  Locale? _locale;

  Locale get locale => _locale ?? Locale('en');

  void changeLocale(Locale newLocale) {
    if(newLocale == Locale('en')){
      _locale = Locale('en');
    }else if(newLocale == Locale('hi')){
      _locale = Locale('hi');
    }else if(newLocale == Locale('ja')){
      _locale = Locale('ja');
    }else if(newLocale == Locale('dv')){
      _locale = Locale('dv');
    }

    notifyListeners();
  }
}