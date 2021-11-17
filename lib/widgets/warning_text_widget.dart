import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WarningText extends StatelessWidget {
  String warningText;
  int warningTextBottomColor;
  WarningText({Key? key,
    required this.warningText,
    required this.warningTextBottomColor
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
  Column _portraitModeOnly(BuildContext context){
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            warningText,
            style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: Color(0xffE03838)
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: 1,
            width: MediaQuery.of(context).size.width * 0.25,
            color: Color(warningTextBottomColor),
          ),
        ),
      ],
    );
  }

  //landscape
  /*
    Column _landscapeModeOnly(BuildContext context){
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            warningText,
            style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: Color(0xffE03838)
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: 1,
            width: MediaQuery.of(context).size.width * 0.16,
            color: Color(warningTextBottomColor),
          ),
        ),
      ],
    );
  }
   */

}
