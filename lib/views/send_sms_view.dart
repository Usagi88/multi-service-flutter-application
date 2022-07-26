import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fpapp/classes/gradient_icon.dart';
import 'package:fpapp/classes/gradient_text.dart';
import 'package:fpapp/provider/locale_provider.dart';
import 'package:fpapp/widgets/banner_widget.dart';
import 'package:fpapp/widgets/button_widget.dart';
import 'package:fpapp/widgets/navbar_with_back_button_widget.dart';
import 'package:fpapp/widgets/sidemenu_widget.dart';
import 'dart:math' as math;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';
import 'package:fpapp/widgets/textfield_text_widget.dart';
import 'package:provider/provider.dart';

class SendSmsView extends StatefulWidget {
  const SendSmsView({Key? key}) : super(key: key);

  @override
  State<SendSmsView> createState() => _SendSmsViewState();
}

class _SendSmsViewState extends State<SendSmsView> with SingleTickerProviderStateMixin {
  final FlutterContactPicker _contactPicker = new FlutterContactPicker();
  Contact? _contact;
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
                        child: Row(
                          children: [
                            SlideTransition(
                              position: Tween<Offset>(
                                begin: Offset(1, 0),
                                end: Offset.zero,
                              ).animate(_animationController),
                              child: FadeTransition(
                                opacity: _animationController,
                                child: Container(
                                  width: MediaQuery.of(context).size.width > 350 ? 180 : 160,
                                  padding: const EdgeInsets.only(left: 10.0),

                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    AppLocalizations.of(context)!.sendSmsFirstText,
                                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600, fontWeight: FontWeight.w400),

                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            SlideTransition(
                              position: Tween<Offset>(
                                begin: Offset(-1, 0),
                                end: Offset.zero,
                              ).animate(_animationController),
                              child: FadeTransition(
                                opacity: _animationController,
                                child: Container(
                                  width: MediaQuery.of(context).size.width > 350 ? 135 : 100,
                                  constraints: BoxConstraints(
                                      minHeight: 68
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                                  child: Row(
                                    children: [
                                      Container(
                                        child: GradientIcon(
                                          FontAwesomeIcons.solidEnvelope,
                                          MediaQuery.of(context).size.width > 350 ? 26.0 : 24.0,
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
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width > 350 ? 12.0 : 12.0,
                                      ),
                                      Container(
                                        width: 1,
                                        height: 44,
                                        color: Colors.grey.shade300,
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width > 350 ? 6.0 : 2.0,
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                              child: GradientText(
                                                  text: '2',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: MediaQuery.of(context).size.width > 350 ? 22 : 20,
                                                      fontWeight: FontWeight.w700,
                                                      fontFamily: 'Roboto'
                                                  ),
                                                  gradient: const LinearGradient(
                                                      colors: [
                                                        Color(0xff3AC170),
                                                        Color(0xff25BFA3),
                                                      ],
                                                      transform: GradientRotation(math.pi * 0.50)
                                                  )
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.center,

                                              child: GradientText(
                                                  text: 'sms',
                                                  style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.w700,fontFamily: 'Roboto'),
                                                  gradient: const LinearGradient(
                                                      colors: [
                                                        Color(0xff3AC170),
                                                        Color(0xff25BFA3),
                                                      ],
                                                      transform: GradientRotation(math.pi * 0.50)
                                                  )
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
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
                                  child: Text(AppLocalizations.of(context)!.selectPackage,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)
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
                              hintText: AppLocalizations.of(context)!.selectPackage,

                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: ScaleTransition(
                            scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutBack)),
                            child: Container(
                              width: 129,
                              height: 35,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),

                              ),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    primary: Colors.white,
                                    minimumSize: Size(129, 35),
                                  ),
                                  onPressed: () {

                                  },
                                  child: Text(AppLocalizations.of(context)!.buySMS,style: TextStyle(fontSize: 14, color: Colors.white,fontWeight: FontWeight.w400)),
                                )
                            ),
                          ),
                        ),
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
                                  child: Text(AppLocalizations.of(context)!.senderID,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)
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
                                hintText: AppLocalizations.of(context)!.senderID
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: ScaleTransition(
                            scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutBack)),
                            child: Container(
                              width: 129,
                              height: 35,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),

                              ),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    primary: Colors.white,
                                    minimumSize: Size(129, 35),
                                  ),
                                  onPressed: () {

                                  },
                                  child: Text(AppLocalizations.of(context)!.getSenderID,style: TextStyle(fontSize: 14, color: Colors.white,fontWeight: FontWeight.w400)),
                                )
                            ),
                          ),
                        ),
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
                                  child: Text(AppLocalizations.of(context)!.recipients,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)
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
                                //height: MediaQuery.of(context).size.height * 0.053,
                                height: 46,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  color: Color(0xfff2f2f2),
                                ),
                                child: TextFormField(
                                  key: Key(_contact.toString()),
                                  initialValue: _contact.toString().replaceAll(new RegExp(r'[^0-9]'),''),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],

                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10.0),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                    ),
                                    // Only numbers can be entered
                                    hintText: AppLocalizations.of(context)!.recipients,

                                  ),
                                ),
                              )
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: ScaleTransition(
                            scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutBack)),
                            child: Container(
                              width: 129,
                              height: 35,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),

                              ),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  minimumSize: Size(129, 35),
                                ),
                                onPressed: () async {
                                  Contact? contact = await _contactPicker.selectContact();
                                  setState(() {
                                    _contact = contact;
                                  });
                                },
                                child: Text(AppLocalizations.of(context)!.pickContact,style: TextStyle(fontSize: 14, color: Colors.white,fontWeight: FontWeight.w400)),
                              ),
                            ),
                          ),
                        ),
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
                                  child: Text(AppLocalizations.of(context)!.message,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)
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
                            child: Container(
                              //width: MediaQuery.of(context).size.width > 350 ? 364 : 280,
                              constraints: BoxConstraints(
                                  maxWidth: 364
                              ),
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.all(Radius.circular(10)),

                              ),
                              child: TextField(
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(right: 10.0,left: 10.0,top: 20.0,bottom: 4.0),
                                  hintText: AppLocalizations.of(context)!.message,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey.shade200,),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
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
                              buttonText: AppLocalizations.of(context)!.login,
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
                            child: Container(
                              width: double.infinity,
                              height: 77,
                              alignment: Alignment.center,
                              child: Text(
                                AppLocalizations.of(context)!.sendSMSLastText,
                                style: TextStyle(fontSize: 14,color: Colors.grey.shade600, fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
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
                      child: Row(
                        children: [
                          SlideTransition(
                            position: Tween<Offset>(
                              begin: Offset(-1, 0),
                              end: Offset.zero,
                            ).animate(_animationController),
                            child: FadeTransition(
                              opacity: _animationController,
                              child: Container(
                                width: MediaQuery.of(context).size.width > 350 ? 135 : 100,
                                constraints: BoxConstraints(
                                    minHeight: 68
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                                child: Row(
                                  children: [
                                    Container(
                                      child: GradientIcon(
                                        FontAwesomeIcons.solidEnvelope,
                                        MediaQuery.of(context).size.width > 350 ? 26.0 : 24.0,
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
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width > 350 ? 12.0 : 12.0,
                                    ),
                                    Container(
                                      width: 1,
                                      height: 44,
                                      color: Colors.grey.shade300,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width > 350 ? 6.0 : 2.0,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                            child: GradientText(
                                                text: '2',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: MediaQuery.of(context).size.width > 350 ? 22 : 20,
                                                    fontWeight: FontWeight.w700),
                                                gradient: const LinearGradient(
                                                    colors: [
                                                      Color(0xff3AC170),
                                                      Color(0xff25BFA3),
                                                    ],
                                                    transform: GradientRotation(math.pi * 0.50)
                                                )
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.center,

                                            child: GradientText(
                                                text: 'sms',
                                                style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.w700),
                                                gradient: const LinearGradient(
                                                    colors: [
                                                      Color(0xff3AC170),
                                                      Color(0xff25BFA3),
                                                    ],
                                                    transform: GradientRotation(math.pi * 0.50)
                                                )
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          SlideTransition(
                            position: Tween<Offset>(
                              begin: Offset(1, 0),
                              end: Offset.zero,
                            ).animate(_animationController),
                            child: FadeTransition(
                              opacity: _animationController,
                              child: Container(
                                width: MediaQuery.of(context).size.width > 350 ? 180 : 160,
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  AppLocalizations.of(context)!.sendSmsFirstText,
                                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600, fontWeight: FontWeight.w400),

                                ),
                              ),
                            ),
                          )
                        ],
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
                                child: Text(AppLocalizations.of(context)!.selectPackage,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)
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
                            hintText: 'Field Name',
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: ScaleTransition(
                          scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutBack)),
                          child: Container(
                            width: 129,
                            height: 35,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),

                            ),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  minimumSize: Size(129, 35),
                                ),
                                onPressed: () {

                                },
                                child: Text(AppLocalizations.of(context)!.buySMS,style: TextStyle(fontSize: 14, color: Colors.white,fontWeight: FontWeight.w400)),
                              )

                          ),
                        ),
                      ),
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
                                child: Text(AppLocalizations.of(context)!.senderID,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)
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
                            hintText: 'Field Name',
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: ScaleTransition(
                          scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutBack)),
                          child: Container(
                            width: 129,
                            height: 35,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),

                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                primary: Colors.white,
                                minimumSize: Size(129, 35),
                              ),
                              onPressed: () {

                              },
                              child: Text(AppLocalizations.of(context)!.getSenderID,style: TextStyle(fontSize: 14, color: Colors.white,fontWeight: FontWeight.w400)),
                            )

                          ),
                        ),
                      ),
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
                                child: Text(AppLocalizations.of(context)!.recipients,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)
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
                              //height: MediaQuery.of(context).size.height * 0.053,
                              height: 46,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                color: Color(0xfff2f2f2),
                              ),
                              child: TextFormField(
                                key: Key(_contact.toString()),
                                initialValue: _contact.toString().replaceAll(new RegExp(r'[^0-9]'),''),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],

                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10.0),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  // Only numbers can be entered
                                  hintText: AppLocalizations.of(context)!.recipients,

                                ),
                              ),
                            )
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: ScaleTransition(
                          scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutBack)),
                          child: Container(
                            width: 129,
                            height: 35,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),

                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                primary: Colors.white,
                                minimumSize: Size(129, 35),
                              ),
                              onPressed: () async {
                                Contact? contact = await _contactPicker.selectContact();
                                setState(() {
                                  _contact = contact;
                                });
                              },
                              child: Text(AppLocalizations.of(context)!.pickContact,style: TextStyle(fontSize: 14, color: Colors.white,fontWeight: FontWeight.w400)),
                            ),
                          ),
                        ),
                      ),
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
                                child: Text(AppLocalizations.of(context)!.message,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)
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
                          child: Container(
                            //width: MediaQuery.of(context).size.width > 350 ? 364 : 280,
                            constraints: BoxConstraints(
                                maxWidth: 364
                            ),
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.all(Radius.circular(10)),

                            ),
                            child: TextField(
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(right: 10.0,left: 10.0,top: 20.0,bottom: 4.0),
                                hintText: AppLocalizations.of(context)!.message,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey.shade200,),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
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
                            buttonText: AppLocalizations.of(context)!.login,
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
                          child: Container(
                            width: double.infinity,
                            height: 77,
                            alignment: Alignment.center,
                            child: Text(
                              AppLocalizations.of(context)!.sendSMSLastText,
                              style: TextStyle(fontSize: 14,color: Colors.grey.shade600, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
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
}
