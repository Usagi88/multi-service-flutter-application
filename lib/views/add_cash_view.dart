import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
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
  int _current = 0;

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

  final List<String> imgList = [
    'assets/images/carousel/bannerOne.png',
    'assets/images/carousel/bannerTwo.png',
    'assets/images/carousel/bannerThree.png',
  ];

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
                        child: Stack(children: <Widget>[
                          CarouselSlider(
                            items: imgList
                                .map((item) => Container(
                              child: Image.asset(
                                item,
                                fit: BoxFit.fill,
                                width: MediaQuery.of(context).size.width,
                              ),
                            )
                            )
                                .toList(),
                            options: CarouselOptions(
                                autoPlay: true,
                                height: 130,
                                viewportFraction: 1,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _current = index;
                                  });
                                }),
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.width > 320 ? MediaQuery.of(context).size.width * 0.25 : MediaQuery.of(context).size.width * 0.30,
                            left: MediaQuery.of(context).size.width > 320 ? MediaQuery.of(context).size.width * 0.80 : MediaQuery.of(context).size.width * 0.80,
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: imgList.map((url) {
                                  int index = imgList.indexOf(url);
                                  return Container(
                                    width: 8,
                                    height: 8,
                                    margin: EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: _current == index
                                          ? Color(0xff34c07f)
                                          : Color(0xffffffff),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          )
                        ]),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width > 320 ? 20 : 0,
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
                                width: 50,
                                height: 50,
                                child: Image.asset(
                                  'assets/images/icon/mib.png',
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(MediaQuery.of(context).size.width > 320 ? 22 : 10,),
                                elevation: 1.0,
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
                                width: 50,
                                height: 50,
                                child: Image.asset(
                                  'assets/images/icon/bonus.png',
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(MediaQuery.of(context).size.width > 320 ? 22 : 10,),
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
                                Navigator.pushNamed(
                                    context, '/top-up-via-bml-gateway');
                              },
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.asset(
                                  'assets/images/icon/cashcard.png',
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(MediaQuery.of(context).size.width > 320 ? 22 : 10,),
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
                                width: 50,
                                height: 50,
                                child: Image.asset(
                                  'assets/images/icon/bml.png',
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(MediaQuery.of(context).size.width > 320 ? 22 : 10,),
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

}


