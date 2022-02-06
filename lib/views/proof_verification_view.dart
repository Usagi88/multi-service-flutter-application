import 'dart:async';

import 'package:dotted_border/dotted_border.dart';
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

class ProofVerificationView extends StatefulWidget {

  ProofVerificationView({Key? key,
  }) : super(key: key);

  @override
  _ProofVerificationViewState createState() => _ProofVerificationViewState();
}

class _ProofVerificationViewState extends State<ProofVerificationView> with SingleTickerProviderStateMixin{
  AnimationController? _animationController;
  Tween<double> _tween = Tween(begin: 0.1, end: 1);

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
                              AppLocalizations.of(context)!.proofVerificationViewFirstText,
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
                                AppLocalizations.of(context)!.idPassportWorkpermitFrontside,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                            ),
                          )
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(1, 0),
                        end: Offset.zero,
                      ).animate(_animationController),
                      child: FadeTransition(
                        opacity: _animationController,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: DottedBorder(
                            borderType: BorderType.RRect,

                            color: Color(0xff25bfa0),
                            radius: Radius.circular(12),
                            //padding: const EdgeInsets.all(0),
                            dashPattern: [16, 4],
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              child: SizedBox(
                                width: double.infinity,
                                height: 62,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        AppLocalizations.of(context)!.uploadTransferReceipt,
                                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400)
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 4.0),
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: GradientIcon(
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
                                      ),
                                    ),
                                  ],
                                ),
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
                                AppLocalizations.of(context)!.idPassportWorkpermitBackside,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                            ),
                          )
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(1, 0),
                        end: Offset.zero,
                      ).animate(_animationController),
                      child: FadeTransition(
                        opacity: _animationController,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: DottedBorder(
                            borderType: BorderType.RRect,

                            color: Color(0xff25bfa0),
                            radius: Radius.circular(12),
                            //padding: const EdgeInsets.all(0),
                            dashPattern: [16, 4],
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              child: SizedBox(
                                width: double.infinity,
                                height: 62,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        AppLocalizations.of(context)!.uploadTransferReceipt,
                                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400)
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 4.0),
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: GradientIcon(
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
                                      ),
                                    ),
                                  ],
                                ),
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
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: Offset(1, 0),
                          end: Offset.zero,
                        ).animate(_animationController),
                        child: FadeTransition(
                            opacity: _animationController,
                            child: ButtonWidget(buttonText: AppLocalizations.of(context)!.upload)
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
                            AppLocalizations.of(context)!.proofVerificationViewFirstText,
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
                              AppLocalizations.of(context)!.idPassportWorkpermitFrontside,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                          ),
                        )
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(-1, 0),
                      end: Offset.zero,
                    ).animate(_animationController),
                    child: FadeTransition(
                      opacity: _animationController,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: DottedBorder(
                          borderType: BorderType.RRect,

                          color: Color(0xff25bfa0),
                          radius: Radius.circular(12),
                          //padding: const EdgeInsets.all(0),
                          dashPattern: [16, 4],
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            child: SizedBox(
                              width: double.infinity,
                              height: 62,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      AppLocalizations.of(context)!.uploadTransferReceipt,
                                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400)
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: GradientIcon(
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
                                  ),
                                ],
                              ),
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
                              AppLocalizations.of(context)!.idPassportWorkpermitBackside,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                          ),
                        )
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(-1, 0),
                      end: Offset.zero,
                    ).animate(_animationController),
                    child: FadeTransition(
                      opacity: _animationController,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: DottedBorder(
                          borderType: BorderType.RRect,

                          color: Color(0xff25bfa0),
                          radius: Radius.circular(12),
                          //padding: const EdgeInsets.all(0),
                          dashPattern: [16, 4],
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            child: SizedBox(
                              width: double.infinity,
                              height: 62,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      AppLocalizations.of(context)!.uploadTransferReceipt,
                                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400)
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: GradientIcon(
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
                                  ),
                                ],
                              ),
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
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(-1, 0),
                        end: Offset.zero,
                      ).animate(_animationController),
                      child: FadeTransition(
                          opacity: _animationController,
                          child: ButtonWidget(buttonText: AppLocalizations.of(context)!.upload)
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


