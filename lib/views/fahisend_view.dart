import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fpapp/widgets/banner_widget.dart';
import 'package:fpapp/widgets/button_widget.dart';
import 'package:fpapp/widgets/navbar_with_back_button_widget.dart';
import 'package:fpapp/widgets/sidemenu_widget.dart';
import 'package:flutter/services.dart';
import 'package:fpapp/widgets/textfield_number_widget.dart';
import 'package:fpapp/widgets/textfield_text_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FahisendView extends StatefulWidget {
  const FahisendView({Key? key}) : super(key: key);

  @override
  State<FahisendView> createState() => _FahisendViewState();
}

class _FahisendViewState extends State<FahisendView> with SingleTickerProviderStateMixin{
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
  return Scaffold (
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
            SizedBox(
              height: 6,
            ),
            ScaleTransition(
              scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutBack)),
              child: Container(
                width: 126,
                height: 126,
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
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(0, 1),
                  end: Offset.zero,
                ).animate(_animationController),
                child: FadeTransition(
                  opacity: _animationController,
                  child: Text(AppLocalizations.of(context)!.fahiSendViewFirstText,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600,fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 56,
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
                          height: 46,
                          width: MediaQuery.of(context).size.width * 0.43,
                          constraints: BoxConstraints(
                              maxWidth: 154
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                          ),
                          child: TextButton.icon(
                              label: Text(AppLocalizations.of(context)!.qrScan, style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),),
                              icon: Icon(FontAwesomeIcons.qrcode, color: Colors.white, size: 22,),
                              onPressed: () {

                              }
                          )
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
                          height: 46,
                          width: MediaQuery.of(context).size.width * 0.43,
                          constraints: BoxConstraints(
                              maxWidth: 154
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                          ),
                          child: TextButton.icon(
                              label: Text(AppLocalizations.of(context)!.pickContact, style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),),
                              icon: Icon(FontAwesomeIcons.phoneAlt, color: Colors.white, size: 22),
                              onPressed: () {

                              }
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 76,
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
                    child: TextfieldTextWidget(hintText: AppLocalizations.of(context)!.emailOrContactNumber)
                ),
              ),
            ),
            SizedBox(
              height: 14,
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
                  child: TextfieldNumberWidget(
                    hintText: AppLocalizations.of(context)!.amount,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ScaleTransition(
                scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutBack)),
                child: ButtonWidget(
                  buttonText: AppLocalizations.of(context)!.submit,
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