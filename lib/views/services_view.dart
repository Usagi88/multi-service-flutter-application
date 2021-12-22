import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpapp/widgets/navbar_widget.dart';
import 'package:fpapp/widgets/navbar_with_back_button_widget.dart';
import 'package:fpapp/widgets/service_card_widget.dart';
import 'package:fpapp/widgets/sidemenu_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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