import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpapp/classes/gradient_text.dart';
import 'package:fpapp/provider/locale_provider.dart';
import 'package:provider/provider.dart';
import 'gift_card_button_widget.dart';
import 'dart:math' as math;

class GiftCardWidget extends StatelessWidget {
  bool itunes;
  bool psn;
  bool netflix;
  GiftCardWidget({Key? key,
    required this.itunes,
    required this.psn,
    required this.netflix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var language = Provider.of<LocaleProvider>(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _portraitModeOnly(context, language);
  }

  //portrait mode
  Stack _portraitModeOnly(BuildContext context, language){
    if (language.locale.toString() == 'dv' || language.locale.toString() == 'ar'){
      if(itunes == true && psn != true && netflix != true){//if it is itunes
        return Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                constraints: BoxConstraints(
                    maxWidth: 364
                ),
                //width: MediaQuery.of(context).size.width > 350 ? 364 : 280,
                height: 193,
                padding: EdgeInsets.only(right: 20.0,left: 20.0,top: 20.0, bottom: 0.0),
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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('ITUNES',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, fontFamily: 'Roboto'),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GradientText(
                          text: 'MVR 50',
                          style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400, fontFamily: 'Roboto' ),
                          gradient: const LinearGradient(
                              colors: [
                                Color(0xff3AC170),
                                Color(0xff25BFA3),
                              ],
                              transform: GradientRotation(math.pi * 0.50)
                          )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0,bottom: 8.0),
                      child: Divider(
                        color: Colors.grey.shade600,
                      ),
                    ),
                    Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                GiftCardButtonWidget(
                                  //buttonWidth: MediaQuery.of(context).size.width > 350 ? 76 : 56,
                                  buttonHeight: 28,
                                  buttonText: '\$2',
                                  available: true,
                                  selected: true,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                GiftCardButtonWidget(
                                  //buttonWidth: MediaQuery.of(context).size.width > 350 ? 76 : 56,
                                  buttonHeight: 28,
                                  buttonText: '\$5',
                                  available: false,
                                  selected: false,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                GiftCardButtonWidget(
                                  // buttonWidth: MediaQuery.of(context).size.width > 350 ? 76 : 56,
                                  buttonHeight: 28,
                                  buttonText: '\$10',
                                  available: false,
                                  selected: false,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                GiftCardButtonWidget(
                                  //buttonWidth: MediaQuery.of(context).size.width > 350 ? 76 : 56,
                                  buttonHeight: 28,
                                  buttonText: '\$15',
                                  available: false,
                                  selected: false,
                                ),

                              ],
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Row(
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GiftCardButtonWidget(
                                  //buttonWidth: MediaQuery.of(context).size.width > 350 ? 76 : 56,
                                  buttonHeight: 28,
                                  buttonText: '\$25',
                                  available: true,
                                  selected: false,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                GiftCardButtonWidget(
                                  //buttonWidth: MediaQuery.of(context).size.width > 350 ? 76 : 56,
                                  buttonHeight: 28,
                                  buttonText: '\$50',
                                  available: false,
                                  selected: false,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                GiftCardButtonWidget(
                                  //buttonWidth: MediaQuery.of(context).size.width > 350 ? 76 : 56,
                                  buttonHeight: 28,
                                  buttonText: '\$100',
                                  available: false,
                                  selected: false,
                                )
                              ],
                            ),
                          ],
                        )

                    )
                  ],
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width >= 364 ? 190 : MediaQuery.of(context).size.width * 0.60,
              top: 165,
              child: Container(
                width: MediaQuery.of(context).size.width > 364 ? 133 : 90,
                height: 46,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                ),
                child: Text('BUY',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, color: Colors.white, fontFamily: 'Roboto'),),
              ),
            ),
          ],
        );
      }else if(psn == true && itunes != true && netflix != true){//if it is psn
        return Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                //width: MediaQuery.of(context).size.width > 320 ? 364 : 280,
                constraints: BoxConstraints(
                    maxWidth: 364
                ),
                height: 193,
                padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 20.0, bottom: 0.0),
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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('PLAYSTATION',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, fontFamily: 'Roboto'),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GradientText(
                          text: 'MVR 225',
                          style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400, fontFamily: 'Roboto'),
                          gradient: const LinearGradient(
                              colors: [
                                Color(0xff3AC170),
                                Color(0xff25BFA3),
                              ],
                              transform: GradientRotation(math.pi * 0.50)
                          )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0,bottom: 8.0),
                      child: Divider(
                        color: Colors.grey.shade600,
                      ),
                    ),
                    Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                GiftCardButtonWidget(
                                  //buttonWidth: MediaQuery.of(context).size.width > 350 ? 76 : 56,
                                  buttonHeight: 28,
                                  buttonText: '\$10',
                                  available: true,
                                  selected: true,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                GiftCardButtonWidget(
                                  //buttonWidth: MediaQuery.of(context).size.width > 350 ? 76 : 56,
                                  buttonHeight: 28,
                                  buttonText: '\$20',
                                  available: false,
                                  selected: false,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                GiftCardButtonWidget(
                                  //buttonWidth: MediaQuery.of(context).size.width > 350 ? 76 : 56,
                                  buttonHeight: 28,
                                  buttonText: '\$24.99',
                                  available: false,
                                  selected: false,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                GiftCardButtonWidget(
                                  //buttonWidth: MediaQuery.of(context).size.width > 350 ? 76 : 56,
                                  buttonHeight: 28,
                                  buttonText: '\$25',
                                  available: false,
                                  selected: false,
                                ),

                              ],
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Row(
                              children: [
                                GiftCardButtonWidget(
                                  //buttonWidth: MediaQuery.of(context).size.width > 350 ? 76 : 56,
                                  buttonHeight: 28,
                                  buttonText: '\$50',
                                  available: true,
                                  selected: false,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                GiftCardButtonWidget(
                                  //buttonWidth: MediaQuery.of(context).size.width > 350 ? 76 : 56,
                                  buttonHeight: 28,
                                  buttonText: '\$59.99',
                                  available: false,
                                  selected: false,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                GiftCardButtonWidget(
                                  //buttonWidth: MediaQuery.of(context).size.width > 350 ? 76 : 56,
                                  buttonHeight: 28,
                                  buttonText: '\$100',
                                  available: false,
                                  selected: false,
                                )
                              ],
                            ),
                          ],
                        )

                    )
                  ],
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width >= 364 ? 190 : MediaQuery.of(context).size.width * 0.60,
              top: 165,
              child: Container(
                width: MediaQuery.of(context).size.width > 364 ? 133 : 90,
                height: 46,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                ),
                child: Text('BUY',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, color: Colors.white, fontFamily: 'Roboto'),),
              ),
            ),
          ],
        );
      }else if(netflix == true && psn != true && itunes != true){//if it is netflix
        return Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                //width: MediaQuery.of(context).size.width > 320 ? 364 : 280,
                height: 193,
                constraints: BoxConstraints(
                    maxWidth: 364
                ),
                padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 20.0, bottom: 0.0),
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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('NETFLIX',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, fontFamily: 'Roboto'),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GradientText(
                          text: 'MVR 660',
                          style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400, fontFamily: 'Roboto'),
                          gradient: const LinearGradient(
                              colors: [
                                Color(0xff3AC170),
                                Color(0xff25BFA3),
                              ],
                              transform: GradientRotation(math.pi * 0.50)
                          )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0,bottom: 8.0),
                      child: Divider(
                        color: Colors.grey.shade600,
                      ),
                    ),
                    Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                GiftCardButtonWidget(
                                  //buttonWidth: MediaQuery.of(context).size.width > 350 ? 76 : 56,
                                  buttonHeight: 28,
                                  buttonText: '\$30',
                                  available: true,
                                  selected: true,
                                )
                              ],
                            )
                          ],
                        )

                    )
                  ],
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width >= 364 ? 190 : MediaQuery.of(context).size.width * 0.60,
              top: 165,
              child: Container(
                width: MediaQuery.of(context).size.width > 364 ? 133 : 90,
                height: 46,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                ),
                child: Text('BUY',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, color: Colors.white, fontFamily: 'Roboto'),),
              ),
            ),
          ],
        );
      }else{//if nothing
        return Stack();
      }
    }
    if(itunes == true && psn != true && netflix != true){//if it is itunes
      return Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 364
              ),
              //width: MediaQuery.of(context).size.width > 350 ? 364 : 280,
              height: 193,
              padding: EdgeInsets.only(left: 20.0,top: 20.0, bottom: 0.0),
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('ITUNES',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GradientText(
                        text: 'MVR 50',
                        style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400),
                        gradient: const LinearGradient(
                            colors: [
                              Color(0xff3AC170),
                              Color(0xff25BFA3),
                            ],
                            transform: GradientRotation(math.pi * 0.50)
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0,bottom: 8.0,right: 20.0),
                    child: Divider(
                      color: Colors.grey.shade600,
                    ),
                  ),
                  Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              GiftCardButtonWidget(
                                //buttonWidth: MediaQuery.of(context).size.width > 350 ? 76 : 56,
                                buttonHeight: 28,
                                buttonText: '\$2',
                                available: true,
                                selected: true,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              GiftCardButtonWidget(
                                //buttonWidth: MediaQuery.of(context).size.width > 350 ? 76 : 56,
                                buttonHeight: 28,
                                buttonText: '\$5',
                                available: false,
                                selected: false,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              GiftCardButtonWidget(
                               // buttonWidth: MediaQuery.of(context).size.width > 350 ? 76 : 56,
                                buttonHeight: 28,
                                buttonText: '\$10',
                                available: false,
                                selected: false,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              GiftCardButtonWidget(
                                //buttonWidth: MediaQuery.of(context).size.width > 350 ? 76 : 56,
                                buttonHeight: 28,
                                buttonText: '\$15',
                                available: false,
                                selected: false,
                              ),

                            ],
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Row(
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GiftCardButtonWidget(
                                //buttonWidth: MediaQuery.of(context).size.width > 350 ? 76 : 56,
                                buttonHeight: 28,
                                buttonText: '\$25',
                                available: true,
                                selected: false,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              GiftCardButtonWidget(
                                //buttonWidth: MediaQuery.of(context).size.width > 350 ? 76 : 56,
                                buttonHeight: 28,
                                buttonText: '\$50',
                                available: false,
                                selected: false,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              GiftCardButtonWidget(
                                //buttonWidth: MediaQuery.of(context).size.width > 350 ? 76 : 56,
                                buttonHeight: 28,
                                buttonText: '\$100',
                                available: false,
                                selected: false,
                              )
                            ],
                          ),
                        ],
                      )

                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width >= 364 ? 190 : MediaQuery.of(context).size.width * 0.60,
            top: 165,
            child: Container(
              width: MediaQuery.of(context).size.width > 364 ? 133 : 90,
              height: 46,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
              ),
              child: Text('BUY',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, color: Colors.white),),
            ),
          ),
        ],
      );
    }else if(psn == true && itunes != true && netflix != true){//if it is psn
      return Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              //width: MediaQuery.of(context).size.width > 320 ? 364 : 280,
              constraints: BoxConstraints(
                  maxWidth: 364
              ),
              height: 193,
              padding: EdgeInsets.only(left: 20.0,top: 20.0, bottom: 0.0),
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('PLAYSTATION',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GradientText(
                        text: 'MVR 225',
                        style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400),
                        gradient: const LinearGradient(
                            colors: [
                              Color(0xff3AC170),
                              Color(0xff25BFA3),
                            ],
                            transform: GradientRotation(math.pi * 0.50)
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0,bottom: 8.0,right: 20.0),
                    child: Divider(
                      color: Colors.grey.shade600,
                    ),
                  ),
                  Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              GiftCardButtonWidget(
                                //buttonWidth: MediaQuery.of(context).size.width > 350 ? 76 : 56,
                                buttonHeight: 28,
                                buttonText: '\$10',
                                available: true,
                                selected: true,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              GiftCardButtonWidget(
                                //buttonWidth: MediaQuery.of(context).size.width > 350 ? 76 : 56,
                                buttonHeight: 28,
                                buttonText: '\$20',
                                available: false,
                                selected: false,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              GiftCardButtonWidget(
                                //buttonWidth: MediaQuery.of(context).size.width > 350 ? 76 : 56,
                                buttonHeight: 28,
                                buttonText: '\$24.99',
                                available: false,
                                selected: false,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              GiftCardButtonWidget(
                                //buttonWidth: MediaQuery.of(context).size.width > 350 ? 76 : 56,
                                buttonHeight: 28,
                                buttonText: '\$25',
                                available: false,
                                selected: false,
                              ),

                            ],
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              GiftCardButtonWidget(
                                //buttonWidth: MediaQuery.of(context).size.width > 350 ? 76 : 56,
                                buttonHeight: 28,
                                buttonText: '\$50',
                                available: true,
                                selected: false,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              GiftCardButtonWidget(
                                //buttonWidth: MediaQuery.of(context).size.width > 350 ? 76 : 56,
                                buttonHeight: 28,
                                buttonText: '\$59.99',
                                available: false,
                                selected: false,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              GiftCardButtonWidget(
                                //buttonWidth: MediaQuery.of(context).size.width > 350 ? 76 : 56,
                                buttonHeight: 28,
                                buttonText: '\$100',
                                available: false,
                                selected: false,
                              )
                            ],
                          ),
                        ],
                      )

                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width >= 364 ? 190 : MediaQuery.of(context).size.width * 0.60,
            top: 165,
            child: Container(
              width: MediaQuery.of(context).size.width > 364 ? 133 : 90,
              height: 46,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
              ),
              child: Text('BUY',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, color: Colors.white),),
            ),
          ),
        ],
      );
    }else if(netflix == true && psn != true && itunes != true){//if it is netflix
      return Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              //width: MediaQuery.of(context).size.width > 320 ? 364 : 280,
              height: 193,
              constraints: BoxConstraints(
                  maxWidth: 364
              ),
              padding: EdgeInsets.only(left: 20.0,top: 20.0, bottom: 0.0),
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('NETFLIX',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GradientText(
                        text: 'MVR 660',
                        style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400),
                        gradient: const LinearGradient(
                            colors: [
                              Color(0xff3AC170),
                              Color(0xff25BFA3),
                            ],
                            transform: GradientRotation(math.pi * 0.50)
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0,bottom: 8.0,right: 20.0),
                    child: Divider(
                      color: Colors.grey.shade600,
                    ),
                  ),
                  Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              GiftCardButtonWidget(
                                //buttonWidth: MediaQuery.of(context).size.width > 350 ? 76 : 56,
                                buttonHeight: 28,
                                buttonText: '\$30',
                                available: true,
                                selected: true,
                              )
                            ],
                          )
                        ],
                      )

                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width >= 364 ? 190 : MediaQuery.of(context).size.width * 0.60,
            top: 165,
            child: Container(
              width: MediaQuery.of(context).size.width > 364 ? 133 : 90,
              height: 46,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
              ),
              child: Text('BUY',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, color: Colors.white),),
            ),
          ),
        ],
      );
    }else{//if nothing
      return Stack();
    }

  }
}
