import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fpapp/classes/gradient_icon.dart';
import 'package:fpapp/provider/locale_provider.dart';
import 'package:fpapp/widgets/banner_widget.dart';
import 'package:fpapp/widgets/gift_card_widget.dart';
import 'package:fpapp/widgets/navbar_widget.dart';
import 'package:fpapp/widgets/navbar_with_back_button_widget.dart';
import 'package:fpapp/widgets/sidemenu_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';


class GiftCardView extends StatefulWidget {
  const GiftCardView({Key? key}) : super(key: key);

  @override
  _GiftCardViewState createState() => _GiftCardViewState();
}

class GiftCardClass {
  final String name;
  final int id;
  const GiftCardClass(this.id,this.name);
}

class _GiftCardViewState extends State<GiftCardView> with SingleTickerProviderStateMixin{
  AnimationController? _animationController;
  Tween<double> _tween = Tween(begin: 0.1, end: 1);
  bool _isVisibleItunes = true;
  bool _isVisiblePlaystation = true;
  bool _isVisibleNetflix = true;

  _setVisibilityAll() {
    setState(() {
      _isVisibleItunes = true;
      _isVisiblePlaystation = true;
      _isVisibleNetflix = true;
    });
  }
  _setVisibilityItunes() {
    setState(() {
      _isVisibleItunes = true;
      _isVisiblePlaystation = false;
      _isVisibleNetflix = false;
    });
  }
  _setVisibilityPlaystation() {
    setState(() {
      _isVisibleItunes = false;
      _isVisiblePlaystation = true;
      _isVisibleNetflix = false;
    });
  }
  _setVisibilityNetflix() {
    setState(() {
      _isVisibleItunes = false;
      _isVisiblePlaystation = false;
      _isVisibleNetflix = true;
    });
  }
  GiftCardClass? _selectedGiftCard;
  List<GiftCardClass> giftCards = <GiftCardClass>[
    const GiftCardClass(1,'All'),
    const GiftCardClass(2,'Itunes'),
    const GiftCardClass(3,'Playstation'),
    const GiftCardClass(4,'Netflix')
  ];

  get child => null;
  @override
  // ignore: must_call_super
  void initState() {
    _selectedGiftCard=giftCards[0];
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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _portraitModeOnly(context, _animationController, _tween, language);
  }
  //portrait
  Scaffold _portraitModeOnly(BuildContext context, _animationController, _tween, language) {
    if (language.locale.toString() == 'dv' || language.locale.toString() == 'ar'){
      return Scaffold(
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
                                  child:DropdownButton<GiftCardClass>(
                                    value: _selectedGiftCard,
                                    onChanged: (GiftCardClass? newValue) {
                                      setState(() {
                                        _selectedGiftCard = newValue;
                                        if(newValue?.name == 'All'){
                                          _setVisibilityAll();
                                        }else if(newValue?.name == 'Itunes'){
                                          _setVisibilityItunes();
                                        }else if(newValue?.name == 'Playstation'){
                                          _setVisibilityPlaystation();
                                        }else if(newValue?.name == 'Netflix'){
                                          _setVisibilityNetflix();
                                        }
                                      });
                                    },
                                    items: giftCards.map((GiftCardClass giftcard) {
                                      return new DropdownMenuItem<GiftCardClass>(
                                        value: giftcard,
                                        child: Container(
                                            width:double.infinity,
                                            alignment:Alignment.centerRight,
                                            padding: const EdgeInsets.fromLTRB(0,8.0,0,6.0),
                                            child:Text(
                                              giftcard.name,
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
                                    hint:Text(AppLocalizations.of(context)!.selectGiftCardText),
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
                        height: 10,
                      ),
                      Visibility(
                          visible: _isVisibleItunes,
                          child: Column(
                            children: [
                              GiftCardWidget(
                                itunes: true,
                                psn: false,
                                netflix: false,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          )
                      ),
                      Visibility(
                          visible: _isVisiblePlaystation,
                          child: Column(
                            children: [
                              GiftCardWidget(
                                itunes: false,
                                psn: true,
                                netflix: false,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          )
                      ),
                      Visibility(
                          visible: _isVisibleNetflix,
                          child: Column(
                            children: [
                              GiftCardWidget(
                                itunes: false,
                                psn: false,
                                netflix: true,
                              ),
                              SizedBox(
                                height: 40,
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

    return Scaffold(
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
                                child:DropdownButton<GiftCardClass>(
                                  value: _selectedGiftCard,
                                  onChanged: (GiftCardClass? newValue) {
                                    setState(() {
                                      _selectedGiftCard = newValue;
                                      if(newValue?.name == 'All'){
                                        _setVisibilityAll();
                                      }else if(newValue?.name == 'Itunes'){
                                        _setVisibilityItunes();
                                      }else if(newValue?.name == 'Playstation'){
                                        _setVisibilityPlaystation();
                                      }else if(newValue?.name == 'Netflix'){
                                        _setVisibilityNetflix();
                                      }
                                    });
                                  },
                                  items: giftCards.map((GiftCardClass giftcard) {
                                    return new DropdownMenuItem<GiftCardClass>(
                                      value: giftcard,
                                      child: Container(
                                          width:double.infinity,
                                          alignment:Alignment.centerLeft,
                                          padding: const EdgeInsets.fromLTRB(0,8.0,0,6.0),
                                          child:Text(
                                            giftcard.name,
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
                                  hint:Text(AppLocalizations.of(context)!.selectGiftCardText),
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
                      height: 10,
                    ),
                    Visibility(
                      visible: _isVisibleItunes,
                      child: Column(
                        children: [
                          GiftCardWidget(
                            itunes: true,
                            psn: false,
                            netflix: false,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      )
                    ),
                    Visibility(
                        visible: _isVisiblePlaystation,
                        child: Column(
                          children: [
                            GiftCardWidget(
                              itunes: false,
                              psn: true,
                              netflix: false,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        )
                    ),
                    Visibility(
                        visible: _isVisibleNetflix,
                        child: Column(
                          children: [
                            GiftCardWidget(
                              itunes: false,
                              psn: false,
                              netflix: true,
                            ),
                            SizedBox(
                              height: 40,
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

