import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpapp/provider/locale_provider.dart';
import 'package:provider/provider.dart';

/*
  input field which takes hintText, can give different hint text to this textfield. Separated digit only from text since it uses different keyboards
 */
class TextfieldNumberWidget extends StatelessWidget {
  String hintText;
  String? insertText;
  TextfieldNumberWidget({Key? key,
    required this.hintText, this.insertText
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
      return Container(
        //height: MediaQuery.of(context).size.height * 0.053,
        height: 46,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Color(0xfff2f2f2),
        ),
        child: TextFormField(
          initialValue: insertText != null ? insertText : '',
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              // Only numbers can be entered
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 14)

          ),
        ),
      );
    }

    return Container(
      //height: MediaQuery.of(context).size.height * 0.053,
      height: 46,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Color(0xfff2f2f2),
      ),
      child: TextFormField(
        initialValue: insertText != null ? insertText : '',
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
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