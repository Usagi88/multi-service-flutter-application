import 'package:flutter/material.dart';

/*
  input field which takes text, can give different text to this button
 */
class ButtonWidget extends StatelessWidget {
  String buttonText;
  ButtonWidget({Key? key,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait){
      return _portraitModeOnly(context);
    }else{
      return _landscapeModeOnly(context);
    }
  }

  //portrait mode
  Container _portraitModeOnly(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height * 0.053,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
        ),
        onPressed: () { },
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 14
          ),
        ),
      ),
    );
  }

  //landscape mode
  Container _landscapeModeOnly(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height * 0.110,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
        ),
        onPressed: () { },
        child: Text(
          buttonText,
          style: TextStyle(
              fontSize: 14
          ),
        ),
      ),
    );
  }
}
