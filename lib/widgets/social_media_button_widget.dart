import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SocialMediaButton extends StatelessWidget {
  IconData socialMediaIcon;
  SocialMediaButton({Key? key,
    required this.socialMediaIcon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _portraitModeOnly(context);
  }

  //portrait
  Container _portraitModeOnly(BuildContext context) {
    return Container(
      width:  MediaQuery.of(context).size.width > 350 ? 63 : 55,
      height: 63,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        gradient: LinearGradient(
          colors: [
            const Color(0xff3AC170),
            const Color(0xff25BFA3),
          ],
        ),
      ),
      child: Icon(
        socialMediaIcon,
        size: 32,
        color: Colors.white,
      ),
    );
  }
}
