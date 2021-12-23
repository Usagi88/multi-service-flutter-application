import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fpapp/widgets/navbar_widget.dart';
import 'package:fpapp/widgets/navbar_with_back_button_widget.dart';
import 'package:fpapp/widgets/sidemenu_widget.dart';
import 'dart:math' as math;
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SlipView extends StatefulWidget {
  const SlipView({Key? key}) : super(key: key);

  @override
  State<SlipView> createState() => _SlipViewState();
}

class _SlipViewState extends State<SlipView> with SingleTickerProviderStateMixin{
  AnimationController? _animationController;
  Tween<double> _tween = Tween(begin: 0.1, end: 1);

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),

    );
    Timer(Duration(milliseconds: 250), () => _animationController!.forward());
    _animationController!.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = Navbar().preferredSize.height;
    var safePadding = MediaQuery.of(context).padding.top;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _portraitModeOnly(context, height, safePadding,  _animationController, _tween);
  }
}
//portrait
Scaffold _portraitModeOnly(BuildContext context, height, safePadding,  _animationController, _tween) {
  return Scaffold(
      appBar: NavbarWithBackButton(includeShadow: true,),
      drawer: SideMenu(),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ScaleTransition(
                  scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutBack)),
                  child: Container(
                    height: MediaQuery.of(context).size.height - (height + safePadding + 68),
                    width: MediaQuery.of(context).size.width,
                    //color: Colors.green,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        //margin: new EdgeInsets.only(bottom: 40.0),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.68,
                        //alignment: Alignment.center,
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
                        child: SingleChildScrollView(
                          child: Column(
                              children: [
                                Container(
                                  height: 134,
                                  width: double.infinity,
                                  padding: const EdgeInsets.only(top: 25.0),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/slip-banner-two.png'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 36,
                                        width: 167,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/fahipay-logo-two.png'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Container(
                                        width: 116,
                                        height: 1,
                                        color: Colors.white.withOpacity(0.6),
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Text(AppLocalizations.of(context)!.transactionDetails, style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),)
                                    ],
                                  )
                                ),
                                SizedBox(
                                  height: 26,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Row(
                                    children: [
                                      Text(AppLocalizations.of(context)!.status,
                                        style: TextStyle(fontSize: MediaQuery.of(context).size.width > 320 ? 14: 12),
                                      ),
                                      Spacer(),
                                      GradientText(
                                          text: 'Success',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: MediaQuery.of(context).size.width > 320 ? 14 : 12,
                                              fontWeight: FontWeight.w400),
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
                                      Text(AppLocalizations.of(context)!.name, style: TextStyle(
                                          fontSize: MediaQuery.of(context).size.width > 320 ? 14 : 12,
                                          fontWeight: FontWeight.w400),),
                                      Spacer(),
                                      Text('MediaNet BillPay', style: TextStyle(
                                          fontSize: MediaQuery.of(context).size.width > 320 ? 14 : 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey.shade600),),
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
                                      Text(AppLocalizations.of(context)!.details, style: TextStyle(
                                          fontSize: MediaQuery.of(context).size.width > 320 ? 14 : 12,
                                          fontWeight: FontWeight.w400),),
                                      Spacer(),
                                      Text('Medianet BillPay  (158414) Local IPTV', textAlign:TextAlign.right, style: TextStyle(
                                          fontSize: MediaQuery.of(context).size.width > 320 ? 14 : 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey.shade600),),
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
                                      Text(AppLocalizations.of(context)!.amount, style: TextStyle(
                                          fontSize: MediaQuery.of(context).size.width > 320 ? 14 : 12,
                                          fontWeight: FontWeight.w400),),
                                      Spacer(),
                                      Text('MVR -159', style: TextStyle(
                                          fontSize: MediaQuery.of(context).size.width > 320 ? 14 : 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey.shade600),),
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
                                      Text(AppLocalizations.of(context)!.reference, style: TextStyle(
                                          fontSize: MediaQuery.of(context).size.width > 320 ? 14 : 12,
                                          fontWeight: FontWeight.w400),),
                                      Spacer(),
                                      Text('F120687246110RK', style: TextStyle(
                                          fontSize: MediaQuery.of(context).size.width > 320 ? 14 : 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey.shade600),),
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
                                      Text(AppLocalizations.of(context)!.time, style: TextStyle(
                                          fontSize: MediaQuery.of(context).size.width > 320 ? 14 : 12,
                                          fontWeight: FontWeight.w400),),
                                      Spacer(),
                                      Text('21st July 2021 - 19:24', style: TextStyle(
                                          fontSize: MediaQuery.of(context).size.width > 320 ? 14 : 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey.shade600),),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.width > 320 ? 10 : 30,
                                ),
                              ]
                          ),
                        ),
                      ),
                    ),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: Offset(-1, 0),
                            end: Offset.zero,
                          ).animate(_animationController),
                          child: FadeTransition(
                            opacity: _animationController,
                            child: Container(
                                height: 46,
                                //width: MediaQuery.of(context).size.width * 0.43,
                                constraints: BoxConstraints(
                                  maxWidth: 177
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                                ),
                                child: TextButton.icon(
                                    label: Text(AppLocalizations.of(context)!.shareReceipt,style: TextStyle(
                                        color: Colors.white,
                                        fontSize: MediaQuery.of(context).size.width > 320 ? 14 : 11,
                                        fontWeight: FontWeight.w400),),
                                    icon: Icon(
                                      FontAwesomeIcons.shareSquare,
                                      color: Colors.white,
                                      size: MediaQuery.of(context).size.width > 320 ? 22 : 16,
                                    ),
                                    onPressed: () {

                                    }
                                )
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: Offset(2, 0),
                            end: Offset.zero,
                          ).animate(_animationController),
                          child: FadeTransition(
                            opacity: _animationController,
                            child: Container(
                                height: 46,
                                //width: MediaQuery.of(context).size.width * 0.43,
                                constraints: BoxConstraints(
                                    maxWidth: 177
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                                ),
                                child: TextButton.icon(
                                    label: Text(AppLocalizations.of(context)!.saveReceipt,style: TextStyle(
                                        color: Colors.white,
                                        fontSize: MediaQuery.of(context).size.width > 320 ? 14 : 11,
                                        fontWeight: FontWeight.w400),),
                                    icon: Icon(
                                        FontAwesomeIcons.download,
                                        color: Colors.white,
                                        size: MediaQuery.of(context).size.width > 320 ? 22 : 16),
                                    onPressed: () {

                                    }
                                )
                            ),
                          ),
                        ),
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