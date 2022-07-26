import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpapp/provider/locale_provider.dart';
import 'package:provider/provider.dart';

/*
  input field which takes text, can give different text to this button
 */
class GiftCardButtonWidget extends StatelessWidget {
  String buttonText;
  double? buttonWidth;
  double buttonHeight;
  bool available;
  bool selected;
  GiftCardButtonWidget({Key? key,
    required this.buttonText,
    this.buttonWidth,
    required this.buttonHeight,
    required this.available,
    required this.selected,
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

  //portrait mode
  Container _portraitModeOnly(BuildContext context, language){
    if (language.locale.toString() == 'dv' || language.locale.toString() == 'ar'){
      if(available != true || selected != true) {//using if condition to know if it is available or not
        return Container(
          height: buttonHeight,
          //width: buttonWidth,
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width > 350 ? 76 : 56,
          ),
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.grey.shade400,
                  width: 2
              ),
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),

          child: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.grey.shade600,
              padding: EdgeInsets.all(0.0),
            ),
            onPressed: () { },
            child: Text(
              buttonText,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Roboto'
              ),
            ),
          ),
        );
      }else{
        return Container(
          height: buttonHeight,
          //width: buttonWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
          ),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width > 350 ? 76 : 56,
          ),
          child: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
              padding: EdgeInsets.all(0.0),
            ),
            onPressed: () { },
            child: Text(
              buttonText,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Roboto'
              ),
            ),
          ),
        );
      }
    }
    if(available != true || selected != true) {//using if condition to know if it is available or not
      return Container(
        height: buttonHeight,
        //width: buttonWidth,
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width > 350 ? 76 : 56,
        ),
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.grey.shade400,
                width: 2
            ),
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),

        child: TextButton(
          style: TextButton.styleFrom(
            primary: Colors.grey.shade600,
            padding: EdgeInsets.all(0.0),
          ),
          onPressed: () { },
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400
            ),
          ),
        ),
      );
    }else{
      return Container(
        height: buttonHeight,
        //width: buttonWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
        ),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width > 350 ? 76 : 56,
        ),
        child: TextButton(
          style: TextButton.styleFrom(
            primary: Colors.white,
            padding: EdgeInsets.all(0.0),
          ),
          onPressed: () { },
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400
            ),
          ),
        ),
      );
    }
  }
}
