import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';

class NavbarWithBackButton extends StatelessWidget with PreferredSizeWidget{
  bool? includeShadow;
  NavbarWithBackButton({Key? key, this.includeShadow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _portraitModeOnly(context);
  }

  //portrait
  AppBar _portraitModeOnly(BuildContext context){
    if(includeShadow == true) {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: Builder(
          builder: (BuildContext context) {
            return RadiantGradientMask(
              child: IconButton(
                icon: Icon(FontAwesomeIcons.arrowLeft),
                onPressed: () {
                  //Scaffold.of(context).openDrawer();
                  Navigator.of(context).pushNamed('/home');
                },
                //tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            );
          },
        ),
        centerTitle: true,
        title: Container(
          alignment: Alignment.center,
          height: 26,
          child: SizedBox(
              child: Image.asset(
                'assets/images/fahipay-logo.png',
              )),
        ),
        actions: [
          RadiantGradientMask(
            child: IconButton(
              icon: Icon(FontAwesomeIcons.qrcode),
              onPressed: () {
                Navigator.of(context).pushNamed('/scan-qr-code');
              },
            ),
          ),
          RadiantGradientMask(
            child: IconButton(
              icon: Icon(FontAwesomeIcons.comment),
              onPressed: () {
                Navigator.of(context).pushNamed('/live-chat');
              },
            ),
          ),
        ],
      );
    }else {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return RadiantGradientMask(
              child: IconButton(
                icon: Icon(FontAwesomeIcons.arrowLeft),
                onPressed: () {
                  //Scaffold.of(context).openDrawer();
                  Navigator.of(context).pushNamed('/home');
                },
                //tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            );
          },
        ),
        centerTitle: true,
        title: Container(
          alignment: Alignment.center,
          height: 26,
          child: SizedBox(
              child: Image.asset(
                'assets/images/fahipay-logo.png',
              )),
        ),
        actions: [
          RadiantGradientMask(
            child: IconButton(
              icon: Icon(FontAwesomeIcons.qrcode),
              onPressed: () {
                Navigator.of(context).pushNamed('/scan-qr-code');
              },
            ),
          ),
          RadiantGradientMask(
            child: IconButton(
              icon: Icon(FontAwesomeIcons.comment),
              onPressed: () {
                Navigator.of(context).pushNamed('/live-chat');
              },
            ),
          ),
        ],
      );
    }

  }

  //landscape
  /*
  AppBar _landscapeModeOnly(BuildContext context){
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Builder(
        builder: (BuildContext context) {
          return RadiantGradientMask(
            child: IconButton(
              icon: Icon(FontAwesomeIcons.bars),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          );
        },
      ),
      centerTitle: true,
      title: Container(
        alignment: Alignment.center,
        height: 26,
        child: SizedBox(
            child: Image.asset(
              'assets/images/fahipay-logo.png',
            )),
      ),
      actions: [
        RadiantGradientMask(
          child: IconButton(
            icon: Icon(FontAwesomeIcons.qrcode),
            onPressed: () {

            },
          ),
        ),
        RadiantGradientMask(
          child: IconButton(
            icon: Icon(FontAwesomeIcons.comment),
            onPressed: () {

            },
          ),
        ),
      ],
    );
  }
   */
  

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
//class that makes icons have gradient. Used in navbar/appbar
class RadiantGradientMask extends StatelessWidget {
  final Widget child;
  RadiantGradientMask({Key? key,
    required this.child
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => RadialGradient(
        center: Alignment.center,
        radius: 0.5,
        colors: [Color(0xff3AC170), Color(0xff25BFA3)],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}