import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('hi'),
    const Locale('ja'),
    const Locale('dv'),
  ];

  static String getFlag(String code) {
    switch (code) {
      case 'hi':
        return '🇮🇳';
      case 'ja':
        return '🇯🇵';
      case 'dv':
        return '🇲🇻';
      case 'en':
        return '🇺🇸';
      default:
        return '🇺🇸';
    }
  }

  static String getLanguageName(String code) {
    switch (code) {
      case 'hi':
        return 'Hindi';
      case 'ja':
        return 'Japanese';
      case 'dv':
        return 'Dhivehi';
      case 'en':
        return 'English';
      default:
        return '🇺🇸';
    }
  }

  static String getCountryCode(String code) {
    switch (code) {
      case 'hi':
        return 'in';
      case 'ja':
        return 'jp';
      case 'dv':
        return 'mv';
      case 'en':
        return 'us';
      default:
        return 'us';
    }
  }
}