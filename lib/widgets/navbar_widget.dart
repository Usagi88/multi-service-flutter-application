import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';
import 'package:fpapp/classes/radiant_gradient_mask.dart';

class Navbar extends StatelessWidget with PreferredSizeWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _portraitModeOnly(context);
  }

  //portrait
  AppBar _portraitModeOnly(BuildContext context) {
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
            icon: Container(
                width: 20,
                height: 20,
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
                width: 24,
                height: 24,
                child:
                    SvgPicture.asset("assets/images/icon/liveChatIconSVG.svg")),
            iconSize: 11,
            onPressed: () {
              Navigator.of(context).pushNamed('/live-chat');
            },
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
