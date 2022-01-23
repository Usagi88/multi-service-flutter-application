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

class DonateView extends StatefulWidget {
  final bool? dhiraagu;
  final bool? ooredoo;
  DonateView({Key? key,
    this.dhiraagu,
    this.ooredoo
  }) : super(key: key);

  @override
  _DonateViewState createState() => _DonateViewState();
}

class DonatePackageClass {
  String name;
  int id;
  DonatePackageClass(this.id,this.name);
}

class _DonateViewState extends State<DonateView> with SingleTickerProviderStateMixin{
  AnimationController? _animationController;
  Tween<double> _tween = Tween(begin: 0.1, end: 1);


  DonatePackageClass? _selectedDonatePackage;
  List<DonatePackageClass> donatePackages = <DonatePackageClass>[
    DonatePackageClass(1,'Select a donee'),
    DonatePackageClass(2,'Esfiya'),
    DonatePackageClass(3,'DhivehiMv'),
  ];

  @override
  void initState() {
    _selectedDonatePackage=donatePackages[0];
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
    for (var i = 0; i < donatePackages.length; i++) {
      switch (donatePackages[i].name){
        case 'Select a donee':
          donatePackages[i].name = AppLocalizations.of(context)!.selectADonee;
          break;
      }
    }
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
                                AppLocalizations.of(context)!.selectADonee,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
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
                                child:DropdownButton<DonatePackageClass>(
                                  value: _selectedDonatePackage,
                                  onChanged: (DonatePackageClass? newValue) {
                                    setState(() {
                                      _selectedDonatePackage = newValue;
                                    });
                                  },
                                  items: donatePackages.map((DonatePackageClass donatePackage) {
                                    return new DropdownMenuItem<DonatePackageClass>(
                                      value: donatePackage,
                                      child: Container(
                                          width:double.infinity,
                                          alignment:Alignment.centerRight,
                                          padding: const EdgeInsets.fromLTRB(0,8.0,0,6.0),
                                          child:Text(

                                            donatePackage.name,
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
                                  hint:Text(AppLocalizations.of(context)!.selectADonee),
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
                                AppLocalizations.of(context)!.amount,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
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
                            hintText: AppLocalizations.of(context)!.amount,
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
                            child: ButtonWidget(buttonText: AppLocalizations.of(context)!.sendDonation)
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
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      AppLocalizations.of(context)!.donateSecondText,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff909090)
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                        height: 1,
                                        width: MediaQuery.of(context).size.width * 0.25,
                                        color: Color(0xff909090)
                                    ),
                                  ),
                                ],
                              )
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
                            AppLocalizations.of(context)!.donateFirstText,
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
                              AppLocalizations.of(context)!.selectADonee,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
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
                              child:DropdownButton<DonatePackageClass>(
                                value: _selectedDonatePackage,
                                onChanged: (DonatePackageClass? newValue) {
                                  setState(() {
                                    _selectedDonatePackage = newValue;
                                  });
                                },
                                items: donatePackages.map((DonatePackageClass donatePackage) {
                                  return new DropdownMenuItem<DonatePackageClass>(
                                    value: donatePackage,
                                    child: Container(
                                        width:double.infinity,
                                        alignment:Alignment.centerLeft,
                                        padding: const EdgeInsets.fromLTRB(0,8.0,0,6.0),
                                        child:Text(
                                          donatePackage.name,
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
                                hint:Text(AppLocalizations.of(context)!.selectADonee),
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
                              AppLocalizations.of(context)!.amount,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
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
                          hintText: AppLocalizations.of(context)!.amount,
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
                          child: ButtonWidget(buttonText: AppLocalizations.of(context)!.sendDonation)
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
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    AppLocalizations.of(context)!.donateSecondText,
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff909090)
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    height: 1,
                                    width: MediaQuery.of(context).size.width * 0.25,
                                    color: Color(0xff909090)
                                  ),
                                ),
                              ],
                            )
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


