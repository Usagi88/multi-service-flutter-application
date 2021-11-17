import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SideMenu extends StatelessWidget with PreferredSizeWidget{
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait){
      return _portraitModeOnly(context);
    }else{
      return _landscapeModeOnly(context);
    }
  }
  //portrait mode
  Drawer _portraitModeOnly(BuildContext context){
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
            title: Text("My Profile"),
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
            title: Text("Schedule Payments"),
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
            title: Text("Change Password"),
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
            title: Text("Invite Friends"),
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
            title: Text("Contact Us"),
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
            title: Text("About"),
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
            title: Text("Refresh App"),
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
            title: Text("Logout"),
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
            title: Text("Exit App"),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 1,
              color: Color(0xffE0E0E0),
            ),
          ),
          ListTile(
            title: Text("Change Language"),
          )
        ],
      ),
    );
  }
  //landscape mode
  Drawer _landscapeModeOnly(BuildContext context){
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
            title: Text("My Profile"),
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
            title: Text("Schedule Payments"),
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
            title: Text("Change Password"),
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
            title: Text("Invite Friends"),
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
            title: Text("Contact Us"),
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
            title: Text("About"),
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
            title: Text("Refresh App"),
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
            title: Text("Logout"),
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
            title: Text("Exit App"),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 1,
              color: Color(0xffE0E0E0),
            ),
          ),
          ListTile(
            title: Text("Change Language"),
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
//class that makes icons have gradient. Used in sidemenu
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