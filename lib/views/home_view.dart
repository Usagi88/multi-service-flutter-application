import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fpapp/classes/custom_carousel_pro.dart';
import 'package:fpapp/widgets/banner_widget.dart';
import 'package:fpapp/widgets/fp_card_widget.dart';
import 'package:fpapp/widgets/navbar_widget.dart';
import 'package:fpapp/widgets/sidemenu_widget.dart';
import 'dart:math' as math;
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin {
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
    appBar: Navbar(),
    drawer: SideMenu(),
    body: SafeArea(
      child: SingleChildScrollView(
        child: Column(//not putting padding on column because logo image requires different padding
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
                      ]
                  ),
                ),
              ),
            ),




            SlideTransition(
              position: Tween<Offset>(
                begin: Offset(0, 1),
                end: Offset.zero,
              ).animate(_animationController),
              child: FadeTransition(
                opacity: _animationController,
                child: Container(
                  alignment: Alignment.center,
                  height: 33,
                  child: Text('K.Male - Fajr 04:47',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff666666),
                    ),
                  ),
                ),
              ),
            ),
            Stack(
                children: <Widget>[
                  Container(
                    height: 236,
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
                    bannerAmount: 20230.20,
                    bannerPoints: 200,
                    animationController: _animationController,
                  ),

                  Positioned(
                    top: 130,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                      children: [
                        Column(
                          children: [
                            ScaleTransition(
                              scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutBack)),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(24),
                                  primary: Colors.white,
                                  onPrimary: Colors.grey.shade400,
                                  elevation: 1.0,
                                ),
                                child: Icon(FontAwesomeIcons.solidQuestionCircle,size: 32,color: Color(0xffFFA26B),),
                                onPressed: () {
                                  Navigator.of(context).pushNamed('/live-chat');
                                },
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            SlideTransition(
                              position: Tween<Offset>(
                                begin: Offset(-1, 0),
                                end: Offset.zero,
                              ).animate(_animationController),
                              child: FadeTransition(
                                opacity: _animationController,
                                child: Text(AppLocalizations.of(context)!.support,
                                  style: TextStyle(color: Color(0xff797979), fontSize: 14, fontWeight: FontWeight.w400),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            ScaleTransition(
                              scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutBack)),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(22),
                                  primary: Colors.white,
                                  onPrimary: Colors.grey.shade400,
                                  elevation: 1.0,
                                ),
                                child: SvgPicture.asset("assets/images/icon/serviceIconSVG.svg"),
                                onPressed: () {
                                  Navigator.of(context).pushNamed('/services');
                                },
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            SlideTransition(
                              position: Tween<Offset>(
                                begin: Offset(0, 1),
                                end: Offset.zero,
                              ).animate(_animationController),
                              child: FadeTransition(
                                opacity: _animationController,
                                child: Text(AppLocalizations.of(context)!.services,
                                  style: TextStyle(color: Color(0xff797979), fontSize: 14, fontWeight: FontWeight.w400),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            ScaleTransition(
                              scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutBack)),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(26),
                                  primary: Colors.white,
                                  onPrimary: Colors.grey.shade400,
                                  elevation: 1.0,
                                ),
                                child: SvgPicture.asset("assets/images/icon/walletIconSVG.svg"),
                                onPressed: () {
                                  Navigator.of(context).pushNamed('/add-cash');
                                },
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            SlideTransition(
                              position: Tween<Offset>(
                                begin: Offset(2, 0),
                                end: Offset.zero,
                              ).animate(_animationController),
                              child: FadeTransition(
                                opacity: _animationController,
                                child: Text(AppLocalizations.of(context)!.addCash,
                                  style: TextStyle(color: Color(0xff797979), fontSize: 14, fontWeight: FontWeight.w400),
                                ),
                              ),
                            )
                          ],
                        )

                      ],
                    ),

                  ),
                ]
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children:[
                  SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(-1, 0),
                      end: Offset.zero,
                    ).animate(_animationController),
                    child: FadeTransition(
                      opacity: _animationController,
                      child: Text(
                        AppLocalizations.of(context)!.history,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    flex: 1,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(0, 10),
                        end: Offset.zero,
                      ).animate(_animationController),
                      child: FadeTransition(
                        opacity: _animationController,
                        child: const SizedBox(
                          height: 1.0,
                          child: const DecoratedBox(
                            decoration: const BoxDecoration(
                              color: Color(0xffcccccc)
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(2, 0),
                        end: Offset.zero,
                      ).animate(_animationController),
                      child: FadeTransition(
                        opacity: _animationController,
                        child: Container(
                          alignment: Alignment.center,
                          width: 45,
                          height: 23,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Color(0xff3AC170),
                                  Color(0xff25BFA3),
                                ],
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: Icon(FontAwesomeIcons.chevronUp,size: 14,color: Colors.white,),
                            onPressed: () {
                              Navigator.of(context).pushNamed('/transaction-history');
                            },
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(0, 1),
                  end: Offset.zero,
                ).animate(_animationController),
                child: FadeTransition(
                  opacity: _animationController,
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.30,
                      child: ListView(
                        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                        children: [
                          FPCard(
                            fpCardColor: 0xffE03838,
                            title: AppLocalizations.of(context)!.refundedTransaction,
                            date: '19 June 2021  -  17:30',
                            amount: 532,
                            currency: 'MVR',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FPCard(
                            fpCardColor: 0xff0CAF39,
                            title: AppLocalizations.of(context)!.cashDeposit,
                            date: '19 June 2021  -  17:30',
                            amount: 31912.29,
                            currency: 'MVR',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FPCard(
                            fpCardColor: 0xffFFA26B,
                            title: AppLocalizations.of(context)!.serviceRecharge,
                            date: '19 June 2021  -  17:30',
                            amount: 120.50,
                            currency: 'MVR',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FPCard(
                            fpCardColor: 0xffFFA26B,
                            title: AppLocalizations.of(context)!.serviceRecharge,
                            date: '19 June 2021  -  17:30',
                            amount: 520,
                            currency: 'MVR',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FPCard(
                            fpCardColor: 0xffFFA26B,
                            title: AppLocalizations.of(context)!.dhiraaguReload,
                            date: '19 June 2021  -  17:30',
                            amount: 31912.29,
                            currency: 'MVR',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      )
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    ),
  );
}

