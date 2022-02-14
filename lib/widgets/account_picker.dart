import 'dart:async';

import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fpapp/classes/gradient_icon.dart';

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
  bool _passwordVisible = true;

  List<Map<String, String>> accounts = [
    {"name": "User1", "email": "test1@gmail.com"},
    {"name": "User2", "email": "test2@gmail.com"},
    {"name": "User3", "email": "test3@gmail.com"},
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

  _togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
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
        title: Row(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(AppLocalizations.of(context)!.manageAccount,style: TextStyle(fontWeight: FontWeight.w700,fontFamily: 'Roboto'),),
            ),
            Spacer(),
            IconButton(
              onPressed:() {
                showDialog(
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(
                      builder: (context, setState) {
                        return AlertDialog(
                          title: Column(
                            children: [
                              const Icon(
                                FontAwesomeIcons.exclamationTriangle,
                                color: Colors.orangeAccent,
                                size: 74.0,
                              ),
                            ],
                          ),
                          content: Text(
                            AppLocalizations.of(context)!.areYouSureRemoveAccount,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight:
                                FontWeight.w400),
                          ),
                          actions: [
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: SizedBox(
                                    height: 44,
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(AppLocalizations.of(context)!.yes),
                                    ),
                                  ),
                                ),
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

                              ],
                            )
                          ],
                        );
                      },
                    );
                  },
                );
              },
              icon: GradientIcon(
              FontAwesomeIcons.minusCircle,
              22.0,
              LinearGradient(
                colors: <Color>[
                  Color(0xff3AC170),
                  Color(0xff25BFA3),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),)
          ],
        ),
        content: Container(
          width: 300.0, // Change as per your requirement
            constraints: BoxConstraints(
              maxHeight: 300
            ),
          child:  ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color: Colors.grey.shade400,
            ),
            itemCount: accounts.length + 1,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              if(accounts.length  == index){
                return ListTile(
                  leading: GradientIcon(
                    FontAwesomeIcons.userPlus,
                    MediaQuery.of(context).size.width > 350 ? 24.0 : 18.0,
                    LinearGradient(
                      colors: <Color>[
                        Color(0xff3AC170),
                        Color(0xff25BFA3),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  title: Text(AppLocalizations.of(context)!.addAnotherAccount),
                  contentPadding: const EdgeInsets.all(0),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return AlertDialog(
                              title: Column(
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.email,
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!.enterNewEmail,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              content: Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextFormField(
                                      decoration: InputDecoration( hintText: AppLocalizations.of(context)!.email)
                                    ),
                                    TextFormField(
                                      obscureText: _passwordVisible,
                                      decoration: InputDecoration(
                                          labelText: AppLocalizations.of(context)!.password,
                                          suffixIcon: IconButton(
                                              icon: _passwordVisible
                                                  ? Icon(FontAwesomeIcons
                                                  .eye)
                                                  : Icon(FontAwesomeIcons
                                                  .eyeSlash),
                                              onPressed: () {
                                                setState(() {
                                                  _togglePasswordVisibility();
                                                });
                                                print(_passwordVisible);
                                              })),
                                    ),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
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
                                          child: Text(AppLocalizations.of(context)!.ok),
                                        ),
                                      ),
                                    ),
                                  ],
                                )

                              ],
                            );
                          },
                        );
                      },
                    );

                  },
                );
              }else{
                return RadioListTile(
                  controlAffinity: ListTileControlAffinity.trailing,
                  contentPadding: const EdgeInsets.all(0),
                  activeColor: Color(0xff27bf9c),
                  title: Text(accounts[index]['name']!),
                  secondary: Image(
                    image: AssetImage('assets/images/icon/pearl.png'),
                    width: 34,
                    height: 34,
                    fit: BoxFit.cover,

                  ),
                  value: index,
                  groupValue: value,
                  onChanged: (ind) {
                    setState(() => value = ind as int);
                  },
                  subtitle: Text(accounts[index]['email']!),
                );
              }

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
                    child: Text(AppLocalizations.of(context)!.ok),
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
