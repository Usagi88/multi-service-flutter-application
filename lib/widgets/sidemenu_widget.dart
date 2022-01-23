import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';
import 'package:fpapp/classes/gradient_icon.dart';
import 'package:fpapp/provider/locale_provider.dart';
import 'package:fpapp/views/about_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'language_picker.dart';

class SideMenu extends StatelessWidget with PreferredSizeWidget{
  const SideMenu({Key? key}) : super(key: key);

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
  Drawer _portraitModeOnly(BuildContext context, language){
    if (language.locale.toString() == 'dv' || language.locale.toString() == 'ar'){
      return Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Container(
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
              title: Text(AppLocalizations.of(context)!.profile,),
              onTap: () => Navigator.of(context).pushNamed('/profile'),
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
              title: Text(AppLocalizations.of(context)!.schedulePayment,),
              onTap: () => Navigator.of(context).pushNamed('/scheduled-payments'),
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
              title: Text(AppLocalizations.of(context)!.changePassword,),
              onTap: () => Navigator.of(context).pushNamed('/reset-password'),
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
              title: Text(AppLocalizations.of(context)!.inviteFriends,),
              onTap: () => Navigator.of(context).pushNamed('/invite-friends'),
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
              title: Text(AppLocalizations.of(context)!.contactUs, ),
              onTap: () => Navigator.of(context).pushNamed('/contact-us'),
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
              title: Text(AppLocalizations.of(context)!.about,),
              onTap: () => Navigator.of(context).pushNamed('/about'),
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
              title: Text(AppLocalizations.of(context)!.refreshApp,),
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
              title: Text(AppLocalizations.of(context)!.logout,),
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
              title: Text(AppLocalizations.of(context)!.exitApp,),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 1,
                color: Color(0xffE0E0E0),
              ),
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.changeLanguage,),
              onTap: () async {
                // Show PopUp
                await showDialog(context: context, builder: (BuildContext context) {
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
          DrawerHeader(child: Container(
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
            onTap: () => Navigator.of(context).pushNamed('/profile'),
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
            onTap: () => Navigator.of(context).pushNamed('/scheduled-payments'),
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
            onTap: () => Navigator.of(context).pushNamed('/reset-password'),
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
            onTap: () => Navigator.of(context).pushNamed('/invite-friends'),
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
            onTap: () => Navigator.of(context).pushNamed('/contact-us'),
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
            onTap: () => Navigator.of(context).pushNamed('/about'),
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
              await showDialog(context: context, builder: (BuildContext context) {
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
