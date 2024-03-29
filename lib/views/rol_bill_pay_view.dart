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

class RolBillPayView extends StatefulWidget {
  final bool? dhiraagu;
  final bool? ooredoo;
  RolBillPayView({Key? key,
    this.dhiraagu,
    this.ooredoo
  }) : super(key: key);

  @override
  _RolBillPayViewState createState() => _RolBillPayViewState();
}

class _RolBillPayViewState extends State<RolBillPayView> with SingleTickerProviderStateMixin{
  AnimationController? _animationController;
  Tween<double> _tween = Tween(begin: 0.1, end: 1);
  bool? _checked = false;
  bool _isVisible = false;
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
                              AppLocalizations.of(context)!.rolPayBillFirstText,
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
                                child: Text(AppLocalizations.of(context)!.accountNumber, style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600)
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
                          child: Container(
                            height: 46,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              color: Color(0xfff2f2f2),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(13.0),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  // Only numbers can be entered
                                  hintText: AppLocalizations.of(context)!.accountNumber,
                                  suffixIcon: Container(
                                    width: 11,
                                    height: 46,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                                    ),
                                    child: IconButton(
                                      icon: Icon(FontAwesomeIcons.gift, color: Colors.white, size: 16),
                                      onPressed: () {
                                      },
                                    ),
                                  )
                              ),
                            ),
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
                          begin: Offset(1, 0),
                          end: Offset.zero,
                        ).animate(_animationController),
                        child: FadeTransition(
                            opacity: _animationController,
                            child: ButtonWidget(buttonText: AppLocalizations.of(context)!.payBill)
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
                            AppLocalizations.of(context)!.rolPayBillFirstText,
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
                              child: Text(AppLocalizations.of(context)!.accountNumber, style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600)
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
                        child: Container(
                          height: 46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            color: Color(0xfff2f2f2),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(13.0),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                // Only numbers can be entered
                                hintText: AppLocalizations.of(context)!.accountNumber,
                                suffixIcon: Container(
                                  width: 11,
                                  height: 46,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                                  ),
                                  child: IconButton(
                                    icon: Icon(FontAwesomeIcons.gift, color: Colors.white, size: 16),
                                    onPressed: () {
                                    },
                                  ),
                                )
                            ),
                          ),
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
                        begin: Offset(-1, 0),
                        end: Offset.zero,
                      ).animate(_animationController),
                      child: FadeTransition(
                          opacity: _animationController,
                          child: ButtonWidget(buttonText: AppLocalizations.of(context)!.payBill)
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


