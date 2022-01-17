import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpapp/provider/locale_provider.dart';
import 'package:provider/provider.dart';

class WarningText extends StatelessWidget {
  String warningText;
  int warningTextBottomColor;
  WarningText({Key? key,
    required this.warningText,
    required this.warningTextBottomColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var language = Provider.of<LocaleProvider>(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _portraitModeOnly(context, language);
  }

  //portrait
  Column _portraitModeOnly(BuildContext context, language){
    if (language.locale.toString() == 'dv' || language.locale.toString() == 'ar'){
      return Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
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
            alignment: Alignment.centerRight,
            child: Container(
              height: 1,
              width: MediaQuery.of(context).size.width * 0.25,
              color: Color(warningTextBottomColor),
            ),
          ),
        ],
      );
    }

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
}
