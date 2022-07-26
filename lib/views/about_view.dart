import 'package:flutter/material.dart';
import 'package:fpapp/classes/gradient_text.dart';
import 'package:fpapp/provider/locale_provider.dart';
import 'package:fpapp/widgets/navbar_widget.dart';
import 'package:fpapp/widgets/navbar_with_back_button_widget.dart';
import 'package:fpapp/widgets/sidemenu_widget.dart';
import 'dart:math' as math;
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = Navbar().preferredSize.height;
    var safePadding = MediaQuery.of(context).padding.top;
    var now = new DateTime.now();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _portraitModeOnly(context, height, safePadding, now);
  }
}

//portrait
Scaffold _portraitModeOnly(BuildContext context, height, safePadding, now) {
  return Scaffold(
      appBar: NavbarWithBackButton(),
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
                        height: 64,
                        width: 152,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/logo-placeholder.png'),
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
                          text: 'TEST PVT LTD',
                          style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700, fontFamily: 'Roboto'),
                          gradient: const LinearGradient(
                              colors: [
                                Color(0xff3AC170),
                                Color(0xff25BFA3),
                              ],
                              transform: GradientRotation(math.pi * 0.50)
                          )
                      ),
                      Text('App Version 1.0.1', style: TextStyle(color: Colors.grey.shade600, fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'Roboto')),
                      Spacer(),
                      Text(now.year.toString()+' Copyright',style: TextStyle(color: Colors.grey.shade600, fontSize: 14,fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                      Text('All rights reserved',style: TextStyle(color: Colors.grey.shade600, fontSize: 14,fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                    ]
                ),
              ),

            ),

          )
      )
  );
}