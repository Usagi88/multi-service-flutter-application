import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ClickableLink extends StatelessWidget {
  String clickableLinkText;
  ClickableLink({Key? key,
    required this.clickableLinkText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _portraitModeOnly(context);
  }
  //portrait mode
  Row _portraitModeOnly(BuildContext context){
    return Row(
      children: [
        Container(
          width: 2,
          height: 32,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
          ),
        ),
        Expanded(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left:10.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 31,
                      //color: Colors.lightGreen,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          clickableLinkText,
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Padding(
                  padding: EdgeInsets.only(left:10.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width * 0.27,
                      decoration: BoxDecoration(
                        color: Color(0xffe0e0e0),
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  //landscape mode
  /*
    Row _landscapeModeOnly(BuildContext context){
    return Row(
      children: [
        Container(
          width: 2,
          height: 32,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
          ),
        ),
        Expanded(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left:10.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 31,
                      //color: Colors.lightGreen,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          clickableLinkText,
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left:10.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width * 0.15,
                      decoration: BoxDecoration(
                        color: Color(0xffe0e0e0),
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
   */

}
