import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpapp/widgets/navbar_widget.dart';
import 'package:fpapp/widgets/navbar_with_back_button_widget.dart';
import 'package:fpapp/widgets/service_card_widget.dart';
import 'package:fpapp/widgets/sidemenu_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double navBarHeight = Navbar().preferredSize.height;
    var safePadding = MediaQuery.of(context).padding.top;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _portraitModeOnly(context, navBarHeight, safePadding);

  }
}

//portrait
Scaffold _portraitModeOnly(BuildContext context, navBarHeight, safePadding) {
  return Scaffold(
      appBar: NavbarWithBackButton(),
      drawer: SideMenu(),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 130,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/zakai.png'),
                        fit: BoxFit.fill,
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
                        child: Text(
                          AppLocalizations.of(context)!.services,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: const SizedBox(
                          height: 1.0,
                          child: const DecoratedBox(
                            decoration: const BoxDecoration(
                                color: Color(0xffcccccc)
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
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              ServiceCard(
                                serviceCardImage: 'assets/images/ooredoo-logo.png',
                                serviceCardText: 'Ooredoo Raastas',
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
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              ServiceCard(
                                serviceCardImage: 'assets/images/ooredoo-logo.png',
                                serviceCardText: 'Ooredoo Raastas',
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
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              ServiceCard(
                                serviceCardImage: 'assets/images/ooredoo-logo.png',
                                serviceCardText: 'Ooredoo Raastas',
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
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              ServiceCard(
                                serviceCardImage: 'assets/images/ooredoo-logo.png',
                                serviceCardText: 'Ooredoo Raastas',
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
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              ServiceCard(
                                serviceCardImage: 'assets/images/ooredoo-logo.png',
                                serviceCardText: 'Ooredoo Raastas',
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