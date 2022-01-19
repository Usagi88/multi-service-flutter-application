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

class CashInView extends StatefulWidget {
  final bool? dhiraagu;
  final bool? ooredoo;
  CashInView({Key? key,
    this.dhiraagu,
    this.ooredoo
  }) : super(key: key);

  @override
  _CashInViewState createState() => _CashInViewState();
}

class _CashInViewState extends State<CashInView> with SingleTickerProviderStateMixin{
  AnimationController? _animationController;
  Tween<double> _tween = Tween(begin: 0.1, end: 1);
  bool? _checked = false;

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
      return Scaffold(
          appBar: NavbarWithBackButton(),
          drawer: SideMenu(),
          body: SafeArea(
              child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DefaultTabController(
                        length: 2,
                        initialIndex: (widget.dhiraagu != false) ? 0 : ( widget.ooredoo != false) ? 1 : (widget.dhiraagu! && widget.ooredoo! == null) ? 0 : 0,
                        child: Container(
                          height: MediaQuery.of(context).size.height - (height + safePadding),
                          child: Stack(
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
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  top: 170,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                    child: SlideTransition(
                                      position: Tween<Offset>(
                                        begin: Offset(2, 0),
                                        end: Offset.zero,
                                      ).animate(_animationController),
                                      child: FadeTransition(
                                        opacity: _animationController,
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
                                          child: TabBar(
                                              labelColor: Colors.white,
                                              unselectedLabelColor: Colors.black,
                                              indicatorSize: TabBarIndicatorSize.label,
                                              labelPadding: const EdgeInsets.all(0),
                                              indicator: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(10),),
                                                gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                                              ),
                                              tabs: [
                                                Tab(
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Text(AppLocalizations.of(context)!.dhiraagu, style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,)),
                                                  ),
                                                ),
                                                Tab(
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Text(AppLocalizations.of(context)!.ooredoo, style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,)),
                                                  ),
                                                ),
                                              ]
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  top: 230,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height - (height + safePadding + 158),
                                    child: TabBarView(
                                      children: [
                                        //dhiraagu view
                                        SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 10,
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
                                                        child: Text(AppLocalizations.of(context)!.dhiraaguCashInFirstText,
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
                                                child: SlideTransition(
                                                  position: Tween<Offset>(
                                                    begin: Offset(1, 0),
                                                    end: Offset.zero,
                                                  ).animate(_animationController),
                                                  child: FadeTransition(
                                                    opacity: _animationController,
                                                    child: Container(
                                                      height: 46,
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                        gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                                                      ),
                                                      child: TextButton(
                                                        style: TextButton.styleFrom(
                                                          primary: Colors.white,
                                                        ),
                                                        onPressed: () { },
                                                        child: Text(
                                                          AppLocalizations.of(context)!.pickContact,
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight: FontWeight.w400
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 7,
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
                                                            AppLocalizations.of(context)!.mobileNumber,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)
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
                                                      hintText: AppLocalizations.of(context)!.mobileNumber,
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
                                                    child: ButtonWidget(
                                                      buttonText: AppLocalizations.of(context)!.cashIn,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                            ],
                                          ),
                                        ),

                                        //OOREDOO VIEW
                                        SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 10,
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
                                                        child: Text(AppLocalizations.of(context)!.ooredooCashInFirstText,
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
                                                child: SlideTransition(
                                                  position: Tween<Offset>(
                                                    begin: Offset(1, 0),
                                                    end: Offset.zero,
                                                  ).animate(_animationController),
                                                  child: FadeTransition(
                                                    opacity: _animationController,
                                                    child: Container(
                                                      height: 46,
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                        gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                                                      ),
                                                      child: TextButton(
                                                        style: TextButton.styleFrom(
                                                          primary: Colors.white,
                                                        ),
                                                        onPressed: () { },
                                                        child: Text(
                                                          AppLocalizations.of(context)!.pickContact,
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight: FontWeight.w400
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 7,
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
                                                            AppLocalizations.of(context)!.mobileNumber,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)
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
                                                      hintText: AppLocalizations.of(context)!.mobileNumber,
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
                                                    child: ButtonWidget(
                                                      buttonText: AppLocalizations.of(context)!.cashIn,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                            ],
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ]
                          ),
                        ),

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
                    DefaultTabController(
                      length: 2,
                      initialIndex: (widget.dhiraagu != false) ? 0 : ( widget.ooredoo != false) ? 1 : (widget.dhiraagu! && widget.ooredoo! == null) ? 0 : 0,
                      child: Container(
                        height: MediaQuery.of(context).size.height - (height + safePadding),
                        child: Stack(
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
                              Positioned(
                                left: 0,
                                right: 0,
                                top: 170,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                  child: SlideTransition(
                                    position: Tween<Offset>(
                                      begin: Offset(2, 0),
                                      end: Offset.zero,
                                    ).animate(_animationController),
                                    child: FadeTransition(
                                      opacity: _animationController,
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
                                        child: TabBar(
                                            labelColor: Colors.white,
                                            unselectedLabelColor: Colors.black,
                                            indicatorSize: TabBarIndicatorSize.label,
                                            labelPadding: const EdgeInsets.all(0),
                                            indicator: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(10),),
                                              gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                                            ),
                                            tabs: [
                                              Tab(
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(AppLocalizations.of(context)!.dhiraagu, style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400)),
                                                ),
                                              ),
                                              Tab(
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(AppLocalizations.of(context)!.ooredoo, style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400)),
                                                ),
                                              ),
                                            ]
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                top: 230,
                                child: Container(
                                  height: MediaQuery.of(context).size.height - (height + safePadding + 158),
                                  child: TabBarView(
                                    children: [
                                      //dhiraagu view
                                      SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 10,
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
                                                      child: Text(AppLocalizations.of(context)!.dhiraaguCashInFirstText,
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
                                              child: SlideTransition(
                                                position: Tween<Offset>(
                                                  begin: Offset(-1, 0),
                                                  end: Offset.zero,
                                                ).animate(_animationController),
                                                child: FadeTransition(
                                                  opacity: _animationController,
                                                  child: Container(
                                                    height: 46,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                      gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                                                    ),
                                                    child: TextButton(
                                                      style: TextButton.styleFrom(
                                                        primary: Colors.white,
                                                      ),
                                                      onPressed: () { },
                                                      child: Text(
                                                        AppLocalizations.of(context)!.pickContact,
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w400
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 7,
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
                                                          AppLocalizations.of(context)!.mobileNumber,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)
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
                                                    hintText: AppLocalizations.of(context)!.mobileNumber,
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
                                                  begin: Offset(2, 0),
                                                  end: Offset.zero,
                                                ).animate(_animationController),
                                                child: FadeTransition(
                                                  opacity: _animationController,
                                                  child: ButtonWidget(
                                                    buttonText: AppLocalizations.of(context)!.cashIn,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            )
                                          ],
                                        ),
                                      ),

                                      //OOREDOO VIEW
                                      SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 10,
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
                                                      child: Text(AppLocalizations.of(context)!.ooredooCashInFirstText,
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
                                              child: SlideTransition(
                                                position: Tween<Offset>(
                                                  begin: Offset(-1, 0),
                                                  end: Offset.zero,
                                                ).animate(_animationController),
                                                child: FadeTransition(
                                                  opacity: _animationController,
                                                  child: Container(
                                                    height: 46,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                      gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                                                    ),
                                                    child: TextButton(
                                                      style: TextButton.styleFrom(
                                                        primary: Colors.white,
                                                      ),
                                                      onPressed: () { },
                                                      child: Text(
                                                        AppLocalizations.of(context)!.pickContact,
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w400
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 7,
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
                                                          AppLocalizations.of(context)!.mobileNumber,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)
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
                                                    hintText: AppLocalizations.of(context)!.mobileNumber,
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
                                                      begin: Offset(2, 0),
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
                                                  begin: Offset(2, 0),
                                                  end: Offset.zero,
                                                ).animate(_animationController),
                                                child: FadeTransition(
                                                  opacity: _animationController,
                                                  child: ButtonWidget(
                                                    buttonText: AppLocalizations.of(context)!.cashIn,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ]
                        ),
                      ),

                    ),




                  ],
                )
            )
        )
    );
  }
}


