import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpapp/classes/custom_carousel_pro.dart';
import 'package:fpapp/views/bill_pay_view.dart';
import 'package:fpapp/views/cash_in_view.dart';
import 'package:fpapp/views/raastas_reload_view.dart';
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
}

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
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children:[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height - 30 - 66 - 130 - navBarHeight - safePadding,
                      child: ListView(
                        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                        children: [
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
                                            builder: (context) => RaastasReloadView(dhiraagu: true, ooredoo: false),
                                          )
                                      );
                                    },
                                    child: Container(
                                      //width: 166,
                                      //padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                                            height: MediaQuery.of(context).size.width > 350 ? 56 : 42,
                                            width: MediaQuery.of(context).size.width > 350 ? 56 : 42,
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
                                              'Dhiraagu Reload',
                                              style: TextStyle(
                                                  fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12,
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
                                            builder: (context) => RaastasReloadView(dhiraagu: false, ooredoo: true),
                                          )
                                      );
                                    },
                                    child: Container(
                                      //width: 166,
                                      //padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                                            height: MediaQuery.of(context).size.width > 350 ? 56 : 42,
                                            width: MediaQuery.of(context).size.width > 350 ? 56 : 42,
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
                                              'Ooredoo Raastas',
                                              style: TextStyle(
                                                  fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12,
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
                                            builder: (context) => PackageRechargeView(dhiraagu: true, ooredoo: false),
                                          )
                                      );
                                    },
                                    child: Container(
                                      //width: 166,
                                      //padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                                            height: MediaQuery.of(context).size.width > 350 ? 56 : 42,
                                            width: MediaQuery.of(context).size.width > 350 ? 56 : 42,
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
                                              'Dhiraagu Package Recharge',
                                              style: TextStyle(
                                                  fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12,
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
                                            builder: (context) => PackageRechargeView(dhiraagu: false, ooredoo: true),
                                          )
                                      );
                                    },
                                    child: Container(
                                      //width: 166,
                                      //padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                                            height: MediaQuery.of(context).size.width > 350 ? 56 : 42,
                                            width: MediaQuery.of(context).size.width > 350 ? 56 : 42,
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
                                              'Ooredoo Package Recharge',
                                              style: TextStyle(
                                                  fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12,
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
                                            builder: (context) => BillPayView(dhiraagu: true, ooredoo: false),
                                          )
                                      );
                                    },
                                    child: Container(
                                      //width: 166,
                                      //padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                                            height: MediaQuery.of(context).size.width > 350 ? 56 : 42,
                                            width: MediaQuery.of(context).size.width > 350 ? 56 : 42,
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
                                              'Dhiraagu Bill Pay',
                                              style: TextStyle(
                                                  fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12,
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
                                            builder: (context) => BillPayView(dhiraagu: false, ooredoo: true),
                                          )
                                      );
                                    },
                                    child: Container(
                                      //width: 166,
                                      //padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                                            height: MediaQuery.of(context).size.width > 350 ? 56 : 42,
                                            width: MediaQuery.of(context).size.width > 350 ? 56 : 42,
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
                                              'Ooredoo Bill Pay',
                                              style: TextStyle(
                                                  fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12,
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
                                            builder: (context) => CashInView(dhiraagu: true, ooredoo: false),
                                          )
                                      );
                                    },
                                    child: Container(
                                      //width: 166,
                                      //padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                                            height: MediaQuery.of(context).size.width > 350 ? 56 : 42,
                                            width: MediaQuery.of(context).size.width > 350 ? 56 : 42,
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
                                              'Dhiraagu Pay Cash In',
                                              style: TextStyle(
                                                  fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12,
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
                                            builder: (context) => CashInView(dhiraagu: false, ooredoo: true),
                                          )
                                      );
                                    },
                                    child: Container(
                                      //width: 166,
                                      //padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                                            height: MediaQuery.of(context).size.width > 350 ? 56 : 42,
                                            width: MediaQuery.of(context).size.width > 350 ? 56 : 42,
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
                                              'Ooredoo M-Faisaa Cash In',
                                              style: TextStyle(
                                                  fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12,
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
                              ServiceCard(
                                serviceCardImage: 'assets/images/dhiraagu-logo.png',
                                serviceCardText: 'Dhiraagu Reload',
                                animationController: _animationController,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              ServiceCard(
                                serviceCardImage: 'assets/images/ooredoo-logo.png',
                                serviceCardText: 'Ooredoo Raastas',
                                animationController: _animationController,
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