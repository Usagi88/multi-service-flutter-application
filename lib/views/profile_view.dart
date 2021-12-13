import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fpapp/widgets/header_widget.dart';
import 'package:fpapp/widgets/navbar_widget.dart';
import 'package:fpapp/widgets/navbar_with_back_button_widget.dart';
import 'package:fpapp/widgets/sidemenu_widget.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _portraitModeOnly(context);
  }
}

//portrait
Scaffold _portraitModeOnly(BuildContext context) {
  return Scaffold(
    appBar: NavbarWithBackButton(),
    drawer: SideMenu(),
    body: SafeArea(
      child: SingleChildScrollView(
        child: Column(//not putting padding on column because logo image requires different padding
          children: [
            Header(),
            SizedBox(
              height: 10,
            ),
            Row(
              children:[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    AppLocalizations.of(context)!.profile,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: const SizedBox(
                    height: 1.0,
                    child: const DecoratedBox(
                      decoration: const BoxDecoration(
                          color: Color(0xffcccccc)
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.email),
              subtitle: Text('Hussain.shafiu@gmail.com'),
              trailing: GradientIcon(
                FontAwesomeIcons.solidEdit,
                22.0,
                LinearGradient(
                  colors: <Color>[
                    Color(0xff3AC170),
                    Color(0xff25BFA3),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.mobileNumber,),
              subtitle: Text('Hussain.shafiu@gmail.com'),
              trailing: GradientIcon(
                FontAwesomeIcons.solidEdit,
                22.0,
                LinearGradient(
                  colors: <Color>[
                    Color(0xff3AC170),
                    Color(0xff25BFA3),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.address),
              subtitle: Text('Hussain.shafiu@gmail.com'),
              trailing: GradientIcon(
                FontAwesomeIcons.solidEdit,
                22.0,
                LinearGradient(
                  colors: <Color>[
                    Color(0xff3AC170),
                    Color(0xff25BFA3),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.email),
              subtitle: Text('Hussain.shafiu@gmail.com'),
              trailing: GradientIcon(
                FontAwesomeIcons.solidEdit,
                22.0,
                LinearGradient(
                  colors: <Color>[
                    Color(0xff3AC170),
                    Color(0xff25BFA3),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.email),
              subtitle: Text('Hussain.shafiu@gmail.com'),
              trailing: GradientIcon(
                FontAwesomeIcons.solidEdit,
                22.0,
                LinearGradient(
                  colors: <Color>[
                    Color(0xff3AC170),
                    Color(0xff25BFA3),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.email),
              subtitle: Text('Hussain.shafiu@gmail.com'),
              trailing: GradientIcon(
                FontAwesomeIcons.solidEdit,
                22.0,
                LinearGradient(
                  colors: <Color>[
                    Color(0xff3AC170),
                    Color(0xff25BFA3),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

//landscape
/*
  Scaffold _landscapeModeOnly(BuildContext context) {
  return Scaffold(
    appBar: Navbar(),
    drawer: SideMenu(),
    body: SafeArea(
      child: SingleChildScrollView(
        child: Column(//not putting padding on column because logo image requires different padding
          children: [
            Header(),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children:[
                  Text(
                    'Profile',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width * 0.72,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: Text('Email'),
              subtitle: Text('Hussain.shafiu@gmail.com'),
              trailing: GradientIcon(
                FontAwesomeIcons.solidEdit,
                22.0,
                LinearGradient(
                  colors: <Color>[
                    Color(0xff3AC170),
                    Color(0xff25BFA3),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            ListTile(
              title: Text('Mobile Number'),
              subtitle: Text('Hussain.shafiu@gmail.com'),
              trailing: GradientIcon(
                FontAwesomeIcons.solidEdit,
                22.0,
                LinearGradient(
                  colors: <Color>[
                    Color(0xff3AC170),
                    Color(0xff25BFA3),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            ListTile(
              title: Text('Address'),
              subtitle: Text('Hussain.shafiu@gmail.com'),
              trailing: GradientIcon(
                FontAwesomeIcons.solidEdit,
                22.0,
                LinearGradient(
                  colors: <Color>[
                    Color(0xff3AC170),
                    Color(0xff25BFA3),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            ListTile(
              title: Text('Email'),
              subtitle: Text('Hussain.shafiu@gmail.com'),
              trailing: GradientIcon(
                FontAwesomeIcons.solidEdit,
                22.0,
                LinearGradient(
                  colors: <Color>[
                    Color(0xff3AC170),
                    Color(0xff25BFA3),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            ListTile(
              title: Text('Email'),
              subtitle: Text('Hussain.shafiu@gmail.com'),
              trailing: GradientIcon(
                FontAwesomeIcons.solidEdit,
                22.0,
                LinearGradient(
                  colors: <Color>[
                    Color(0xff3AC170),
                    Color(0xff25BFA3),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            ListTile(
              title: Text('Email'),
              subtitle: Text('Hussain.shafiu@gmail.com'),
              trailing: GradientIcon(
                FontAwesomeIcons.solidEdit,
                22.0,
                LinearGradient(
                  colors: <Color>[
                    Color(0xff3AC170),
                    Color(0xff25BFA3),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
 */


//class that makes icons have gradient. Used in ListTile
class GradientIcon extends StatelessWidget {
  GradientIcon(
      this.icon,
      this.size,
      this.gradient,
      );

  final IconData icon;
  final double size;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: SizedBox(
        width: size * 1.2,
        height: size * 1.2,
        child: Icon(
          icon,
          size: size,
          color: Colors.white,
        ),
      ),
      shaderCallback: (Rect bounds) {
        final Rect rect = Rect.fromLTRB(0, 0, size, size);
        return gradient.createShader(rect);
      },
    );
  }
}
