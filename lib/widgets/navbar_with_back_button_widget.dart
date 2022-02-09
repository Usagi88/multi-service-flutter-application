import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';
import 'package:fpapp/classes/radiant_gradient_mask.dart';

class NavbarWithBackButton extends StatelessWidget with PreferredSizeWidget {
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
  Directionality _portraitModeOnly(BuildContext context) {
    if (includeShadow == true) {
      return Directionality(
        textDirection: TextDirection.ltr,
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          leading: Builder(
            builder: (BuildContext context) {
              return RadiantGradientMask(
                child: IconButton(
                  iconSize: 18,
                  icon: Icon(FontAwesomeIcons.arrowLeft),
                  onPressed: () {
                    //Scaffold.of(context).openDrawer();
                    Navigator.pushReplacementNamed(context, '/home');
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
                icon: Container(
                    width: 16,
                    height: 16,
                    child:
                        SvgPicture.asset("assets/images/icon/qrCodeIconSVG.svg")),
                onPressed: () {
                  Navigator.of(context).pushNamed('/scan-qr-code');
                },
              ),
            ),
            RadiantGradientMask(
              child: IconButton(
                icon: Container(
                    width: 20,
                    height: 20,
                    child: SvgPicture.asset(
                        "assets/images/icon/liveChatIconSVG.svg")),
                onPressed: () {
                  Navigator.of(context).pushNamed('/live-chat');
                },
              ),
            ),
          ],
        ),
      );
    } else {
      return Directionality(
        textDirection: TextDirection.ltr,
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Builder(
            builder: (BuildContext context) {
              return RadiantGradientMask(
                child: IconButton(
                  iconSize: 18,
                  icon: Icon(FontAwesomeIcons.arrowLeft),
                  onPressed: () {
                    //Scaffold.of(context).openDrawer();
                    Navigator.pushReplacementNamed(context, '/home');
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
                icon: Container(
                    width: 16,
                    height: 16,
                    child: SvgPicture.asset("assets/images/icon/qrCodeIconSVG.svg")),
                onPressed: () {
                  Navigator.of(context).pushNamed('/scan-qr-code');
                },
              ),
            ),
            RadiantGradientMask(
              child: IconButton(
                icon: Container(
                    width: 20,
                    height: 20,
                    child: SvgPicture.asset("assets/images/icon/liveChatIconSVG.svg")),
                onPressed: () {
                  Navigator.of(context).pushNamed('/live-chat');
                },
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
