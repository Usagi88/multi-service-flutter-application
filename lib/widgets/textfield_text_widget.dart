import 'package:flutter/material.dart';

/*
  input field which takes hintText, can give different hint text to this textfield. Separated digit only from text since it uses different keyboards
 */
class TextfieldTextWidget extends StatelessWidget {
  String hintText;
  TextfieldTextWidget({Key? key,
    required this.hintText,
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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Color(0xfff2f2f2),
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10.0),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          // Only numbers can be entered
          hintText: hintText,

        ),
      ),
    );
  }

  //landscape mode
  Container _landscapeModeOnly(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height * 0.110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Color(0xfff2f2f2),
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10.0),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          // Only numbers can be entered
          hintText: hintText,

        ),
      ),
    );
  }
}
