import 'dart:async';

import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fpapp/l10n/l10n.dart';

import 'package:fpapp/provider/locale_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountPickerWidget extends StatefulWidget {
  AccountPickerWidget({Key? key}) : super(key: key);

  @override
  _AccountPickerWidgetState createState() => _AccountPickerWidgetState();

}

class _AccountPickerWidgetState extends State<AccountPickerWidget> with SingleTickerProviderStateMixin{
  AnimationController? _animationController;
  Tween<double> _tween = Tween(begin: 0.1, end: 1);

  int? value = 0;


  List<Map<String, String>> accounts = [
    {"name": "User", "email": "test@gmail.com"},
    {"name": "User", "email": "test2@gmail.com"},
    {"name": "User", "email": "test3@gmail.com"},
  ];

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
    return _portraitModeOnly(context, language, _animationController, _tween,);
  }

  //portrait
  ScaleTransition _portraitModeOnly(BuildContext context, language, _animationController, _tween){
    if (language.locale.toString() == 'dv' || language.locale.toString() == 'ar'){

    }
    return ScaleTransition(
      scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.elasticOut)),
      child: AlertDialog(
        title: Align(
            alignment: Alignment.centerLeft,
            child: Text("Change email",style: TextStyle(fontWeight: FontWeight.w700,fontFamily: 'Roboto'),)
        ),
        content: Container(
          width: 300.0, // Change as per your requirement
            constraints: BoxConstraints(
              maxHeight: 300
            ),
          child:  ListView.builder(
            itemCount: accounts.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return RadioListTile(
                value: index,
                groupValue: value,
                onChanged: (ind) {
                  setState(() => value = ind as int);
                  print(ind);
                },
                title: Text(accounts[index]['email']!),
              );
            },

          )
        ),
        actions: [
          Row(
            children: <Widget>[
              Expanded(
                child: SizedBox(
                  height: 44,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        primary: Colors.red),
                    onPressed: () =>
                    {Navigator.pop(context)},
                    child: Text(
                      AppLocalizations.of(context)!.cancel,
                      style: TextStyle(
                          color: Colors.red),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 44,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Add Account"),
                  ),
                ),
              ),


            ],
          )
        ],
      ),
    );

  }
}
