import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

final value = new NumberFormat("#,##0.00", "en_US");

class BannerWidget extends StatelessWidget {
  IconData bannerIcon;
  double bannerAmount;
  int bannerPoints;
  BannerWidget({Key? key,
    required this.bannerIcon,
    required this.bannerAmount,
    required this.bannerPoints,
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
  Positioned _portraitModeOnly(BuildContext context){
    return Positioned(
      left: 80,
      right: 0,
      top: 15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
        crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
        children: [
          Container(
            //color: Colors.grey,
            width: 80,
            height: 100,
            child: IconButton(
              icon: Icon(bannerIcon, color: Colors.white, size: 50),
              onPressed: () {
              },
            ),
          ),
          Container(
            width: 1,
            height: 54,
            color: Color(0xff57cda5),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, //Center Column contents vertically,
                crossAxisAlignment: CrossAxisAlignment.center, //Center Column contents horizontally,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left:10.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(value.format(bannerAmount),
                                  style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.w700)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left:2.0, top: 3.0),
                        child: Container(
                          child: Text(bannerPoints.toString(),
                              style: TextStyle(fontSize: 14, color: Color(0xff055A40), fontWeight: FontWeight.w400)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left:10.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("200",
                                  style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.w700)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left:2.0, top: 3.0),
                        child: Container(
                          child: Text("Points",
                              style: TextStyle(fontSize: 14, color: Color(0xff055A40), fontWeight: FontWeight.w400)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //landscape
  /*
    Positioned _landscapeModeOnly(BuildContext context){
    return Positioned(
      left: 260,
      right: 0,
      top: 15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
        crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
        children: [
          Container(
            //color: Colors.grey,
            width: 80,
            height: 100,
            child: IconButton(
              icon: Icon(bannerIcon, color: Colors.white, size: 50),
              onPressed: () {
              },
            ),
          ),
          Container(
            width: 1,
            height: 54,
            color: Color(0xff57cda5),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, //Center Column contents vertically,
                crossAxisAlignment: CrossAxisAlignment.center, //Center Column contents horizontally,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left:10.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(value.format(bannerAmount),
                                  style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.w700)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left:2.0, top: 3.0),
                        child: Container(
                          child: Text(bannerPoints.toString(),
                              style: TextStyle(fontSize: 14, color: Color(0xff055A40), fontWeight: FontWeight.w400)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left:10.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("200",
                                  style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.w700)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left:2.0, top: 3.0),
                        child: Container(
                          child: Text("Points",
                              style: TextStyle(fontSize: 14, color: Color(0xff055A40), fontWeight: FontWeight.w400)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
   */

}
