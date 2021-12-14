import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fpapp/widgets/navbar_widget.dart';
import 'package:fpapp/widgets/navbar_with_back_button_widget.dart';
import 'package:fpapp/widgets/sidemenu_widget.dart';
import 'dart:math' as math;
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SlipView extends StatelessWidget {
  const SlipView({Key? key}) : super(key: key);

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
      appBar: NavbarWithBackButton(),
      drawer: SideMenu(),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width : double.infinity),
                Container(
                  height: MediaQuery.of(context).size.height - (height + safePadding + 68),
                  width: MediaQuery.of(context).size.width,
                  //color: Colors.green,
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      margin: new EdgeInsets.only(bottom: 40.0),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                          children: [
                            Container(
                              height: 134,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/slip-banner.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                children: [
                                  Text('Status'),
                                  Spacer(),
                                  GradientText(
                                      text: 'Success',
                                      style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400),
                                      gradient: const LinearGradient(
                                          colors: [
                                            Color(0xff3AC170),
                                            Color(0xff25BFA3),
                                          ],
                                          transform: GradientRotation(math.pi * 0.50)
                                      )
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Divider(
                                  color: Colors.grey.shade600
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                children: [
                                  Text('Name', style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                                  Spacer(),
                                  Text('MediaNet BillPay', style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, color: Colors.grey.shade600),),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Divider(
                                  color: Colors.grey.shade600
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                children: [
                                  Text('Details', style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                                  Spacer(),
                                  Text('Medianet BillPay  (158414) Local IPTV', textAlign:TextAlign.right, style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, color: Colors.grey.shade600),),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Divider(
                                  color: Colors.grey.shade600
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                children: [
                                  Text('Amount', style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                                  Spacer(),
                                  Text('MVR -159', style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, color: Colors.grey.shade600),),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Divider(
                                  color: Colors.grey.shade600
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                children: [
                                  Text('Reference', style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                                  Spacer(),
                                  Text('F120687246110RK', style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, color: Colors.grey.shade600),),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Divider(
                                  color: Colors.grey.shade600
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                children: [
                                  Text('Time', style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                                  Spacer(),
                                  Text('21st July 2021 - 19:24', style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, color: Colors.grey.shade600),),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ]
                      ),
                    ),
                  ),

                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Container(
                          height: 46,
                          width: MediaQuery.of(context).size.width * 0.43,
                          constraints: BoxConstraints(
                            maxWidth: 177
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                          ),
                          child: TextButton.icon(
                              label: Text('Share Receipt',style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),),
                              icon: Icon(FontAwesomeIcons.shareSquare, color: Colors.white, size: 22,),
                              onPressed: () {

                              }
                          )
                      ),
                      Spacer(),
                      Container(
                          height: 46,
                          width: MediaQuery.of(context).size.width * 0.43,
                          constraints: BoxConstraints(
                              maxWidth: 177
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                          ),
                          child: TextButton.icon(
                              label: Text('Save Receipt',style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),),
                              icon: Icon(FontAwesomeIcons.download, color: Colors.white, size: 22),
                              onPressed: () {

                              }
                          )
                      )
                    ],
                  ),
                ),
              ],
            ),


          )
      )
  );
}

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