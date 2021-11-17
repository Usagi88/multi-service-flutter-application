import 'package:flutter/material.dart';
import 'package:fpapp/widgets/navbar_widget.dart';
import 'package:fpapp/widgets/sidemenu_widget.dart';
import 'dart:math' as math;
import 'package:flutter/services.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = Navbar().preferredSize.height;
    var safePadding = MediaQuery.of(context).padding.top;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _portraitModeOnly(context, height, safePadding);
  }

}

//portrait
Scaffold _portraitModeOnly(BuildContext context, height, safePadding) {
  return Scaffold(
      appBar: Navbar(),
      drawer: SideMenu(),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height - (height + safePadding),
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: new EdgeInsets.only(bottom: 40.0),
                width: 191,
                height: MediaQuery.of(context).size.height * 0.50,
                //color: Colors.grey,
                alignment: Alignment.center,
                child: Column(
                    children: [
                      Container(
                        height: 34,
                        width: 152,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/fahipay-logo.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                          color: Colors.grey.shade600
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GradientText(
                          text: 'FAHIPAY PVT LTD',
                          style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),
                          gradient: const LinearGradient(
                              colors: [
                                Color(0xff3AC170),
                                Color(0xff25BFA3),
                              ],
                              transform: GradientRotation(math.pi * 0.50)
                          )
                      ),
                      Text('App Version 1.0.1', style: TextStyle(color: Colors.grey.shade600, fontSize: 14, fontWeight: FontWeight.w400)),
                      Spacer(),
                      Text('2021 Copyright',style: TextStyle(color: Colors.grey.shade600, fontSize: 14,fontWeight: FontWeight.w400),),
                      Text('All rights reserved',style: TextStyle(color: Colors.grey.shade600, fontSize: 14,fontWeight: FontWeight.w400),),
                    ]
                ),
              ),

            ),

          )
      )
  );
}

  //landscape
/*
  Scaffold _landscapeModeOnly(BuildContext context, height, safePadding) {
  return Scaffold(
      appBar: Navbar(),
      drawer: SideMenu(),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height - (height + safePadding),
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: new EdgeInsets.only(bottom: 40.0),
                width: 191,
                height: MediaQuery.of(context).size.height * 0.50,
                //color: Colors.grey,
                alignment: Alignment.center,
                child: Column(
                    children: [
                      Container(
                        height: 34,
                        width: 152,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/fahipay-logo.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                          color: Colors.grey.shade600
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GradientText(
                          text: 'FAHIPAY PVT LTD',
                          style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),
                          gradient: const LinearGradient(
                              colors: [
                                Color(0xff3AC170),
                                Color(0xff25BFA3),
                              ],
                              transform: GradientRotation(math.pi * 0.50)
                          )
                      ),
                      Text('App Version 1.0.1', style: TextStyle(color: Colors.grey.shade600, fontSize: 14, fontWeight: FontWeight.w400)),
                      Spacer(),
                      Text('2021 Copyright',style: TextStyle(color: Colors.grey.shade600, fontSize: 14,fontWeight: FontWeight.w400),),
                      Text('All rights reserved',style: TextStyle(color: Colors.grey.shade600, fontSize: 14,fontWeight: FontWeight.w400),),
                    ]
                ),
              ),

            ),

          )
      )
  );
}
*/

//class that makes text have gradient
class GradientText extends StatelessWidget {
  final String text;
  final Gradient gradient;
  final TextStyle? style;

  const GradientText({
    Key? key,
    required this.text,
    required this.gradient,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return gradient
            .createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height));
      },
      child: Text(
        text,
        style: style,
      ),
    );
  }
}