import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fpapp/widgets/banner_widget.dart';
import 'package:fpapp/widgets/button_widget.dart';
import 'package:fpapp/widgets/navbar_widget.dart';
import 'package:fpapp/widgets/navbar_with_back_button_widget.dart';
import 'package:fpapp/widgets/sidemenu_widget.dart';
import 'dart:math' as math;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:fpapp/widgets/textfield_text_widget.dart';

class SendSmsView extends StatefulWidget {
  const SendSmsView({Key? key}) : super(key: key);

  @override
  State<SendSmsView> createState() => _SendSmsViewState();
}

class _SendSmsViewState extends State<SendSmsView> with SingleTickerProviderStateMixin{
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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _portraitModeOnly(context, _animationController, _tween);

  }
}
//portrait
Scaffold _portraitModeOnly(BuildContext context, _animationController, _tween) {
  return Scaffold(
      appBar: NavbarWithBackButton(),
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
                          animationController: _animationController,
                        ),
                      ]
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        SlideTransition(
                          position: Tween<Offset>(
                            begin: Offset(-1, 0),
                            end: Offset.zero,
                          ).animate(_animationController),
                          child: FadeTransition(
                            opacity: _animationController,
                            child: Container(
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
                          ),
                        ),
                        Spacer(),
                        SlideTransition(
                          position: Tween<Offset>(
                            begin: Offset(2, 0),
                            end: Offset.zero,
                          ).animate(_animationController),
                          child: FadeTransition(
                            opacity: _animationController,
                            child: Container(
                              width: 200,
                              height: 68,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  AppLocalizations.of(context)!.sendSmsFirstText,
                                style: TextStyle(fontSize: 14, color: Colors.grey.shade600, fontWeight: FontWeight.w400),

                              ),
                            ),
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
                    child: Align( alignment: Alignment.centerLeft,
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: Offset(-1, 0),
                            end: Offset.zero,
                          ).animate(_animationController),
                          child: FadeTransition(
                            opacity: _animationController,
                              child: Text(AppLocalizations.of(context)!.selectPackage,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)
                          ),
                        )
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(-1, 0),
                        end: Offset.zero,
                      ).animate(_animationController),
                      child: FadeTransition(
                        opacity: _animationController,
                        child: TextfieldTextWidget(
                          hintText: 'Field Name',
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: ScaleTransition(
                        scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutBack)),
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
                          child: Text(AppLocalizations.of(context)!.buySMS,style: TextStyle(fontSize: 14, color: Colors.white,fontWeight: FontWeight.w400),),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Align( alignment: Alignment.centerLeft,
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: Offset(-1, 0),
                            end: Offset.zero,
                          ).animate(_animationController),
                          child: FadeTransition(
                              opacity: _animationController,
                              child: Text(AppLocalizations.of(context)!.senderID,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)
                          ),
                        )
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(-1, 0),
                        end: Offset.zero,
                      ).animate(_animationController),
                      child: FadeTransition(
                        opacity: _animationController,
                        child: TextfieldTextWidget(
                          hintText: 'Field Name',
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: ScaleTransition(
                        scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutBack)),
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
                          child: Text(AppLocalizations.of(context)!.getSenderID,style: TextStyle(fontSize: 14, color: Colors.white,fontWeight: FontWeight.w400),),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Align( alignment: Alignment.centerLeft,
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: Offset(-1, 0),
                            end: Offset.zero,
                          ).animate(_animationController),
                          child: FadeTransition(
                              opacity: _animationController,
                              child: Text(AppLocalizations.of(context)!.recipients,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)
                          ),
                        )
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(-1, 0),
                        end: Offset.zero,
                      ).animate(_animationController),
                      child: FadeTransition(
                        opacity: _animationController,
                        child: TextfieldTextWidget(
                          hintText: 'Field Name',
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: ScaleTransition(
                        scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutBack)),
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
                          child: Text(AppLocalizations.of(context)!.pickContact,style: TextStyle(fontSize: 14, color: Colors.white,fontWeight: FontWeight.w400),),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Align( alignment: Alignment.centerLeft,
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: Offset(-1, 0),
                            end: Offset.zero,
                          ).animate(_animationController),
                          child: FadeTransition(
                              opacity: _animationController,
                              child: Text(AppLocalizations.of(context)!.message,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)
                          ),
                        )
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(-1, 0),
                      end: Offset.zero,
                    ).animate(_animationController),
                    child: FadeTransition(
                      opacity: _animationController,
                      child: Container(
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
                            hintText: AppLocalizations.of(context)!.message,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.shade200,),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(2, 0),
                        end: Offset.zero,
                      ).animate(_animationController),
                      child: FadeTransition(
                        opacity: _animationController,
                        child: ButtonWidget(
                          buttonText: AppLocalizations.of(context)!.login,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(-1, 0),
                        end: Offset.zero,
                      ).animate(_animationController),
                      child: FadeTransition(
                        opacity: _animationController,
                        child: Container(
                          width: double.infinity,
                          height: 77,
                          alignment: Alignment.center,
                          child: Text(
                            AppLocalizations.of(context)!.sendSMSLastText,
                            style: TextStyle(fontSize: 14,color: Colors.grey.shade600, fontWeight: FontWeight.w400),
                          ),
                        ),
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