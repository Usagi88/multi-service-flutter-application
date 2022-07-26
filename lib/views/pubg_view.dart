import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fpapp/classes/gradient_icon.dart';
import 'package:fpapp/provider/locale_provider.dart';
import 'package:fpapp/widgets/banner_widget.dart';
import 'package:fpapp/widgets/button_widget.dart';
import 'package:fpapp/widgets/navbar_with_back_button_widget.dart';
import 'package:fpapp/widgets/sidemenu_widget.dart';
import 'package:fpapp/widgets/textfield_number_widget.dart';
import 'package:fpapp/widgets/textfield_text_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fpapp/widgets/warning_text_widget.dart';
import 'package:provider/provider.dart';

class PubGView extends StatefulWidget {
  final bool? dhiraagu;
  final bool? ooredoo;
  PubGView({Key? key,
    this.dhiraagu,
    this.ooredoo
  }) : super(key: key);

  @override
  _PubGViewState createState() => _PubGViewState();
}

class PubGPackageClass {
  final String name;
  final int id;
  const PubGPackageClass(this.id,this.name);
}

class _PubGViewState extends State<PubGView> with SingleTickerProviderStateMixin{
  AnimationController? _animationController;
  Tween<double> _tween = Tween(begin: 0.1, end: 1);


  PubGPackageClass? _selectedPubgPackage;
  List<PubGPackageClass> pubgPackages = <PubGPackageClass>[
    const PubGPackageClass(1,'Select Package'),
    const PubGPackageClass(2,'PUBG Mobile - 60 UC (25 MVR)'),
    const PubGPackageClass(3,'PUBG Mobile - 325 UC (100 MVR)'),
    const PubGPackageClass(4,'PUBG Mobile - 660 UC (210 MVR)'),
    const PubGPackageClass(6,'PUBG Mobile - 1800 UC (475 MVR)'),
    const PubGPackageClass(7,'PUBG Mobile - 3850 UC (925 MVR)'),
    const PubGPackageClass(8,'PUBG Mobile - 8100 UC (1899 MVR)')
  ];

  @override
  void initState() {
    _selectedPubgPackage=pubgPackages[0];
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
    double height = NavbarWithBackButton().preferredSize.height;
    var safePadding = MediaQuery.of(context).padding.top;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _portraitModeOnly(context, height, safePadding,  _animationController, _tween, language);
  }

  //portrait
  Scaffold _portraitModeOnly(BuildContext context, height, safePadding, _animationController, _tween, language) {
    if (language.locale.toString() == 'dv' || language.locale.toString() == 'ar'){
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
                            animationController: _animationController,
                          ),
                        ]
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: Offset(1, 0),
                            end: Offset.zero,
                          ).animate(_animationController),
                          child: FadeTransition(
                            opacity: _animationController,
                            child: Text(
                              AppLocalizations.of(context)!.pubgFirstText,
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff909090)
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: Offset(1, 0),
                              end: Offset.zero,
                            ).animate(_animationController),
                            child: FadeTransition(
                              opacity: _animationController,
                              child: Text(
                                AppLocalizations.of(context)!.playerID,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                            ),
                          )
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: Offset(1, 0),
                          end: Offset.zero,
                        ).animate(_animationController),
                        child: FadeTransition(
                          opacity: _animationController,
                          child: TextfieldNumberWidget(
                            hintText: AppLocalizations.of(context)!.playerID,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: Offset(1, 0),
                              end: Offset.zero,
                            ).animate(_animationController),
                            child: FadeTransition(
                              opacity: _animationController,
                              child: Text(
                                AppLocalizations.of(context)!.selectPackage,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                            ),
                          )
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: Offset(1, 0),
                          end: Offset.zero,
                        ).animate(_animationController),
                        child: FadeTransition(
                          opacity: _animationController,
                          child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              height: 46,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: DropdownButtonHideUnderline(
                                child:DropdownButton<PubGPackageClass>(
                                  value: _selectedPubgPackage,
                                  onChanged: (PubGPackageClass? newValue) {
                                    setState(() {
                                      _selectedPubgPackage = newValue;
                                    });
                                  },
                                  items: pubgPackages.map((PubGPackageClass pubgPackage) {
                                    return new DropdownMenuItem<PubGPackageClass>(
                                      value: pubgPackage,
                                      child: Container(
                                          width:double.infinity,
                                          alignment:Alignment.centerRight,
                                          padding: const EdgeInsets.fromLTRB(0,8.0,0,6.0),
                                          child:Text(
                                            pubgPackage.name,
                                            style: new TextStyle(fontSize: 14,fontWeight: FontWeight.w400),
                                          ),
                                          decoration:BoxDecoration(
                                              border:Border(bottom:BorderSide(color:Colors.grey.shade300,width:1))
                                          )
                                      ),
                                    );
                                  }).toList(),
                                  isExpanded: true,
                                  icon: Align(
                                    alignment: Alignment(0.0,-0.50),
                                    child: GradientIcon(
                                      FontAwesomeIcons.sortDown,
                                      22.0,
                                      LinearGradient(
                                        colors: <Color>[
                                          Color(0xff3AC170),
                                          Color(0xff25BFA3),
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                    ),
                                  ),
                                  hint:Text(AppLocalizations.of(context)!.selectPackage),
                                  disabledHint:Text(AppLocalizations.of(context)!.disabled),
                                  iconDisabledColor: Colors.red,
                                  iconEnabledColor: Colors.green,
                                  style: TextStyle(color: Colors.black, fontSize: 14,fontWeight: FontWeight.w400),
                                  elevation: 2,
                                ),
                              )
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: Offset(1, 0),
                          end: Offset.zero,
                        ).animate(_animationController),
                        child: FadeTransition(
                            opacity: _animationController,
                            child: ButtonWidget(buttonText: AppLocalizations.of(context)!.buyPackage)
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: Offset(-1, 0),
                            end: Offset.zero,
                          ).animate(_animationController),
                          child: FadeTransition(
                            opacity: _animationController,
                            child: WarningText(
                                warningText: AppLocalizations.of(context)!.pubgSecondText,
                                warningTextBottomColor: 0xFFFF0000
                            ),
                          ),
                        )
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
          )
      );
    }

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
                          animationController: _animationController,
                        ),
                      ]
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: Offset(-1, 0),
                          end: Offset.zero,
                        ).animate(_animationController),
                        child: FadeTransition(
                          opacity: _animationController,
                          child: Text(
                            AppLocalizations.of(context)!.pubgFirstText,
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff909090)
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: Offset(-1, 0),
                            end: Offset.zero,
                          ).animate(_animationController),
                          child: FadeTransition(
                            opacity: _animationController,
                            child: Text(
                              AppLocalizations.of(context)!.playerID,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                          ),
                        )
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(-1, 0),
                        end: Offset.zero,
                      ).animate(_animationController),
                      child: FadeTransition(
                        opacity: _animationController,
                        child: TextfieldNumberWidget(
                          hintText: AppLocalizations.of(context)!.playerID,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: Offset(-1, 0),
                            end: Offset.zero,
                          ).animate(_animationController),
                          child: FadeTransition(
                            opacity: _animationController,
                            child: Text(
                              AppLocalizations.of(context)!.selectPackage,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                          ),
                        )
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(-1, 0),
                        end: Offset.zero,
                      ).animate(_animationController),
                      child: FadeTransition(
                        opacity: _animationController,
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            height: 46,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: DropdownButtonHideUnderline(
                              child:DropdownButton<PubGPackageClass>(
                                value: _selectedPubgPackage,
                                onChanged: (PubGPackageClass? newValue) {
                                  setState(() {
                                    _selectedPubgPackage = newValue;
                                  });
                                },
                                items: pubgPackages.map((PubGPackageClass pubgPackage) {
                                  return new DropdownMenuItem<PubGPackageClass>(
                                    value: pubgPackage,
                                    child: Container(
                                        width:double.infinity,
                                        alignment:Alignment.centerLeft,
                                        padding: const EdgeInsets.fromLTRB(0,8.0,0,6.0),
                                        child:Text(
                                          pubgPackage.name,
                                          style: new TextStyle(fontSize: 14,fontWeight: FontWeight.w400),
                                        ),
                                        decoration:BoxDecoration(
                                            border:Border(bottom:BorderSide(color:Colors.grey.shade300,width:1))
                                        )
                                    ),
                                  );
                                }).toList(),
                                isExpanded: true,
                                icon: Align(
                                  alignment: Alignment(0.0,-0.50),
                                  child: GradientIcon(
                                    FontAwesomeIcons.sortDown,
                                    22.0,
                                    LinearGradient(
                                      colors: <Color>[
                                        Color(0xff3AC170),
                                        Color(0xff25BFA3),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                ),
                                hint:Text(AppLocalizations.of(context)!.selectPackage),
                                disabledHint:Text(AppLocalizations.of(context)!.disabled),
                                iconDisabledColor: Colors.red,
                                iconEnabledColor: Colors.green,
                                style: TextStyle(color: Colors.black, fontSize: 14,fontWeight: FontWeight.w400),
                                elevation: 2,
                              ),
                            )
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(-1, 0),
                        end: Offset.zero,
                      ).animate(_animationController),
                      child: FadeTransition(
                          opacity: _animationController,
                          child: ButtonWidget(buttonText: AppLocalizations.of(context)!.buyPackage)
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: Offset(-1, 0),
                          end: Offset.zero,
                        ).animate(_animationController),
                        child: FadeTransition(
                          opacity: _animationController,
                          child: WarningText(
                              warningText: AppLocalizations.of(context)!.pubgSecondText,
                              warningTextBottomColor: 0xFFFF0000
                          ),
                        ),
                      )
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
        )
    );
  }
}


