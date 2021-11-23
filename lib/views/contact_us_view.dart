import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fpapp/widgets/navbar_widget.dart';
import 'package:fpapp/widgets/navbar_with_back_button_widget.dart';
import 'package:fpapp/widgets/sidemenu_widget.dart';
import 'package:fpapp/widgets/banner_widget.dart';
import 'package:fpapp/widgets/social_media_button_widget.dart';
import 'package:flutter/services.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({Key? key}) : super(key: key);
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
        child: Column(//not putting padding on column because logo image requires different padding
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
                    'Contact Us',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width * 0.62,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              minLeadingWidth: 10,
              leading: GradientIcon(
                FontAwesomeIcons.phoneAlt,
                24.0,
                LinearGradient(
                  colors: <Color>[
                    Color(0xff3AC170),
                    Color(0xff25BFA3),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              title: Text("4007004",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
            ),
            ListTile(
              minLeadingWidth: 10,
              leading: GradientIcon(
                FontAwesomeIcons.solidEnvelope,
                24.0,
                LinearGradient(
                  colors: <Color>[
                    Color(0xff3AC170),
                    Color(0xff25BFA3),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              title: Text("info@fahipay.mv",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
            ),
            ListTile(
              minLeadingWidth: 10,
              leading: GradientIcon(
                FontAwesomeIcons.globe,
                24.0,
                LinearGradient(
                  colors: <Color>[
                    Color(0xff3AC170),
                    Color(0xff25BFA3),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              title: Text("www.fahipay.mv",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children:[
                  Text(
                    'Social Media Handles',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width * 0.40,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children:[
                  SocialMediaButton(
                    socialMediaIcon: FontAwesomeIcons.twitter,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  SocialMediaButton(
                    socialMediaIcon: FontAwesomeIcons.telegramPlane,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  SocialMediaButton(
                    socialMediaIcon: FontAwesomeIcons.viber,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  SocialMediaButton(
                    socialMediaIcon: FontAwesomeIcons.facebookF,
                  )

                ],
              ),
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
                      'Contact Us',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width * 0.62,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                minLeadingWidth: 10,
                leading: GradientIcon(
                  FontAwesomeIcons.phoneAlt,
                  24.0,
                  LinearGradient(
                    colors: <Color>[
                      Color(0xff3AC170),
                      Color(0xff25BFA3),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                title: Text("4007004",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
              ),
              ListTile(
                minLeadingWidth: 10,
                leading: GradientIcon(
                  FontAwesomeIcons.solidEnvelope,
                  24.0,
                  LinearGradient(
                    colors: <Color>[
                      Color(0xff3AC170),
                      Color(0xff25BFA3),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                title: Text("info@fahipay.mv",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
              ),
              ListTile(
                minLeadingWidth: 10,
                leading: GradientIcon(
                  FontAwesomeIcons.globe,
                  24.0,
                  LinearGradient(
                    colors: <Color>[
                      Color(0xff3AC170),
                      Color(0xff25BFA3),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                title: Text("www.fahipay.mv",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children:[
                    Text(
                      'Social Media Handles',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width * 0.40,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children:[
                    SocialMediaButton(
                      socialMediaIcon: FontAwesomeIcons.twitter,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    SocialMediaButton(
                      socialMediaIcon: FontAwesomeIcons.telegramPlane,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    SocialMediaButton(
                      socialMediaIcon: FontAwesomeIcons.viber,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    SocialMediaButton(
                      socialMediaIcon: FontAwesomeIcons.facebookF,
                    )

                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
 */