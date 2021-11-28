import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fpapp/widgets/banner_widget.dart';
import 'package:fpapp/widgets/button_widget.dart';
import 'package:fpapp/widgets/navbar_with_back_button_widget.dart';
import 'package:fpapp/widgets/sidemenu_widget.dart';
import 'package:flutter/services.dart';
import 'package:fpapp/widgets/textfield_number_widget.dart';
import 'package:fpapp/widgets/textfield_text_widget.dart';
import 'dart:math' as math;

class TopUpViaMIB extends StatelessWidget {
  const TopUpViaMIB({Key? key}) : super(key: key);

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
  return Scaffold (
      appBar: NavbarWithBackButton(),
      drawer: SideMenu(),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
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
                        Positioned(
                          left: 0,
                          right: 0,
                          top: 110,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Container(
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
                              child: DefaultTabController(
                                length: 2,
                                initialIndex: 1,
                                child: TabBar(
                                    labelColor: Colors.white,
                                    unselectedLabelColor: Colors.black,
                                    indicatorSize: TabBarIndicatorSize.label,
                                    //padding: const EdgeInsets.all(0),
                                    //indicatorPadding: const EdgeInsets.all(0),
                                    labelPadding: const EdgeInsets.all(0),
                                    indicator: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10),),
                                      gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                                    ),
                                    tabs: [
                                      Tab(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text("BML", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400)),
                                        ),
                                      ),
                                      Tab(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text("MIB", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400)),
                                        ),
                                      ),
                                    ]
                                ),
                              ),
                            ),
                          ),
                        )
                      ]
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 14),
                        child: Container(
                          width: 68,
                          height: 68,
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GradientText(
                                  text: '1',
                                  style: TextStyle(color: Colors.white,fontSize: 26,fontWeight: FontWeight.w700),
                                  gradient: const LinearGradient(
                                      colors: [
                                        Color(0xff3AC170),
                                        Color(0xff25BFA3),
                                      ],
                                      transform: GradientRotation(math.pi * 0.50)
                                  )
                              ),
                              GradientText(
                                  text: 'Step',
                                  style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w700),
                                  gradient: const LinearGradient(
                                      colors: [
                                        Color(0xff3AC170),
                                        Color(0xff25BFA3),
                                      ],
                                      transform: GradientRotation(math.pi * 0.50)
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0, right: 20),
                        child: Container(
                          width: 238,
                          child: Text('Transfer your amount to the following account via MIB Internet banking',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey.shade600
                              )
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text("Account Name", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400)),
                    )
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.053,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Color(0xfff2f2f2),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10.0),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            // Only numbers can be entered
                            hintText: '90101480013752000',
                            suffixIcon: Container(
                              width: 11,
                              height: 46,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                              ),
                              child: IconButton(
                                icon: Icon(FontAwesomeIcons.solidClone, color: Colors.white, size: 16),
                                onPressed: () {
                                },
                              ),
                            )
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text("Account Name", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400)),
                      )
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.053,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Color(0xfff2f2f2),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10.0),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            // Only numbers can be entered
                            hintText: '90101480013752000',
                            suffixIcon: Container(
                              width: 11,
                              height: 46,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                              ),
                              child: IconButton(
                                icon: Icon(FontAwesomeIcons.solidClone, color: Colors.white, size: 16),
                                onPressed: () {
                                },
                              ),
                            )
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.053,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Color(0xfff2f2f2),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10.0),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            // Only numbers can be entered
                            hintText: '90101480013752000',
                            suffixIcon: Container(
                              width: 11,
                              height: 46,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                              ),
                              child: IconButton(
                                icon: Icon(FontAwesomeIcons.solidClone, color: Colors.white, size: 16),
                                onPressed: () {
                                },
                              ),
                            )
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 6),
                        child: Container(
                          width: 68,
                          height: 68,
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GradientText(
                                  text: '2',
                                  style: TextStyle(color: Colors.white,fontSize: 26,fontWeight: FontWeight.w700),
                                  gradient: const LinearGradient(
                                      colors: [
                                        Color(0xff3AC170),
                                        Color(0xff25BFA3),
                                      ],
                                      transform: GradientRotation(math.pi * 0.50)
                                  )
                              ),
                              GradientText(
                                  text: 'Step',
                                  style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w700),
                                  gradient: const LinearGradient(
                                      colors: [
                                        Color(0xff3AC170),
                                        Color(0xff25BFA3),
                                      ],
                                      transform: GradientRotation(math.pi * 0.50)
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0, right: 20),
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          color: Color(0xff25bfa0),
                          radius: Radius.circular(12),
                          dashPattern: [16, 4],
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            child: Container(
                              width: 282,
                              height: 62,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GradientIcon(
                                    FontAwesomeIcons.cloudDownloadAlt,
                                    24.0,
                                    LinearGradient(
                                      colors: <Color>[
                                        Color(0xff3AC170),
                                        Color(0xff25BFA3),
                                      ],
                                      //begin: Alignment.topLeft,
                                      //end: Alignment.bottomRight,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:20.0),
                                    child: Text("Upload Transfer Receipt", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 55,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xff3AC170),
                          const Color(0xff25BFA3),
                        ],
                      ),
                    ),
                    child: Text("OR", style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700, color: Colors.white)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text("Reference number (Minimum last 4 digits)", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400)),
                    )
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextfieldTextWidget(
                        hintText: 'Reference Number'
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text("Transferred Amount", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400)),
                      )
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextfieldTextWidget(
                        hintText: 'Transferred Amount'
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ButtonWidget(
                        buttonText: 'Claim'
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              )
          )
      )
  );
}

//class that makes text have gradient
class GradientText extends StatelessWidget {
  final String text;
  final Gradient gradient;
  final TextStyle? style;

  const GradientText({
    Key? key,
    required this.text,
    required this.gradient,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return gradient
            .createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height));
      },
      child: Text(
        text,
        style: style,
      ),
    );
  }
}


//class that makes icons have gradient
class GradientIcon extends StatelessWidget {
  GradientIcon(
      this.icon,
      this.size,
      this.gradient,
      );

  final IconData icon;
  final double size;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: SizedBox(
        width: size * 1.4,
        height: size * 1.4,
        child: Icon(
          icon,
          size: size,
          color: Colors.white,
        ),
      ),
      shaderCallback: (Rect bounds) {
        final Rect rect = Rect.fromLTRB(0, 0, size, size);
        return gradient.createShader(rect);
      },
    );
  }
}


//class that makes icons have gradient. Used in navbar/appbar
class RadiantGradientMask extends StatelessWidget {
  final Widget child;
  RadiantGradientMask({Key? key,
    required this.child
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => RadialGradient(
        center: Alignment.center,
        radius: 0.5,
        colors: [Color(0xff3AC170), Color(0xff25BFA3)],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}