import 'package:flutter/material.dart';
import 'package:fpapp/classes/count_up.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:fpapp/provider/locale_provider.dart';
import 'package:provider/provider.dart';

final value = new NumberFormat("#,##0.00", "en_US");

class BannerWidget extends StatelessWidget {
  IconData bannerIcon;
  double bannerAmount;
  double bannerPoints;
  AnimationController? animationController;
  Tween<double> _tween = Tween(begin: 0.1, end: 1);
  BannerWidget({Key? key,
    required this.bannerIcon,
    required this.bannerAmount,
    required this.bannerPoints,
    this.animationController,
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
  Positioned _portraitModeOnly(BuildContext context, language){
    if (language.locale.toString() == 'dv' || language.locale.toString() == 'ar'){
      return Positioned(
        top: 10,
        left: 0,
        right: MediaQuery.of(context).size.width > 350 ? MediaQuery.of(context).size.width * 0.20 : MediaQuery.of(context).size.width * 0.16,
        //top: 15,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
          crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
          children: [
            if(animationController != null) ...[
              ScaleTransition(
                scale: _tween.animate(CurvedAnimation(parent: animationController!, curve: Curves.easeInOutBack)),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    //color: Colors.grey,
                    width: 80,
                    height: 80,
                    child: IconButton(
                      icon: Icon(bannerIcon, color: Colors.white, size: 50),
                      onPressed: () {
                      },
                    ),
                  ),
                ),
              ),
              ScaleTransition(
                scale: _tween.animate(CurvedAnimation(parent: animationController!, curve: Curves.easeInOutBack)),
                child: Padding(
                  padding: const EdgeInsets.only(left:10.0),
                  child: Container(
                    width: 1,
                    height: 54,
                    color: Color(0xff57cda5),
                  ),
                ),
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
                              child: SlideTransition(
                                position: Tween<Offset>(
                                  begin: Offset(0, -1),
                                  end: Offset.zero,
                                ).animate(animationController!),
                                child: FadeTransition(
                                  opacity: animationController!,
                                  child: Container(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Countup(
                                        begin: 0,
                                        end: bannerAmount,
                                        precision: 2,
                                        duration: Duration(milliseconds: 600),
                                        separator: ',',
                                        style: TextStyle(
                                            fontSize: 22, color: Colors.white, fontWeight: FontWeight.w700, fontFamily: 'Roboto'
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left:2.0, top: 3.0),
                            child: SlideTransition(
                              position: Tween<Offset>(
                                begin: Offset(0, -1),
                                end: Offset.zero,
                              ).animate(animationController!),
                              child: FadeTransition(
                                opacity: animationController!,
                                child: Container(
                                  child: Text('MVR',
                                      style: TextStyle(fontSize: 14, color: Color(0xff055A40), fontWeight: FontWeight.w400, fontFamily: 'Roboto')),
                                ),
                              ),
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
                              child: SlideTransition(
                                position: Tween<Offset>(
                                  begin: Offset(0, 1),
                                  end: Offset.zero,
                                ).animate(animationController!),
                                child: FadeTransition(
                                  opacity: animationController!,
                                  child: Container(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Countup(
                                        begin: 0,
                                        end: bannerPoints,
                                        duration: Duration(milliseconds: 600),
                                        separator: ',',
                                        style: TextStyle(
                                            fontSize: 22, color: Colors.white, fontWeight: FontWeight.w700, fontFamily: 'Roboto'
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left:2.0, top: 3.0),
                            child: SlideTransition(
                              position: Tween<Offset>(
                                begin: Offset(0, 1),
                                end: Offset.zero,
                              ).animate(animationController!),
                              child: FadeTransition(
                                opacity: animationController!,
                                child: Container(
                                  child: Text("Points",
                                      style: TextStyle(fontSize: 14, color: Color(0xff055A40), fontWeight: FontWeight.w400, fontFamily: 'Roboto')),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ] else ...[
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
                                  child: Countup(
                                    begin: 0,
                                    end: bannerAmount,
                                    precision: 2,
                                    duration: Duration(milliseconds: 600),
                                    separator: ',',
                                    style: TextStyle(
                                        fontSize: 22, color: Colors.white, fontWeight: FontWeight.w700
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left:2.0, top: 3.0),
                            child: Container(
                              child: Text('MVR',
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
                                  child: Countup(
                                    begin: 0,
                                    end: bannerPoints,
                                    duration: Duration(milliseconds: 600),
                                    separator: ',',
                                    style: TextStyle(
                                        fontSize: 22, color: Colors.white, fontWeight: FontWeight.w700
                                    ),
                                  ),
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
          ],
        ),
      );
    }
    return Positioned(
      top: 10,
      left: MediaQuery.of(context).size.width > 350 ? MediaQuery.of(context).size.width * 0.20 : MediaQuery.of(context).size.width * 0.16,
      right: 0,
      //top: 15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
        crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
        children: [
          if(animationController != null) ...[
            ScaleTransition(
              scale: _tween.animate(CurvedAnimation(parent: animationController!, curve: Curves.easeInOutBack)),
              child: Container(
                //color: Colors.grey,
                width: 80,
                height: 80,
                child: IconButton(
                icon: Icon(bannerIcon, color: Colors.white, size: 50),
                  onPressed: () {
                  },
                ),
              ),
            ),
            ScaleTransition(
              scale: _tween.animate(CurvedAnimation(parent: animationController!, curve: Curves.easeInOutBack)),
              child: Container(
                width: 1,
                height: 54,
                color: Color(0xff57cda5),
              ),
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
                            child: SlideTransition(
                              position: Tween<Offset>(
                                begin: Offset(0, -1),
                                end: Offset.zero,
                              ).animate(animationController!),
                              child: FadeTransition(
                                opacity: animationController!,
                                child: Container(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Countup(
                                      begin: 0,
                                      end: bannerAmount,
                                      precision: 2,
                                      duration: Duration(milliseconds: 600),
                                      separator: ',',
                                      style: TextStyle(
                                          fontSize: 22, color: Colors.white, fontWeight: FontWeight.w700
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left:2.0, top: 3.0),
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: Offset(0, -1),
                              end: Offset.zero,
                            ).animate(animationController!),
                            child: FadeTransition(
                              opacity: animationController!,
                              child: Container(
                                child: Text('MVR',
                                    style: TextStyle(fontSize: 14, color: Color(0xff055A40), fontWeight: FontWeight.w400)),
                              ),
                            ),
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
                            child: SlideTransition(
                              position: Tween<Offset>(
                                begin: Offset(0, 1),
                                end: Offset.zero,
                              ).animate(animationController!),
                              child: FadeTransition(
                                opacity: animationController!,
                                child: Container(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Countup(
                                      begin: 0,
                                      end: bannerPoints,
                                      duration: Duration(milliseconds: 600),
                                      separator: ',',
                                      style: TextStyle(
                                          fontSize: 22, color: Colors.white, fontWeight: FontWeight.w700
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left:2.0, top: 3.0),
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: Offset(0, 1),
                              end: Offset.zero,
                            ).animate(animationController!),
                            child: FadeTransition(
                              opacity: animationController!,
                              child: Container(
                                child: Text("Points",
                                    style: TextStyle(fontSize: 14, color: Color(0xff055A40), fontWeight: FontWeight.w400)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ] else ...[
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
                                child: Countup(
                                  begin: 0,
                                  end: bannerAmount,
                                  precision: 2,
                                  duration: Duration(milliseconds: 600),
                                  separator: ',',
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.white, fontWeight: FontWeight.w700
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left:2.0, top: 3.0),
                          child: Container(
                            child: Text('MVR',
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
                                child: Countup(
                                  begin: 0,
                                  end: bannerPoints,
                                  duration: Duration(milliseconds: 600),
                                  separator: ',',
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.white, fontWeight: FontWeight.w700
                                  ),
                                ),
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
        ],
      ),
    );
  }
}
