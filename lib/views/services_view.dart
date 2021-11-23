import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpapp/widgets/navbar_widget.dart';
import 'package:fpapp/widgets/navbar_with_back_button_widget.dart';
import 'package:fpapp/widgets/service_card_widget.dart';
import 'package:fpapp/widgets/sidemenu_widget.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _portraitModeOnly(context);

  }
}

//portrait
Scaffold _portraitModeOnly(BuildContext context) {
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children:[
                        Text(
                          'Services',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width * 0.68,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.58,
                        child: ListView(
                          children: [
                            Row(
                              children: [
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
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
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
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
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
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
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
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
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
                              ],
                            ),

                          ],
                        )
                    ),
                  ),

                ],
              )
          )
      )
  );
}