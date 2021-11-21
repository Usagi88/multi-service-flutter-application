import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fpapp/widgets/banner_widget.dart';
import 'package:fpapp/widgets/button_widget.dart';
import 'package:fpapp/widgets/navbar_widget.dart';
import 'package:fpapp/widgets/sidemenu_widget.dart';
import 'dart:math' as math;

import 'package:fpapp/widgets/textfield_text_widget.dart';

class SendSmsView extends StatelessWidget {
  const SendSmsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(),
        drawer: SideMenu(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                    children: <Widget>[
                      Container(
                        height: 164,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/banner.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      BannerWidget(
                        bannerIcon: FontAwesomeIcons.wallet,
                        bannerAmount: 20320.20,
                        bannerPoints: 200,
                      ),
                    ]
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Container(
                        width: 135,
                        constraints: BoxConstraints(
                          minHeight: 68
                        ),
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
                        child: Row(
                          children: [
                            SizedBox(
                              width: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Container(
                                child: GradientIcon(
                                  FontAwesomeIcons.solidEnvelope,
                                  31.0,
                                  LinearGradient(
                                    colors: <Color>[
                                      Color(0xff3AC170),
                                      Color(0xff25BFA3),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Container(
                                width: 1,
                                height: 44,
                                color: Colors.grey.shade300,
                              ),
                            ),

                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width: 80,
                                    child: GradientText(
                                        text: '2',
                                        style: TextStyle(color: Colors.white,fontSize: 26,fontWeight: FontWeight.w700),
                                        gradient: const LinearGradient(
                                            colors: [
                                              Color(0xff3AC170),
                                              Color(0xff25BFA3),
                                            ],
                                            transform: GradientRotation(math.pi * 0.50)
                                        )
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 80,
                                    child: GradientText(
                                        text: 'sms',
                                        style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.w700),
                                        gradient: const LinearGradient(
                                            colors: [
                                              Color(0xff3AC170),
                                              Color(0xff25BFA3),
                                            ],
                                            transform: GradientRotation(math.pi * 0.50)
                                        )
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 226,
                        height: 68,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Select a sender id, write reciever(s) numbers(s) and write the sms you wish to send',
                          style: TextStyle(fontSize: 14, color: Colors.grey.shade600, fontWeight: FontWeight.w400),

                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Align( alignment: Alignment.centerLeft, child: Text('Select Package',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)),
                ),
                SizedBox(
                  height: 7,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextfieldTextWidget(
                    hintText: 'Field Name',
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Container(
                      width: 129,
                      height: 26,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),

                      ),
                      child: Text('Buy SMS',style: TextStyle(fontSize: 14, color: Colors.white,fontWeight: FontWeight.w400),),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Align( alignment: Alignment.centerLeft, child: Text('Sender ID',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)),
                ),
                SizedBox(
                  height: 7,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextfieldTextWidget(
                    hintText: 'Field Name',
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Container(
                      width: 129,
                      height: 26,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),

                      ),
                      child: Text('Get Sender ID',style: TextStyle(fontSize: 14, color: Colors.white,fontWeight: FontWeight.w400),),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Align( alignment: Alignment.centerLeft, child: Text('Recipient (s)',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)),
                ),
                SizedBox(
                  height: 7,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextfieldTextWidget(
                    hintText: 'Field Name',
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Container(
                      width: 129,
                      height: 26,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),

                      ),
                      child: Text('Pick Contact',style: TextStyle(fontSize: 14, color: Colors.white,fontWeight: FontWeight.w400),),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Align( alignment: Alignment.centerLeft, child: Text('Message',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)),
                ),
                SizedBox(
                  height: 7,
                ),
                Container(
                  width: 364,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.all(Radius.circular(10)),

                  ),
                  child: TextField(
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
                      hintText: "Message",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200,),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ButtonWidget(
                    buttonText: 'Login',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    width: double.infinity,
                    height: 77,
                    alignment: Alignment.center,
                    child: Text(
                      'SMS operators charges price for each SMS being sent even if it fails to deliver. Delivery Failures can be caused  due to phone being switches off or not available in the network at the time sms being sent.',
                      style: TextStyle(fontSize: 14,color: Colors.grey.shade600, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            )
          )
        )
    );
  }
}

//class that makes icons have gradient.
class GradientIcon extends StatelessWidget {
  GradientIcon(
      this.icon,
      this.size,
      this.gradient,
      );

  final IconData icon;
  final double size;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: SizedBox(
        width: size * 1.2,
        height: size * 1.2,
        child: Icon(
          icon,
          size: size,
          color: Colors.white,
        ),
      ),
      shaderCallback: (Rect bounds) {
        final Rect rect = Rect.fromLTRB(0, 0, size, size);
        return gradient.createShader(rect);
      },
    );
  }
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