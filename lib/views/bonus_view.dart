import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fpapp/classes/gradient_icon.dart';
import 'package:fpapp/provider/locale_provider.dart';
import 'package:fpapp/widgets/banner_widget.dart';
import 'package:fpapp/widgets/button_widget.dart';
import 'package:fpapp/widgets/header_widget.dart';
import 'package:fpapp/widgets/navbar_with_back_button_widget.dart';
import 'package:fpapp/widgets/sidemenu_widget.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fpapp/widgets/textfield_number_widget.dart';
import 'package:provider/provider.dart';

class BonusView extends StatefulWidget {
  const BonusView({Key? key}) : super(key: key);

  @override
  State<BonusView> createState() => _BonusViewState();
}

class _BonusViewState extends State<BonusView> with SingleTickerProviderStateMixin{
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
    var language = Provider.of<LocaleProvider>(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _portraitModeOnly(context, _animationController, _tween, language);
  }
}

//portrait
Scaffold _portraitModeOnly(BuildContext context, _animationController, _tween, language) {
  if (language.locale.toString() == 'dv' || language.locale.toString() == 'ar'){
    return Scaffold(
      appBar: NavbarWithBackButton(),
      drawer: SideMenu(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(//not putting padding on column because logo image requires different padding
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
                child: Container(
                  alignment: Alignment.centerRight,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(1, 0),
                      end: Offset.zero,
                    ).animate(_animationController),
                    child: FadeTransition(
                      opacity: _animationController,
                      child: Text(
                        AppLocalizations.of(context)!.bonusViewFirstText,
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff909090)
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(1, 0),
                        end: Offset.zero,
                      ).animate(_animationController),
                      child: FadeTransition(
                          opacity: _animationController,
                          child: Text(AppLocalizations.of(context)!.numberOfPoints, style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600)
                          )
                      ),
                    ),
                  )
              ),
              SizedBox(
                height: 6,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(1, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                    opacity: _animationController,
                    child: TextfieldNumberWidget(
                      hintText: AppLocalizations.of(context)!.numberOfPoints,
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
                    begin: Offset(1, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                      opacity: _animationController,
                      child: ButtonWidget(buttonText: AppLocalizations.of(context)!.redeem)
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  return Scaffold(
    appBar: NavbarWithBackButton(),
    drawer: SideMenu(),
    body: SafeArea(
      child: SingleChildScrollView(
        child: Column(//not putting padding on column because logo image requires different padding
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
              child: Container(
                alignment: Alignment.centerLeft,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                    opacity: _animationController,
                    child: Text(
                      AppLocalizations.of(context)!.bonusViewFirstText,
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff909090)
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(-1, 0),
                      end: Offset.zero,
                    ).animate(_animationController),
                    child: FadeTransition(
                        opacity: _animationController,
                        child: Text(AppLocalizations.of(context)!.numberOfPoints, style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600)
                        )
                    ),
                  ),
                )
            ),
            SizedBox(
              height: 6,
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
                  child: TextfieldNumberWidget(
                    hintText: AppLocalizations.of(context)!.numberOfPoints,
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
                    child: ButtonWidget(buttonText: AppLocalizations.of(context)!.redeem)
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ),
  );
}
