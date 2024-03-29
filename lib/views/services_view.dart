import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpapp/classes/custom_carousel_pro.dart';
import 'package:fpapp/views/bill_pay_view.dart';
import 'package:fpapp/views/cash_in_view.dart';
import 'package:fpapp/views/raastas_reload_view.dart';
import 'package:fpapp/views/wholesale_view.dart';
import 'package:fpapp/widgets/navbar_widget.dart';
import 'package:fpapp/widgets/navbar_with_back_button_widget.dart';
import 'package:fpapp/widgets/service_card_widget.dart';
import 'package:fpapp/widgets/sidemenu_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package_recharge_view.dart';

class ServicesView extends StatefulWidget {
  const ServicesView({Key? key}) : super(key: key);

  @override
  State<ServicesView> createState() => _ServicesViewState();
}

class _ServicesViewState extends State<ServicesView> with SingleTickerProviderStateMixin{
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
    double navBarHeight = Navbar().preferredSize.height;
    var safePadding = MediaQuery.of(context).padding.top;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _portraitModeOnly(context, navBarHeight, safePadding, _animationController, _tween);

  }

  final List<String> imgList = [
    'assets/images/carousel/bannerOne.png',
    'assets/images/carousel/bannerTwo.png',
    'assets/images/carousel/bannerThree.png',
  ];

  //portrait
  Scaffold _portraitModeOnly(BuildContext context, navBarHeight, safePadding, _animationController, _tween) {
    return Scaffold(
        appBar: NavbarWithBackButton(),
        drawer: SideMenu(),
        body: SafeArea(
            child: SingleChildScrollView(
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
                      height: 20,
                    ),
                    Container(
                      child: Row(
                        children:[
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: SlideTransition(
                              position: Tween<Offset>(
                                begin: Offset(-1, 0),
                                end: Offset.zero,
                              ).animate(_animationController),
                              child: FadeTransition(
                                opacity: _animationController,
                                child: Text(
                                  AppLocalizations.of(context)!.services,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: SlideTransition(
                              position: Tween<Offset>(
                                begin: Offset(2, 0),
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
                          SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height - 30 - 46 - 130 - navBarHeight - safePadding,
                        child: ListView(
                          physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                //DHIRAAGU RELOAD
                                Expanded(
                                  child: ScaleTransition(
                                    scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutBack)),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RaastasReloadView(dhiraagu: true, ooredoo: false)
                                            )
                                        );
                                      },
                                      child: Container(
                                        //width: 166,
                                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                        height: 84,
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
                                            Container(
                                              height: MediaQuery.of(context).size.width > 350 ? 50 : 42,
                                              width: MediaQuery.of(context).size.width > 350 ? 50 : 42,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/dhiraagu-logo.png'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 15.0),
                                              child: VerticalDivider(
                                                thickness: 1,
                                                color: Colors.grey.shade400,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                AppLocalizations.of(context)!.dhiraaguReload,
                                                style: TextStyle(
                                                    fontSize: MediaQuery.of(context).size.width > 350 ? 12 : 11,
                                                    color: Colors.grey.shade600,
                                                    fontWeight: FontWeight.w400
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                //OOREDOO RAASTAS
                                Expanded(
                                  child: ScaleTransition(
                                    scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutBack)),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RaastasReloadView(dhiraagu: false, ooredoo: true)
                                            )
                                        );
                                      },
                                      child: Container(
                                        //width: 166,
                                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                        height: 84,
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
                                            Container(
                                              height: MediaQuery.of(context).size.width > 350 ? 50 : 42,
                                              width: MediaQuery.of(context).size.width > 350 ? 50 : 42,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/ooredoo-logo.png'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 15.0),
                                              child: VerticalDivider(
                                                thickness: 1,
                                                color: Colors.grey.shade400,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                AppLocalizations.of(context)!.ooredooRaastas,
                                                style: TextStyle(
                                                    fontSize: MediaQuery.of(context).size.width > 350 ? 12 : 11,
                                                    color: Colors.grey.shade600,
                                                    fontWeight: FontWeight.w400
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                //DHIRAAGU RECHARGE PACKAGE
                                Expanded(
                                  child: ScaleTransition(
                                    scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutBack)),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PackageRechargeView(dhiraagu: true, ooredoo: false)
                                            )
                                        );
                                      },
                                      child: Container(
                                        //width: 166,
                                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                        height: 84,
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
                                            Container(
                                              height: MediaQuery.of(context).size.width > 350 ? 50 : 42,
                                              width: MediaQuery.of(context).size.width > 350 ? 50 : 42,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/dhiraagu-logo.png'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 15.0),
                                              child: VerticalDivider(
                                                thickness: 1,
                                                color: Colors.grey.shade400,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                AppLocalizations.of(context)!.dhiraaguPackageRecharge,
                                                style: TextStyle(
                                                    fontSize: MediaQuery.of(context).size.width > 350 ? 12 : 11,
                                                    color: Colors.grey.shade600,
                                                    fontWeight: FontWeight.w400
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                //OOREDOO RECHARGE PACKAGE
                                Expanded(
                                  child: ScaleTransition(
                                    scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutBack)),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PackageRechargeView(dhiraagu: false, ooredoo: true)
                                            )
                                        );
                                      },
                                      child: Container(
                                        //width: 166,
                                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                        height: 84,
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
                                            Container(
                                              height: MediaQuery.of(context).size.width > 350 ? 50 : 42,
                                              width: MediaQuery.of(context).size.width > 350 ? 50 : 42,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/ooredoo-logo.png'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 15.0),
                                              child: VerticalDivider(
                                                thickness: 1,
                                                color: Colors.grey.shade400,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                AppLocalizations.of(context)!.ooredooPackageRecharge,
                                                style: TextStyle(
                                                    fontSize: MediaQuery.of(context).size.width > 350 ? 12 : 11,
                                                    color: Colors.grey.shade600,
                                                    fontWeight: FontWeight.w400
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                //DHIRAAGU BILL PAY
                                Expanded(
                                  child: ScaleTransition(
                                    scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutBack)),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    BillPayView(dhiraagu: true, ooredoo: false)
                                            )
                                        );
                                      },
                                      child: Container(
                                        //width: 166,
                                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                        height: 84,
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
                                            Container(
                                              height: MediaQuery.of(context).size.width > 350 ? 50 : 42,
                                              width: MediaQuery.of(context).size.width > 350 ? 50 : 42,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/dhiraagu-logo.png'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 15.0),
                                              child: VerticalDivider(
                                                thickness: 1,
                                                color: Colors.grey.shade400,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                AppLocalizations.of(context)!.dhiraaguBillPay,
                                                style: TextStyle(
                                                    fontSize: MediaQuery.of(context).size.width > 350 ? 12 : 11,
                                                    color: Colors.grey.shade600,
                                                    fontWeight: FontWeight.w400
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                //OOREDOO BILL PAY
                                Expanded(
                                  child: ScaleTransition(
                                    scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutBack)),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    BillPayView(dhiraagu: false, ooredoo: true)
                                            )
                                        );
                                      },
                                      child: Container(
                                        //width: 166,
                                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                        height: 84,
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
                                            Container(
                                              height: MediaQuery.of(context).size.width > 350 ? 50 : 42,
                                              width: MediaQuery.of(context).size.width > 350 ? 50 : 42,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/ooredoo-logo.png'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 15.0),
                                              child: VerticalDivider(
                                                thickness: 1,
                                                color: Colors.grey.shade400,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                AppLocalizations.of(context)!.ooredooBillPay,
                                                style: TextStyle(
                                                    fontSize: MediaQuery.of(context).size.width > 350 ? 12 : 11,
                                                    color: Colors.grey.shade600,
                                                    fontWeight: FontWeight.w400
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                //ROL BILL PAY
                                Expanded(
                                  child: ScaleTransition(
                                    scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutBack)),
                                    child: GestureDetector(
                                      onTap: () => Navigator.pushNamed(context, '/rol-bill-pay'),
                                      child: Container(
                                        //width: 166,
                                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                        height: 84,
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
                                            Container(
                                              height: MediaQuery.of(context).size.width > 350 ? 50 : 42,
                                              width: MediaQuery.of(context).size.width > 350 ? 50 : 42,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/icon/ROL.png'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 15.0),
                                              child: VerticalDivider(
                                                thickness: 1,
                                                color: Colors.grey.shade400,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                AppLocalizations.of(context)!.rol,
                                                style: TextStyle(
                                                    fontSize: MediaQuery.of(context).size.width > 350 ? 12 : 11,
                                                    color: Colors.grey.shade600,
                                                    fontWeight: FontWeight.w400
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                //GIFT CARDS
                                Expanded(
                                  child: ScaleTransition(
                                    scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutBack)),
                                    child: GestureDetector(
                                      onTap: () => Navigator.pushNamed(context, '/gift-card'),
                                      child: Container(
                                        //width: 166,
                                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                        height: 84,
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
                                            Container(
                                              height: MediaQuery.of(context).size.width > 350 ? 50 : 42,
                                              width: MediaQuery.of(context).size.width > 350 ? 50 : 42,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/icon/giftcard.png'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 15.0),
                                              child: VerticalDivider(
                                                thickness: 1,
                                                color: Colors.grey.shade400,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                AppLocalizations.of(context)!.giftCards,
                                                style: TextStyle(
                                                    fontSize: MediaQuery.of(context).size.width > 350 ? 12 : 11,
                                                    color: Colors.grey.shade600,
                                                    fontWeight: FontWeight.w400
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                //PUBG UC
                                Expanded(
                                  child: ScaleTransition(
                                    scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutBack)),
                                    child: GestureDetector(
                                      onTap: () => Navigator.pushNamed(context, '/pubg'),
                                      child: Container(
                                        //width: 166,
                                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                        height: 84,
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
                                            Container(
                                              height: MediaQuery.of(context).size.width > 350 ? 50 : 42,
                                              width: MediaQuery.of(context).size.width > 350 ? 50 : 42,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/icon/pubg.png'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 15.0),
                                              child: VerticalDivider(
                                                thickness: 1,
                                                color: Colors.grey.shade400,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                AppLocalizations.of(context)!.pubgUC,
                                                style: TextStyle(
                                                    fontSize: MediaQuery.of(context).size.width > 350 ? 12 : 11,
                                                    color: Colors.grey.shade600,
                                                    fontWeight: FontWeight.w400
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                //MWSC BILL PAY
                                Expanded(
                                  child: ScaleTransition(
                                    scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutBack)),
                                    child: GestureDetector(
                                      onTap: () => Navigator.pushNamed(context, '/mwsc-bill-pay'),
                                      child: Container(
                                        //width: 166,
                                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                        height: 84,
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
                                            Container(
                                              height: MediaQuery.of(context).size.width > 350 ? 50 : 42,
                                              width: MediaQuery.of(context).size.width > 350 ? 50 : 42,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/icon/mwsc.png'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 15.0),
                                              child: VerticalDivider(
                                                thickness: 1,
                                                color: Colors.grey.shade400,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                AppLocalizations.of(context)!.mwscBillPay,
                                                style: TextStyle(
                                                    fontSize: MediaQuery.of(context).size.width > 350 ? 12 : 11,
                                                    color: Colors.grey.shade600,
                                                    fontWeight: FontWeight.w400
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                //MEDIANET BILL PAY
                                Expanded(
                                  child: ScaleTransition(
                                    scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutBack)),
                                    child: GestureDetector(
                                      onTap: () => Navigator.pushNamed(context, '/medianet-bill-pay'),
                                      child: Container(
                                        //width: 166,
                                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                        height: 84,
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
                                            Container(
                                              height: MediaQuery.of(context).size.width > 350 ? 50 : 42,
                                              width: MediaQuery.of(context).size.width > 350 ? 50 : 42,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/icon/medianet.png'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 15.0),
                                              child: VerticalDivider(
                                                thickness: 1,
                                                color: Colors.grey.shade400,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                AppLocalizations.of(context)!.medianetBillPay,
                                                style: TextStyle(
                                                    fontSize: MediaQuery.of(context).size.width > 350 ? 12 : 11,
                                                    color: Colors.grey.shade600,
                                                    fontWeight: FontWeight.w400
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                //MALDIVE GAS
                                Expanded(
                                  child: ScaleTransition(
                                    scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutBack)),
                                    child: GestureDetector(
                                      onTap: () => Navigator.pushNamed(context, '/maldive-gas'),
                                      child: Container(
                                        //width: 166,
                                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                        height: 84,
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
                                            Container(
                                              height: MediaQuery.of(context).size.width > 350 ? 50 : 42,
                                              width: MediaQuery.of(context).size.width > 350 ? 50 : 42,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/icon/gas.png'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 15.0),
                                              child: VerticalDivider(
                                                thickness: 1,
                                                color: Colors.grey.shade400,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                AppLocalizations.of(context)!.maldiveGas,
                                                style: TextStyle(
                                                    fontSize: MediaQuery.of(context).size.width > 350 ? 12 : 11,
                                                    color: Colors.grey.shade600,
                                                    fontWeight: FontWeight.w400
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                //DHIRAAGU RELOAD
                                Expanded(
                                  child: ScaleTransition(
                                    scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutBack)),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    WholesaleView(dhiraagu: true, ooredoo: false)
                                            )
                                        );
                                      },
                                      child: Container(
                                        //width: 166,
                                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                        height: 84,
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
                                            Container(
                                              height: MediaQuery.of(context).size.width > 350 ? 50 : 42,
                                              width: MediaQuery.of(context).size.width > 350 ? 50 : 42,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/dhiraagu-logo.png'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 15.0),
                                              child: VerticalDivider(
                                                thickness: 1,
                                                color: Colors.grey.shade400,
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width > 320 ? 5 : 2,
                                            ),
                                            Expanded(
                                              child: Text(
                                                AppLocalizations.of(context)!.wholeSaleReload,
                                                style: TextStyle(
                                                    fontSize: MediaQuery.of(context).size.width > 350 ? 12 : 11,
                                                    color: Colors.grey.shade600,
                                                    fontWeight: FontWeight.w400
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                //OOREDOO RAASTAS
                                Expanded(
                                  child: ScaleTransition(
                                    scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutBack)),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    WholesaleView(dhiraagu: false, ooredoo: true)
                                            )
                                        );
                                      },
                                      child: Container(
                                        //width: 166,
                                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                        height: 84,
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
                                            Container(
                                              height: MediaQuery.of(context).size.width > 350 ? 50 : 42,
                                              width: MediaQuery.of(context).size.width > 350 ? 50 : 42,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/ooredoo-logo.png'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 15.0),
                                              child: VerticalDivider(
                                                thickness: 1,
                                                color: Colors.grey.shade400,
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width > 320 ? 5 : 2,
                                            ),
                                            Expanded(
                                              child: Text(
                                                AppLocalizations.of(context)!.wholeSaleRaastas,
                                                style: TextStyle(
                                                    fontSize: MediaQuery.of(context).size.width > 350 ? 12 : 11,
                                                    color: Colors.grey.shade600,
                                                    fontWeight: FontWeight.w400
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                //DHIRAAGU CASH IN
                                Expanded(
                                  child: ScaleTransition(
                                    scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutBack)),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CashInView(dhiraagu: true, ooredoo: false)
                                            )
                                        );
                                      },
                                      child: Container(
                                        //width: 166,
                                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                        height: 84,
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
                                            Container(
                                              height: MediaQuery.of(context).size.width > 350 ? 50 : 42,
                                              width: MediaQuery.of(context).size.width > 350 ? 50 : 42,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/icon/dhp.png'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 15.0),
                                              child: VerticalDivider(
                                                thickness: 1,
                                                color: Colors.grey.shade400,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                AppLocalizations.of(context)!.dhiraaguPayCashIn,
                                                style: TextStyle(
                                                    fontSize: MediaQuery.of(context).size.width > 350 ? 12 : 11,
                                                    color: Colors.grey.shade600,
                                                    fontWeight: FontWeight.w400
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                //OOREDOO CASH IN
                                Expanded(
                                  child: ScaleTransition(
                                    scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutBack)),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CashInView(dhiraagu: false, ooredoo: true)
                                            )
                                        );
                                      },
                                      child: Container(
                                        //width: 166,
                                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                        height: 84,
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
                                            Container(
                                              height: MediaQuery.of(context).size.width > 350 ? 50 : 42,
                                              width: MediaQuery.of(context).size.width > 350 ? 50 : 42,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/icon/mfaisaa.png'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 15.0),
                                              child: VerticalDivider(
                                                thickness: 1,
                                                color: Colors.grey.shade400,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                AppLocalizations.of(context)!.ooredooMFaisa,
                                                style: TextStyle(
                                                    fontSize: MediaQuery.of(context).size.width > 350 ? 12 : 11,
                                                    color: Colors.grey.shade600,
                                                    fontWeight: FontWeight.w400
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                //SCHEDULED PAYMENTS
                                Expanded(
                                  child: ScaleTransition(
                                    scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutBack)),
                                    child: GestureDetector(
                                      onTap: () => Navigator.pushNamed(context, '/scheduled-payments'),
                                      child: Container(
                                        //width: 166,
                                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                        height: 84,
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
                                            Container(
                                              height: MediaQuery.of(context).size.width > 350 ? 50 : 42,
                                              width: MediaQuery.of(context).size.width > 350 ? 50 : 42,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/icon/schedule.png'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 15.0),
                                              child: VerticalDivider(
                                                thickness: 1,
                                                color: Colors.grey.shade400,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                AppLocalizations.of(context)!.schedulePayment,
                                                style: TextStyle(
                                                    fontSize: MediaQuery.of(context).size.width > 350 ? 12 : 11,
                                                    color: Colors.grey.shade600,
                                                    fontWeight: FontWeight.w400
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                //SEND SMS
                                Expanded(
                                  child: ScaleTransition(
                                    scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutBack)),
                                    child: GestureDetector(
                                      onTap: () => Navigator.pushNamed(context, '/send-sms'),
                                      child: Container(
                                        //width: 166,
                                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                        height: 84,
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
                                            Container(
                                              height: MediaQuery.of(context).size.width > 350 ? 50 : 42,
                                              width: MediaQuery.of(context).size.width > 350 ? 50 : 42,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/icon/sms.png'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 15.0),
                                              child: VerticalDivider(
                                                thickness: 1,
                                                color: Colors.grey.shade400,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                AppLocalizations.of(context)!.sendSMS,
                                                style: TextStyle(
                                                    fontSize: MediaQuery.of(context).size.width > 350 ? 12 : 11,
                                                    color: Colors.grey.shade600,
                                                    fontWeight: FontWeight.w400
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                //DONATE
                                Expanded(
                                  child: ScaleTransition(
                                    scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutBack)),
                                    child: GestureDetector(
                                      onTap: () => {
                                        Navigator.pushNamed(context, '/donate'),
                                      },
                                      child: Container(
                                        //width: 166,
                                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                        height: 84,
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
                                            Container(
                                              height: MediaQuery.of(context).size.width > 350 ? 50 : 42,
                                              width: MediaQuery.of(context).size.width > 350 ? 50 : 42,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/icon/donate.png'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 15.0),
                                              child: VerticalDivider(
                                                thickness: 1,
                                                color: Colors.grey.shade400,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                AppLocalizations.of(context)!.donate,
                                                style: TextStyle(
                                                    fontSize: MediaQuery.of(context).size.width > 350 ? 12 : 11,
                                                    color: Colors.grey.shade600,
                                                    fontWeight: FontWeight.w400
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                //SEND SMS
                                Expanded(
                                    child: Container()
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        )
                    ),
                  ],
                )
            )
        )
    );
  }
}

