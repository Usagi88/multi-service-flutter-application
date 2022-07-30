import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fpapp/provider/locale_provider.dart';
import 'package:fpapp/widgets/button_widget.dart';
import 'package:fpapp/widgets/clickable_link_widget.dart';
import 'package:fpapp/widgets/navbar_with_back_button_widget.dart';
import 'package:fpapp/widgets/sidemenu_widget.dart';
import 'package:provider/provider.dart';
import '/widgets/textfield_number_widget.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> with SingleTickerProviderStateMixin{
  AnimationController? _animationController;
  Tween<double> _tween = Tween(begin: 0.1, end: 1);

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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _portraitModeOnly(context, _animationController, _tween, language);
  }
}

//portrait mode
Scaffold _portraitModeOnly(BuildContext context, _animationController, _tween, language) {
  if (language.locale.toString() == 'dv' || language.locale.toString() == 'ar'){
    return Scaffold(
      appBar: NavbarWithBackButton(),
      drawer: SideMenu(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(//not putting padding on column because logo image requires different padding
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20.0),
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(0, -1),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                    opacity: _animationController,
                    child: Container(
                      //height: 150,
                      height: MediaQuery.of(context).size.height * 0.35,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/forgot-password.png'),
                          fit: BoxFit.fill,
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
                padding: const EdgeInsets.only(right:8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(1, 0),
                      end: Offset.zero,
                    ).animate(_animationController),
                    child: FadeTransition(
                      opacity: _animationController,
                      child: Container(
                        //height: 150,
                        height: 34,
                        width: 152,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/logo-placeholder.png'),
                            fit: BoxFit.fill,
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
                padding: const EdgeInsets.only(right:20.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(1, 0),
                      end: Offset.zero,
                    ).animate(_animationController),
                    child: FadeTransition(
                      opacity: _animationController,
                      child: Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width * 0.50,
                        color: Color(0xffE0E0E0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(right:20.0),
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
                        AppLocalizations.of(context)!.resetPassword,
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700
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
                padding: EdgeInsets.symmetric(horizontal:20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(1, 0),
                      end: Offset.zero,
                    ).animate(_animationController),
                    child: FadeTransition(
                      opacity: _animationController,
                      child: Text(
                        AppLocalizations.of(context)!.resetPasswordSecondText,
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400
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
                padding: EdgeInsets.symmetric(horizontal:20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(2, 0),
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
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal:20.0),
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(1, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                    opacity: _animationController,
                    child: ButtonWidget(
                      buttonText: AppLocalizations.of(context)!.requestReset,

                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal:20.0),
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(2, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                    opacity: _animationController,
                    child: ClickableLink(
                      clickableLinkText: AppLocalizations.of(context)!.alreadyHaveCode,
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
      ),
    );
  }
  return Scaffold(
    appBar: NavbarWithBackButton(),
    drawer: SideMenu(),
    body: SafeArea(
      child: SingleChildScrollView(
        child: Column(//not putting padding on column because logo image requires different padding
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20.0),
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(0, -1),
                  end: Offset.zero,
                ).animate(_animationController),
                child: FadeTransition(
                  opacity: _animationController,
                  child: Container(
                    //height: 150,
                    height: MediaQuery.of(context).size.height * 0.35,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/forgot-password.png'),
                        fit: BoxFit.fill,
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
              padding: const EdgeInsets.only(left:8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                    opacity: _animationController,
                    child: Container(
                      //height: 150,
                      height: 34,
                      width: 152,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/logo-placeholder.png'),
                          fit: BoxFit.fill,
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
              padding: const EdgeInsets.only(left:20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                    opacity: _animationController,
                    child: Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width * 0.50,
                      color: Color(0xffE0E0E0),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left:20.0),
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
                      AppLocalizations.of(context)!.resetPassword,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700
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
              padding: EdgeInsets.symmetric(horizontal:20.0),
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
                      AppLocalizations.of(context)!.resetPasswordSecondText,
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400
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
              padding: EdgeInsets.symmetric(horizontal:20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(2, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                    opacity: _animationController,
                    child: TextfieldNumberWidget(
                      hintText: 'Mobile Number',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                    opacity: _animationController,
                    child: ButtonWidget(
                        buttonText: AppLocalizations.of(context)!.requestReset,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(2, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                    opacity: _animationController,
                    child: ClickableLink(
                        clickableLinkText: AppLocalizations.of(context)!.alreadyHaveCode,
                    ),
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
    ),
  );
}

