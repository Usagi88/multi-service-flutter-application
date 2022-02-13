


import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';


import 'package:fpapp/classes/gradient_icon.dart';
import 'package:fpapp/provider/locale_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fpapp/widgets/account_picker.dart';

import 'package:provider/provider.dart';
import '../main.dart';
import 'language_picker.dart';

class SideMenu extends StatelessWidget with PreferredSizeWidget {
  SideMenu({Key? key}) : super(key: key);





  @override
  Widget build(BuildContext context) {
    var language = Provider.of<LocaleProvider>(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);


    return _portraitModeOnly(context, language);
  }

  //portrait mode
  Drawer _portraitModeOnly(BuildContext context, language) {
    if (language.locale.toString() == 'dv' ||
        language.locale.toString() == 'ar') {
      return Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Container(
                alignment: Alignment.centerRight,
                child: SizedBox(
                    height: 34,
                    child: Image.asset(
                      'assets/images/fahipay-logo.png',
                    )),
              ),
            ),
            ListTile(
              leading: GradientIcon(
                FontAwesomeIcons.userAlt,
                24.0,
                LinearGradient(
                  colors: <Color>[
                    Color(0xff3AC170),
                    Color(0xff25BFA3),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              title: Text(
                AppLocalizations.of(context)!.profile,
              ),
              onTap: () => {
                Navigator.pop(context),
                Navigator.pushNamed(context, '/profile'),
              },
            ),
            ListTile(
              leading: GradientIcon(
                FontAwesomeIcons.calendarAlt,
                24.0,
                LinearGradient(
                  colors: <Color>[
                    Color(0xff3AC170),
                    Color(0xff25BFA3),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              title: Text(
                AppLocalizations.of(context)!.schedulePayment,
              ),
              onTap: () => {
                Navigator.pop(context),
                Navigator.pushNamed(context, '/scheduled-payments'),
              },
            ),
            ListTile(
              leading: GradientIcon(
                FontAwesomeIcons.lock,
                24.0,
                LinearGradient(
                  colors: <Color>[
                    Color(0xff3AC170),
                    Color(0xff25BFA3),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              title: Text(
                AppLocalizations.of(context)!.changePassword,
              ),
              onTap: () => {
                Navigator.pop(context),
                Navigator.pushNamed(context, '/reset-password'),
              },
            ),
            ListTile(
              leading: GradientIcon(
                FontAwesomeIcons.bullhorn,
                24.0,
                LinearGradient(
                  colors: <Color>[
                    Color(0xff3AC170),
                    Color(0xff25BFA3),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              title: Text(
                AppLocalizations.of(context)!.inviteFriends,
              ),
              onTap: () => {
                Navigator.pop(context),
                Navigator.pushNamed(context, '/invite-friends'),
              },
            ),
            ListTile(
              leading: GradientIcon(
                FontAwesomeIcons.phoneAlt,
                24.0,
                LinearGradient(
                  colors: <Color>[
                    Color(0xff3AC170),
                    Color(0xff25BFA3),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              title: Text(
                AppLocalizations.of(context)!.contactUs,
              ),
              onTap: () => {
                Navigator.pop(context),
                Navigator.pushNamed(context, '/contact-us'),
              },
            ),
            ListTile(
              leading: GradientIcon(
                FontAwesomeIcons.infoCircle,
                24.0,
                LinearGradient(
                  colors: <Color>[
                    Color(0xff3AC170),
                    Color(0xff25BFA3),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              title: Text(
                AppLocalizations.of(context)!.about,
              ),
              onTap: () => {
                Navigator.pop(context),
                Navigator.pushNamed(context, '/about'),
              },
            ),
            ListTile(
              leading: GradientIcon(
                FontAwesomeIcons.syncAlt,
                24.0,
                LinearGradient(
                  colors: <Color>[
                    Color(0xff3AC170),
                    Color(0xff25BFA3),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              title: Text(
                AppLocalizations.of(context)!.refreshApp,
              ),
              onTap: () {
                RestartWidget.restartApp(context);
              },
            ),
            ListTile(
              leading: GradientIcon(
                FontAwesomeIcons.signOutAlt,
                24.0,
                LinearGradient(
                  colors: <Color>[
                    Color(0xff3AC170),
                    Color(0xff25BFA3),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              title: Text(
                AppLocalizations.of(context)!.logout,
              ),
              onTap: () {

              },
            ),
            ListTile(
              leading: GradientIcon(
                FontAwesomeIcons.powerOff,
                24.0,
                LinearGradient(
                  colors: <Color>[
                    Color(0xff3AC170),
                    Color(0xff25BFA3),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              title: Text(
                AppLocalizations.of(context)!.exitApp,
              ),
              onTap: () {
                SystemNavigator.pop();
              },
            ),
            ListTile(
              leading: GradientIcon(
                FontAwesomeIcons.userFriends,
                24.0,
                LinearGradient(
                  colors: <Color>[
                    Color(0xff3AC170),
                    Color(0xff25BFA3),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              onTap: () {
                //EmailResult? emailResult = await AccountPicker.emailHint();

              },
              title: Text(AppLocalizations.of(context)!.changeAccount),
            ),
            ListTile(
              leading: GradientIcon(
                FontAwesomeIcons.cog,
                24.0,
                LinearGradient(
                  colors: <Color>[
                    Color(0xff3AC170),
                    Color(0xff25BFA3),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              onTap: () => {
                Navigator.pop(context),
                Navigator.pushNamed(context, '/settings'),
              },
              title: Text(AppLocalizations.of(context)!.settings),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 1,
                color: Color(0xffE0E0E0),
              ),
            ),
            ListTile(
              title: Text(
                AppLocalizations.of(context)!.changeLanguage,
              ),
              onTap: () async {
                // Show PopUp
                await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return LanguagePickerWidget();
                    });

                // Doesn't run
                Navigator.pop(context);
              },
            )
          ],
        ),
      );
    }

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Container(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                  height: 34,
                  child: Image.asset(
                    'assets/images/fahipay-logo.png',
                  )),
            ),
          ),
          ListTile(
            leading: GradientIcon(
              FontAwesomeIcons.userAlt,
              24.0,
              LinearGradient(
                colors: <Color>[
                  Color(0xff3AC170),
                  Color(0xff25BFA3),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            title: Text(AppLocalizations.of(context)!.profile),
            onTap: () => {
              Navigator.pop(context),
              Navigator.pushNamed(context, '/profile'),
            },
          ),
          ListTile(
            leading: GradientIcon(
              FontAwesomeIcons.calendarAlt,
              24.0,
              LinearGradient(
                colors: <Color>[
                  Color(0xff3AC170),
                  Color(0xff25BFA3),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            title: Text(AppLocalizations.of(context)!.schedulePayment),
            onTap: () => {
              Navigator.pop(context),
              Navigator.pushNamed(context, '/scheduled-payments'),
            },
          ),
          ListTile(
            leading: GradientIcon(
              FontAwesomeIcons.lock,
              24.0,
              LinearGradient(
                colors: <Color>[
                  Color(0xff3AC170),
                  Color(0xff25BFA3),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            title: Text(AppLocalizations.of(context)!.changePassword),
            onTap: () => {
              Navigator.pop(context),
              Navigator.pushNamed(context, '/reset-password'),
            },
          ),
          ListTile(
            leading: GradientIcon(
              FontAwesomeIcons.bullhorn,
              24.0,
              LinearGradient(
                colors: <Color>[
                  Color(0xff3AC170),
                  Color(0xff25BFA3),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            title: Text(AppLocalizations.of(context)!.inviteFriends),
            onTap: () => {
              Navigator.pop(context),
              Navigator.pushNamed(context, '/invite-friends'),
            },
          ),
          ListTile(
            leading: GradientIcon(
              FontAwesomeIcons.phoneAlt,
              24.0,
              LinearGradient(
                colors: <Color>[
                  Color(0xff3AC170),
                  Color(0xff25BFA3),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            title: Text(AppLocalizations.of(context)!.contactUs),
            onTap: () => {
              Navigator.pop(context),
              Navigator.pushNamed(context, '/contact-us'),
            },
          ),
          ListTile(
            leading: GradientIcon(
              FontAwesomeIcons.infoCircle,
              24.0,
              LinearGradient(
                colors: <Color>[
                  Color(0xff3AC170),
                  Color(0xff25BFA3),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            title: Text(AppLocalizations.of(context)!.about),
            onTap: () => {
              Navigator.pop(context),
              Navigator.pushNamed(context, '/about'),
            },
          ),
          ListTile(
            leading: GradientIcon(
              FontAwesomeIcons.syncAlt,
              24.0,
              LinearGradient(
                colors: <Color>[
                  Color(0xff3AC170),
                  Color(0xff25BFA3),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            title: Text(AppLocalizations.of(context)!.refreshApp),
            onTap: () {
              RestartWidget.restartApp(context);
            },
          ),
          ListTile(
            leading: GradientIcon(
              FontAwesomeIcons.signOutAlt,
              24.0,
              LinearGradient(
                colors: <Color>[
                  Color(0xff3AC170),
                  Color(0xff25BFA3),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            title: Text(AppLocalizations.of(context)!.logout),
            onTap: () {

            },
          ),
          ListTile(
            leading: GradientIcon(
              FontAwesomeIcons.powerOff,
              24.0,
              LinearGradient(
                colors: <Color>[
                  Color(0xff3AC170),
                  Color(0xff25BFA3),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            title: Text(AppLocalizations.of(context)!.exitApp),
            onTap: () {
              SystemNavigator.pop();
            },
          ),
          ListTile(
            leading: GradientIcon(
              FontAwesomeIcons.userFriends,
              24.0,
              LinearGradient(
                colors: <Color>[
                  Color(0xff3AC170),
                  Color(0xff25BFA3),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            onTap: () async {
              // Show PopUp
              await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AccountPickerWidget();
                  });

              // Doesn't run
              Navigator.pop(context);
            },
            title: Text(AppLocalizations.of(context)!.changeAccount),
          ),
          ListTile(
            leading: GradientIcon(
              FontAwesomeIcons.cog,
              24.0,
              LinearGradient(
                colors: <Color>[
                  Color(0xff3AC170),
                  Color(0xff25BFA3),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            onTap: () => {
              Navigator.pop(context),
              Navigator.pushNamed(context, '/settings'),
            },
            title: Text(AppLocalizations.of(context)!.settings),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 1,
              color: Color(0xffE0E0E0),
            ),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.changeLanguage),
            onTap: () async {
              // Show PopUp
              await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return LanguagePickerWidget();
                  });

              // Doesn't run
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
