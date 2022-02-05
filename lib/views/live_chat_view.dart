import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fpapp/classes/gradient_text.dart';
import 'package:fpapp/provider/locale_provider.dart';
import 'package:fpapp/widgets/navbar_widget.dart';
import 'package:fpapp/widgets/navbar_with_back_button_widget.dart';
import 'package:fpapp/widgets/receive_message_widget.dart';
import 'package:fpapp/widgets/send_message_widget.dart';
import 'package:fpapp/widgets/sidemenu_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:math' as math;

class LiveChatView extends StatefulWidget {
  const LiveChatView({Key? key}) : super(key: key);

  @override
  _LiveChatViewState createState() => _LiveChatViewState();
}

class _LiveChatViewState extends State<LiveChatView> with SingleTickerProviderStateMixin{
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
    double navBarHeight = Navbar().preferredSize.height;
    var safePadding = MediaQuery.of(context).padding.top;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _portraitModeOnly(context, navBarHeight, safePadding, _animationController, _tween, language);
  }

  //portrait
  Scaffold _portraitModeOnly(BuildContext context, navBarHeight, safePadding, _animationController, _tween, language) {
    if (language.locale.toString() == 'dv' || language.locale.toString() == 'ar'){
      return Scaffold(
          appBar: NavbarWithBackButton(),
          drawer: SideMenu(),
          body: SafeArea(
              child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children:[
                            SlideTransition(
                              position: Tween<Offset>(
                                begin: Offset(1, 0),
                                end: Offset.zero,
                              ).animate(_animationController),
                              child: FadeTransition(
                                opacity: _animationController,
                                child: Text(
                                  AppLocalizations.of(context)!.liveChat,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 1,
                              child: SlideTransition(
                                position: Tween<Offset>(
                                  begin: Offset(-1, 0),
                                  end: Offset.zero,
                                ).animate(_animationController),
                                child: FadeTransition(
                                  opacity: _animationController,
                                  child: const SizedBox(
                                    height: 1.0,
                                    child: const DecoratedBox(
                                      decoration: const BoxDecoration(
                                          color: Color(0xffcccccc)
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SlideTransition(
                              position: Tween<Offset>(
                                begin: Offset(-1, 0),
                                end: Offset.zero,
                              ).animate(_animationController),
                              child: FadeTransition(
                                opacity: _animationController,
                                child: Container(
                                  width: 46,
                                  height: 46,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    gradient: LinearGradient(
                                      colors: [
                                        const Color(0xff3AC170),
                                        const Color(0xff25BFA3),
                                      ],
                                    ),
                                  ),
                                  child: Icon(FontAwesomeIcons.phoneAlt, size: 24,color: Colors.white,),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0,right: 20.0,bottom: 20.0),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height - 65 - 110 - navBarHeight - safePadding,
                          //color: Colors.grey,
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10.0,
                                ),
                                SendMessage(message: "Hello", time: "19:12",),
                                ReceiveMessage(message: "In order for user to deposit into fahipay you have to ",time: "19:12",),
                                SendMessage(message: "Hello, i need your help on Hello, i need your help on Hello, i need your help on Hello, i need your help on Hello, i need your help on", time: "19:12",),
                                SendMessage(message: "Hello, i need your help on deposit", time: "19:12",),
                                SizedBox(
                                  height: 10.0,
                                ),
                              ],
                            ),
                          ),


                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: SlideTransition(
                                position: Tween<Offset>(
                                  begin: Offset(1, 0),
                                  end: Offset.zero,
                                ).animate(_animationController),
                                child: FadeTransition(
                                  opacity: _animationController,
                                  child: Container(
                                    //height: MediaQuery.of(context).size.height * 0.053,
                                    height: 46,
                                    //width: 318,
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
                                        suffixIcon: IconButton(
                                          onPressed: () {},
                                          icon: Icon(FontAwesomeIcons.camera,color: Colors.grey.shade400,),
                                        ),
                                        // Only numbers can be entered
                                        hintText: AppLocalizations.of(context)!.typeYourMessageHere,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 6.0),
                              child: SlideTransition(
                                position: Tween<Offset>(
                                  begin: Offset(-1, 0),
                                  end: Offset.zero,
                                ).animate(_animationController),
                                child: FadeTransition(
                                  opacity: _animationController,
                                  child: IconButton(
                                    padding: const EdgeInsets.all(0),
                                    onPressed: () {},
                                    icon: Container(
                                      width: 46,
                                      height: 46,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        gradient: LinearGradient(
                                          colors: [
                                            const Color(0xff3AC170),
                                            const Color(0xff25BFA3),
                                          ],
                                        ),
                                      ),
                                      child: Icon(FontAwesomeIcons.locationArrow, size: 22,color: Colors.white,),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )

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
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children:[
                          SlideTransition(
                            position: Tween<Offset>(
                              begin: Offset(-1, 0),
                              end: Offset.zero,
                            ).animate(_animationController),
                            child: FadeTransition(
                              opacity: _animationController,
                              child: Text(
                                AppLocalizations.of(context)!.liveChat,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 1,
                            child: SlideTransition(
                              position: Tween<Offset>(
                                begin: Offset(2, 0),
                                end: Offset.zero,
                              ).animate(_animationController),
                              child: FadeTransition(
                                opacity: _animationController,
                                child: const SizedBox(
                                  height: 1.0,
                                  child: const DecoratedBox(
                                    decoration: const BoxDecoration(
                                        color: Color(0xffcccccc)
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SlideTransition(
                            position: Tween<Offset>(
                              begin: Offset(2, 0),
                              end: Offset.zero,
                            ).animate(_animationController),
                            child: FadeTransition(
                              opacity: _animationController,
                              child: Container(
                                width: 46,
                                height: 46,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  gradient: LinearGradient(
                                    colors: [
                                      const Color(0xff3AC170),
                                      const Color(0xff25BFA3),
                                    ],
                                  ),
                                ),
                                child: Icon(FontAwesomeIcons.phoneAlt, size: 24,color: Colors.white,),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0,right: 20.0,bottom: 20.0),
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height - 65 - 110 - navBarHeight - safePadding,
                        //color: Colors.grey,
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10.0,
                              ),
                              SendMessage(message: "Hello", time: "19:12",),
                              ReceiveMessage(message: "In order for user to deposit into fahipay you have to ",time: "19:12",),
                              SendMessage(message: "Hello, i need your help on Hello, i need your help on Hello, i need your help on Hello, i need your help on Hello, i need your help on", time: "19:12",),
                              SendMessage(message: "Hello, i need your help on deposit", time: "19:12",),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Container(
                                  width: double.infinity,

                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                                    children: [
                                      Container(
                                        height: 46,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
                                          gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(AppLocalizations.of(context)!.paymentRequest, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),)
                                      ),
                                      SizedBox(height: 6,),
                                      GradientText(
                                          text: "10.00",
                                          style: TextStyle(color: Colors.white,fontSize: 32,fontWeight: FontWeight.w700, fontFamily: 'Roboto'),
                                          gradient: const LinearGradient(
                                              colors: [
                                                Color(0xff3AC170),
                                                Color(0xff25BFA3),
                                              ],
                                              transform: GradientRotation(math.pi * 0.50)
                                          )
                                      ),
                                      SizedBox(height: 10,),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                        child: Row(
                                          children: [
                                            Text(AppLocalizations.of(context)!.from + ": ", style: TextStyle(fontWeight: FontWeight.w600),),
                                            GradientText(
                                                text: "EsfiyaNet",
                                                style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800, fontFamily: 'Roboto'),
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
                                      SizedBox(height: 10,),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                        child: Row(
                                          children: [
                                            Text(AppLocalizations.of(context)!.note + ": ",style: TextStyle(fontWeight: FontWeight.w600),),
                                            Text("Test payment", style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Roboto')),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10,),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                        child: Row(
                                          children: [
                                            Text(AppLocalizations.of(context)!.expiresIn + ": ",style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600)),
                                            Text("2 days", style: TextStyle(fontWeight: FontWeight.w800, color: Colors.red)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 20,),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                                height: 46,

                                                child: TextButton(
                                                  style: TextButton.styleFrom(
                                                    backgroundColor: Colors.redAccent,
                                                      primary: Colors.white,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0)),

                                                      ),
                                                  ),
                                                  onPressed: () => {

                                                  },
                                                  child: Text(
                                                    AppLocalizations.of(context)!.reject,
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                            ),
                                          ),

                                          Expanded(
                                            child: Container(
                                                height: 46,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.0),),
                                                  gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                                                ),
                                                child: TextButton(
                                                  style: TextButton.styleFrom(
                                                    primary: Colors.white,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.0)),

                                                    ),
                                                  ),
                                                  onPressed: () {

                                                  },
                                                  child: Text(AppLocalizations.of(context)!.ok, style: TextStyle(color: Colors.white),),
                                                ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                            ],
                          ),
                        ),


                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: SlideTransition(
                              position: Tween<Offset>(
                                begin: Offset(-1, 0),
                                end: Offset.zero,
                              ).animate(_animationController),
                              child: FadeTransition(
                                opacity: _animationController,
                                child: Container(
                                  //height: MediaQuery.of(context).size.height * 0.053,
                                  height: 46,
                                  //width: 318,
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
                                      suffixIcon: IconButton(
                                        onPressed: () {},
                                        icon: Icon(FontAwesomeIcons.camera,color: Colors.grey.shade400,),
                                      ),
                                      // Only numbers can be entered
                                      hintText: AppLocalizations.of(context)!.typeYourMessageHere,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 6.0),
                            child: SlideTransition(
                              position: Tween<Offset>(
                                begin: Offset(2, 0),
                                end: Offset.zero,
                              ).animate(_animationController),
                              child: FadeTransition(
                                opacity: _animationController,
                                child: IconButton(
                                  padding: const EdgeInsets.all(0),
                                  onPressed: () {},
                                  icon: Container(
                                    width: 56,
                                    height: 46,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      gradient: LinearGradient(
                                        colors: [
                                          const Color(0xff3AC170),
                                          const Color(0xff25BFA3),
                                        ],
                                      ),
                                    ),
                                    child: Icon(FontAwesomeIcons.locationArrow, size: 22,color: Colors.white,),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )

                  ],
                )
            )
        )
    );
  }

}



