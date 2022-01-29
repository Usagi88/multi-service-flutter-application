import 'dart:async';

import 'package:circle_list/circle_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fpapp/classes/custom_carousel_pro.dart';
import 'package:fpapp/classes/gradient_text.dart';
import 'package:fpapp/provider/locale_provider.dart';
import 'package:fpapp/views/top_up_via_view.dart';
import 'package:fpapp/widgets/navbar_widget.dart';
import 'package:fpapp/widgets/navbar_with_back_button_widget.dart';
import 'package:fpapp/widgets/sidemenu_widget.dart';
import 'dart:math' as math;
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddCashView extends StatefulWidget {
  const AddCashView({Key? key}) : super(key: key);

  @override
  _AddCashViewState createState() => _AddCashViewState();
}

class _AddCashViewState extends State<AddCashView>
    with SingleTickerProviderStateMixin {
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
    double height = Navbar().preferredSize.height;
    var safePadding = MediaQuery.of(context).padding.top;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _portraitModeOnly(
        context, height, safePadding, _animationController, _tween, language);
  }
}

//portrait
Scaffold _portraitModeOnly(BuildContext context, height, safePadding,
    _animationController, _tween, language) {
  return Scaffold(
      appBar: NavbarWithBackButton(),
      drawer: SideMenu(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - (height + safePadding),
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Column(
              children: [
                SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(0, -1),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                    opacity: _animationController,
                    child: Container(
                      height: 130,
                      child: Carousel(
                          dotSize: 4.0,
                          dotSpacing: 15.0,
                          dotColor: Colors.greenAccent,
                          indicatorBgPadding: 5.0,
                          dotBgColor: Colors.transparent,
                          dotVerticalPadding: 5.0,
                          dotPosition: DotPosition.bottomRight,
                          images: [
                            Image.asset(
                              'assets/images/carousel/bannerOne.png',
                              fit: BoxFit.fill,
                            ),
                            Image.asset(
                              'assets/images/carousel/bannerTwo.png',
                              fit: BoxFit.fill,
                            ),
                            Image.asset(
                              'assets/images/carousel/bannerThree.png',
                              fit: BoxFit.fill,
                            ),
                          ]),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CircleList(
                  origin: Offset(0, 0),
                  innerRadius: 10,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ScaleTransition(
                          scale: _tween.animate(CurvedAnimation(
                              parent: _animationController,
                              curve: Curves.easeInOutBack)),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        TopUpViaView(mib: true, bml: false),
                                  )
                              );
                            },
                            child: SizedBox(
                              width: 60,
                              height: 60,
                              child: Image.asset(
                                'assets/images/icon/mib.png',
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              primary: Colors.white, // <-- Button color
                              onPrimary:
                                  Colors.grey.shade400, // <-- Splash color
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ScaleTransition(
                          scale: _tween.animate(CurvedAnimation(
                              parent: _animationController,
                              curve: Curves.easeInOutBack)),
                          child: Text(
                            AppLocalizations.of(context)!.mib,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade600),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ScaleTransition(
                          scale: _tween.animate(CurvedAnimation(
                              parent: _animationController,
                              curve: Curves.easeInOutBack)),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/bonus');
                            },
                            child: SizedBox(
                              width: 60,
                              height: 60,
                              child: Image.asset(
                                'assets/images/icon/bonus.png',
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              primary: Colors.white, // <-- Button color
                              onPrimary:
                                  Colors.grey.shade400, // <-- Splash color
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ScaleTransition(
                          scale: _tween.animate(CurvedAnimation(
                              parent: _animationController,
                              curve: Curves.easeInOutBack)),
                          child: Text(
                            AppLocalizations.of(context)!.bonus,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade600),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ScaleTransition(
                          scale: _tween.animate(CurvedAnimation(
                              parent: _animationController,
                              curve: Curves.easeInOutBack)),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        TopUpViaView(mib: false, bml: true),
                                  )
                              );
                            },
                            child: SizedBox(
                              width: 60,
                              height: 60,
                              child: Image.asset(
                                'assets/images/icon/bml.png',
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              primary: Colors.white, // <-- Button color
                              onPrimary:
                                  Colors.grey.shade400, // <-- Splash color
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ScaleTransition(
                          scale: _tween.animate(CurvedAnimation(
                              parent: _animationController,
                              curve: Curves.easeInOutBack)),
                          child: Text(
                            AppLocalizations.of(context)!.bml,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade600),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ScaleTransition(
                          scale: _tween.animate(CurvedAnimation(
                              parent: _animationController,
                              curve: Curves.easeInOutBack)),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, '/top-up-via-bml-gateway');
                            },
                            child: SizedBox(
                              width: 60,
                              height: 60,
                              child: Image.asset(
                                'assets/images/icon/cashcard.png',
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              primary: Colors.white, // <-- Button color
                              onPrimary:
                                  Colors.grey.shade400, // <-- Splash color
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ScaleTransition(
                          scale: _tween.animate(CurvedAnimation(
                              parent: _animationController,
                              curve: Curves.easeInOutBack)),
                          child: Text(
                            AppLocalizations.of(context)!.cashCard,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade600),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ));
}
