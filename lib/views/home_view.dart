import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/zakai.png'),
                      fit: BoxFit.fill,
                    ),
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
                                  shape: CircleBorder(), padding: EdgeInsets.all(16), primary: Colors.white, elevation: 1.0,),
                                child: IconButton(
                                  icon: Icon(FontAwesomeIcons.solidQuestionCircle,size: 32,color: Color(0xffFFA26B),),
                                  onPressed: () {
                                    Navigator.of(context).pushNamed('/live-chat');
                                  },
                                ),
                                onPressed: () {},
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
                                  shape: CircleBorder(), padding: EdgeInsets.all(16), primary: Colors.white, elevation: 1.0,),
                                child: Transform.rotate(
                                  angle: 180 * math.pi / 100,
                                  child: IconButton(
                                    icon: Icon(FontAwesomeIcons.ticketAlt,size: 32,color: Color(0xff7B89F9),),
                                    onPressed: () {
                                      Navigator.of(context).pushNamed('/services');
                                    },
                                  ),
                                ),
                                onPressed: () {},
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
                                  shape: CircleBorder(), padding: EdgeInsets.all(16), primary: Colors.white, elevation: 1.0,),
                                child: IconButton(
                                  icon: Icon(FontAwesomeIcons.wallet,size: 32,color: Color(0xff0CAF39),),
                                  onPressed: () {
                                    //Navigator.of(context).pushNamed('/fahi-send');
                                  },
                                ),
                                onPressed: () {},
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




//landscape
/*
  Scaffold _landscapeModeOnly(BuildContext context) {
    return Scaffold(
      appBar: Navbar(),
      drawer: SideMenu(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(//not putting padding on column because logo image requires different padding
            children: [
              Container(
                height: 130,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/zakai.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
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
                    Positioned(
                      left: 270,
                      right: 0,
                      top: 25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                        crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                        children: [
                          Container(
                            //color: Colors.grey,
                            width: 80,
                            height: 100,
                            child: IconButton(
                              icon: Icon(FontAwesomeIcons.wallet, color: Colors.white, size: 50),
                              onPressed: () {
                              },
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 54,
                            color: Color(0xff57cda5),
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center, //Center Column contents vertically,
                                crossAxisAlignment: CrossAxisAlignment.center, //Center Column contents horizontally,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left:10.0),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text("20,320.00",
                                                  style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.w700)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left:2.0, top: 3.0),
                                        child: Container(
                                          child: Text("MVR",
                                              style: TextStyle(fontSize: 14, color: Color(0xff055A40), fontWeight: FontWeight.w400)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left:10.0),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text("200",
                                                  style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.w700)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left:2.0, top: 3.0),
                                        child: Container(
                                          child: Text("Points",
                                              style: TextStyle(fontSize: 14, color: Color(0xff055A40), fontWeight: FontWeight.w400)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 130,
                      left: 233,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(), padding: EdgeInsets.all(16), primary: Colors.white, elevation: 1.0,),
                        child: IconButton(
                          icon: Icon(FontAwesomeIcons.solidQuestionCircle,size: 32,color: Color(0xffFFA26B),),
                          onPressed: () {

                          },
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Positioned(
                        top: 220,
                        left: 247,
                        child: Text('Support',
                          style: TextStyle(color: Color(0xff797979), fontSize: 14, fontWeight: FontWeight.w400),
                        )
                    ),
                    Positioned(
                      top: 130,
                      left: 333,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(), padding: EdgeInsets.all(16), primary: Colors.white, elevation: 1.0,),
                        child: Transform.rotate(
                          angle: 180 * math.pi / 100,
                          child: IconButton(
                            icon: Icon(FontAwesomeIcons.ticketAlt,size: 32,color: Color(0xff7B89F9),),
                            onPressed: () {

                            },
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Positioned(
                        top: 220,
                        left: 347,
                        child: Text('Services',
                          style: TextStyle(color: Color(0xff797979), fontSize: 14, fontWeight: FontWeight.w400),
                        )
                    ),
                    Positioned(
                      top: 130,
                      left: 433,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(), padding: EdgeInsets.all(16), primary: Colors.white, elevation: 1.0,),
                        child: IconButton(
                          icon: Icon(FontAwesomeIcons.wallet,size: 32,color: Color(0xff0CAF39),),
                          onPressed: () {

                          },
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Positioned(
                        top: 220,
                        left: 442,
                        child: Text('Add Cash',
                          style: TextStyle(color: Color(0xff797979), fontSize: 14, fontWeight: FontWeight.w400),
                        )
                    ),

                  ]
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children:[
                    Text(
                      'History',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width * 0.77,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
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
                        child: Icon(FontAwesomeIcons.chevronUp,size: 14,color: Colors.white,),

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
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.30,
                    child: ListView(
                      children: [
                        FPCard(
                          fpCardColor: 0xffE03838,
                          title: 'Refunded transaction',
                          date: '19 June 2021  -  17:30',
                          amount: 532,
                          currency: 'MVR',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FPCard(
                          fpCardColor: 0xff0CAF39,
                          title: 'Cash Deposit',
                          date: '19 June 2021  -  17:30',
                          amount: 31912.29,
                          currency: 'MVR',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FPCard(
                          fpCardColor: 0xffFFA26B,
                          title: 'Service Recharge',
                          date: '19 June 2021  -  17:30',
                          amount: 120.50,
                          currency: 'MVR',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FPCard(
                          fpCardColor: 0xffFFA26B,
                          title: 'Service Recharge',
                          date: '19 June 2021  -  17:30',
                          amount: 520,
                          currency: 'MVR',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FPCard(
                          fpCardColor: 0xffFFA26B,
                          title: 'Dhiraagu reload',
                          date: '19 June 2021  -  17:30',
                          amount: 31912.29,
                          currency: 'MVR',
                        ),
                      ],
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
 */

