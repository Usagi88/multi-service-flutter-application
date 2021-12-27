import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fpapp/widgets/banner_widget.dart';
import 'package:fpapp/widgets/button_widget.dart';
import 'package:fpapp/widgets/navbar_with_back_button_widget.dart';
import 'package:fpapp/widgets/sidemenu_widget.dart';
import 'package:flutter/services.dart';
import 'package:fpapp/widgets/textfield_text_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:fpapp/widgets/warning_text_widget.dart';

class TopUpViaBMLGatewayView extends StatefulWidget {
  const TopUpViaBMLGatewayView({Key? key}) : super(key: key);

  @override
  State<TopUpViaBMLGatewayView> createState() => _TopUpViaBMLGatewayViewState();
}

class _TopUpViaBMLGatewayViewState extends State<TopUpViaBMLGatewayView> with SingleTickerProviderStateMixin{
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
    return _portraitModeOnly(context,  _animationController, _tween);
  }
}

//portrait mode
Scaffold _portraitModeOnly(BuildContext context,  _animationController, _tween) {
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
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: Offset(-1, 0),
                          end: Offset.zero,
                        ).animate(_animationController),
                        child: FadeTransition(
                          opacity: _animationController,
                          child: Text(
                            AppLocalizations.of(context)!.topUpViaBmlFirsText,
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff909090)
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: Offset(-1, 0),
                          end: Offset.zero,
                        ).animate(_animationController),
                        child: FadeTransition(
                          opacity: _animationController,
                          child: Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width * 0.25,
                            color: Color(0xff909090),
                          ),
                        ),
                      ),
                    ),
                  ]
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
                        child: Text(AppLocalizations.of(context)!.amount, style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400)
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
                  begin: Offset(2, 0),
                  end: Offset.zero,
                ).animate(_animationController),
                child: FadeTransition(
                  opacity: _animationController,
                  child: TextfieldTextWidget(
                      hintText: AppLocalizations.of(context)!.amount
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
                        child: Text(AppLocalizations.of(context)!.processingFee, style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400)
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
                  begin: Offset(2, 0),
                  end: Offset.zero,
                ).animate(_animationController),
                child: FadeTransition(
                  opacity: _animationController,
                  child: TextfieldTextWidget(
                      hintText: AppLocalizations.of(context)!.processingFee
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
                        child: Text(AppLocalizations.of(context)!.total, style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400)
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
                  begin: Offset(2, 0),
                  end: Offset.zero,
                ).animate(_animationController),
                child: FadeTransition(
                  opacity: _animationController,
                  child: TextfieldTextWidget(
                      hintText: AppLocalizations.of(context)!.total
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
                    child: ButtonWidget(buttonText: AppLocalizations.of(context)!.topUpViaBmlButtonText)
                ),
              ),
            ),
            SizedBox(
              height: 10,
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
                  child: Container(
                    height: 53,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/bml-gateway.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24,
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
                  child: Text(AppLocalizations.of(context)!.topUpViaBmlSecondText,
                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, color: Colors.grey.shade600)
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
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
                  child: WarningText(
                    warningText: AppLocalizations.of(context)!.topUpViaBmlThirdText,
                    warningTextBottomColor: 0xff909090
                  ),
                ),
              )
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      )
    )
  );
}