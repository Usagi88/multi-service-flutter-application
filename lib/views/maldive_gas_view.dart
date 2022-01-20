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
import 'package:provider/provider.dart';

class MaldiveGasView extends StatefulWidget {
  final bool? dhiraagu;
  final bool? ooredoo;
  MaldiveGasView({Key? key,
    this.dhiraagu,
    this.ooredoo
  }) : super(key: key);

  @override
  _MaldiveGasViewState createState() => _MaldiveGasViewState();
}

class MaldiveGasPackagesClass {
  final String name;
  final int id;
  const MaldiveGasPackagesClass(this.id,this.name);
}

class _MaldiveGasViewState extends State<MaldiveGasView> with SingleTickerProviderStateMixin{
  AnimationController? _animationController;
  Tween<double> _tween = Tween(begin: 0.1, end: 1);
  bool? _checked = false;
  bool _isVisible = false;

  MaldiveGasPackagesClass? _selectedMaldiveGasPackage;
  List<MaldiveGasPackagesClass> maldiveGasPackages = <MaldiveGasPackagesClass>[
    const MaldiveGasPackagesClass(1,'Select a package'),
    const MaldiveGasPackagesClass(2,'LP GAS CYLINDER 10 KG (MVR 200.00)'),
    const MaldiveGasPackagesClass(3,'Upgrade - LP Lui fulhi 10 KG Standard (MVR 500.00)'),
    const MaldiveGasPackagesClass(4,'Existing - LP Lui fulhi 10 KG Standard (MVR 200.00)')
  ];


  @override
  void initState() {
    _selectedMaldiveGasPackage=maldiveGasPackages[0];
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
  _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
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
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: Offset(1, 0),
                              end: Offset.zero,
                            ).animate(_animationController),
                            child: FadeTransition(
                              opacity: _animationController,
                              child: Text(AppLocalizations.of(context)!.maldiveGasFirstText,
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey.shade600),),
                            ),
                          )
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
                                AppLocalizations.of(context)!.accountNumber,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
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
                            hintText: AppLocalizations.of(context)!.accountNumber,
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
                                AppLocalizations.of(context)!.ownerIDCardNum,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
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
                          child: TextfieldTextWidget(
                            hintText: AppLocalizations.of(context)!.ownerIDCardNum,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Align( alignment: Alignment.centerRight,
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: Offset(1, 0),
                              end: Offset.zero,
                            ).animate(_animationController),
                            child: FadeTransition(
                                opacity: _animationController,
                                child: Text(
                                  AppLocalizations.of(context)!.selectPackage,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)
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
                                child:DropdownButton<MaldiveGasPackagesClass>(
                                  value: _selectedMaldiveGasPackage,
                                  onChanged: (MaldiveGasPackagesClass? newValue) {
                                    setState(() {
                                      _selectedMaldiveGasPackage = newValue;
                                      print(newValue?.id);
                                    });
                                  },
                                  items: maldiveGasPackages.map((MaldiveGasPackagesClass maldiveGasPackage) {
                                    return new DropdownMenuItem<MaldiveGasPackagesClass>(
                                      value: maldiveGasPackage,
                                      child: Container(
                                          width:double.infinity,
                                          alignment:Alignment.centerRight,
                                          padding: const EdgeInsets.fromLTRB(0,8.0,0,6.0),
                                          child:Text(
                                            maldiveGasPackage.name,
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
                                  hint:Text(AppLocalizations.of(context)!.selectAPackage),
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

                    Visibility(
                        visible: _isVisible,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                  child: SlideTransition(
                                    position: Tween<Offset>(
                                      begin: Offset(1, 0),
                                      end: Offset.zero,
                                    ).animate(_animationController),
                                    child: FadeTransition(
                                        opacity: _animationController,
                                        child: Text(AppLocalizations.of(context)!.nameToSave, style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600)
                                        )
                                    ),
                                  ),
                                )
                            ),
                            SizedBox(
                              height: 6,
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
                                  child: TextfieldTextWidget(
                                      hintText: AppLocalizations.of(context)!.nameToSave
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),

                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: Offset(1, 0),
                            end: Offset.zero,
                          ).animate(_animationController),
                          child: FadeTransition(
                            opacity: _animationController,
                            child: Container(
                              width: 172,
                              alignment: Alignment.centerRight,
                              child: CheckboxListTile(
                                title: Text(AppLocalizations.of(context)!.keepInfoSaved, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                value: _checked,
                                controlAffinity: ListTileControlAffinity.leading,
                                activeColor: Color(0xff29bf9a),
                                contentPadding: const EdgeInsets.all(0.0),
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    _checked = newValue;
                                    _toggleVisibility();
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
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
                          child: ButtonWidget(
                            buttonText: AppLocalizations.of(context)!.orderGas,
                          ),
                        ),
                      ),
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
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: Offset(-1, 0),
                            end: Offset.zero,
                          ).animate(_animationController),
                          child: FadeTransition(
                            opacity: _animationController,
                            child: Text(AppLocalizations.of(context)!.maldiveGasFirstText,
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey.shade600),),
                          ),
                        )
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
                              AppLocalizations.of(context)!.accountNumber,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
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
                          hintText: AppLocalizations.of(context)!.accountNumber,
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
                              AppLocalizations.of(context)!.ownerIDCardNum,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
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
                        child: TextfieldTextWidget(
                          hintText: AppLocalizations.of(context)!.ownerIDCardNum,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Align( alignment: Alignment.centerLeft,
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: Offset(-1, 0),
                            end: Offset.zero,
                          ).animate(_animationController),
                          child: FadeTransition(
                              opacity: _animationController,
                              child: Text(
                                AppLocalizations.of(context)!.selectPackage,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)
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
                        begin: Offset(2, 0),
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
                              child:DropdownButton<MaldiveGasPackagesClass>(
                                value: _selectedMaldiveGasPackage,
                                onChanged: (MaldiveGasPackagesClass? newValue) {
                                  setState(() {
                                    _selectedMaldiveGasPackage = newValue;
                                    print(newValue?.id);
                                  });
                                },
                                items: maldiveGasPackages.map((MaldiveGasPackagesClass maldiveGasPackage) {
                                  return new DropdownMenuItem<MaldiveGasPackagesClass>(
                                    value: maldiveGasPackage,
                                    child: Container(
                                        width:double.infinity,
                                        alignment:Alignment.centerLeft,
                                        padding: const EdgeInsets.fromLTRB(0,8.0,0,6.0),
                                        child:Text(
                                          maldiveGasPackage.name,
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
                                hint:Text(AppLocalizations.of(context)!.selectAPackage),
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

                  Visibility(
                      visible: _isVisible,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: SlideTransition(
                                  position: Tween<Offset>(
                                    begin: Offset(-1, 0),
                                    end: Offset.zero,
                                  ).animate(_animationController),
                                  child: FadeTransition(
                                      opacity: _animationController,
                                      child: Text(AppLocalizations.of(context)!.nameToSave, style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600)
                                      )
                                  ),
                                ),
                              )
                          ),
                          SizedBox(
                            height: 6,
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
                                child: TextfieldTextWidget(
                                    hintText: AppLocalizations.of(context)!.nameToSave
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),

                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: Offset(-1, 0),
                          end: Offset.zero,
                        ).animate(_animationController),
                        child: FadeTransition(
                          opacity: _animationController,
                          child: Container(
                            width: 172,
                            alignment: Alignment.centerLeft,
                            child: CheckboxListTile(
                              title: Text(AppLocalizations.of(context)!.keepInfoSaved, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                              value: _checked,
                              controlAffinity: ListTileControlAffinity.leading,
                              activeColor: Color(0xff29bf9a),
                              contentPadding: const EdgeInsets.all(0.0),
                              onChanged: (bool? newValue) {
                                setState(() {
                                  _checked = newValue;
                                  _toggleVisibility();
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(2, 0),
                        end: Offset.zero,
                      ).animate(_animationController),
                      child: FadeTransition(
                        opacity: _animationController,
                        child: ButtonWidget(
                          buttonText: AppLocalizations.of(context)!.orderGas,
                        ),
                      ),
                    ),
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


