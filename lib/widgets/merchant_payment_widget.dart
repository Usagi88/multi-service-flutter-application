import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fpapp/classes/gradient_text.dart';
import 'package:fpapp/provider/locale_provider.dart';
import 'package:intl/intl.dart' as intl;
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:math' as math;

final value = new intl.NumberFormat("#,##0.00", "en_US");

class MerchantPaymentWidget extends StatefulWidget {

  String? title;
  double? amount;
  String? from;
  String? note;
  String? expires;

  MerchantPaymentWidget({Key? key,
    this.title,
    this.amount,
    this.from,
    this.note,
    this.expires,
  }) : super(key: key);

  @override
  State<MerchantPaymentWidget> createState() => _MerchantPaymentWidgetState();
}

class _MerchantPaymentWidgetState extends State<MerchantPaymentWidget> {
  @override
  Widget build(BuildContext context) {
    var language = Provider.of<LocaleProvider>(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _portraitModeOnly(context, language);
  }

  //portrait
  Container _portraitModeOnly(BuildContext context, language){
    if (language.locale.toString() == 'dv' || language.locale.toString() == 'ar'){
      return Container(
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
                child: Text(widget.title!, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18, fontFamily: 'Roboto'),)
            ),
            SizedBox(height: 6,),
            GradientText(
                text: value.format(widget.amount),
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
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Row(
                  children: [
                    Text(AppLocalizations.of(context)!.from + ": ", style: TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Roboto'),),
                    GradientText(
                        text: widget.from!,
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
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Row(
                  children: [
                    Text(AppLocalizations.of(context)!.note + ": ",style: TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Roboto'),),
                    Text(widget.note!, style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Roboto')),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Row(
                  children: [
                    Text(AppLocalizations.of(context)!.expiresIn + ": ",style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600, fontFamily: 'Roboto')),
                    Text(widget.expires!, style: TextStyle(fontWeight: FontWeight.w800, color: Colors.red, fontFamily: 'Roboto')),
                  ],
                ),
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
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.0)),

                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                              builder: (context, setState) {
                                return AlertDialog(
                                  title: Column(
                                    children: [
                                      const Icon(
                                        FontAwesomeIcons.exclamationTriangle,
                                        color: Colors.orangeAccent,
                                        size: 74.0,
                                      ),
                                    ],
                                  ),
                                  content: Text(
                                    AppLocalizations.of(context)!.areYouSureRejectPayment,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight:
                                        FontWeight.w400),
                                  ),
                                  actions: [
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: SizedBox(
                                            height: 44,
                                            child: TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(AppLocalizations.of(context)!.yes),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: SizedBox(
                                            height: 44,
                                            child: TextButton(
                                              style: TextButton.styleFrom(
                                                  primary: Colors.red),
                                              onPressed: () =>
                                              {Navigator.pop(context)},
                                              child: Text(
                                                AppLocalizations.of(context)!.cancel,
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                            ),
                                          ),
                                        ),

                                      ],
                                    )
                                  ],
                                );
                              },
                            );
                          },
                        );
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
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0),),
                      gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0)),

                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                              builder: (context, setState) {
                                return AlertDialog(
                                  title: Column(
                                    children: [
                                      const Icon(
                                        FontAwesomeIcons.check,
                                        color: Colors.green,
                                        size: 74.0,
                                      ),
                                    ],
                                  ),
                                  content: Text(
                                    AppLocalizations.of(context)!.areYouSureAcceptPayment,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  actions: [
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: SizedBox(
                                            height: 44,
                                            child: TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(AppLocalizations.of(context)!.yes),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: SizedBox(
                                            height: 44,
                                            child: TextButton(
                                              style: TextButton.styleFrom(
                                                  primary: Colors.red),
                                              onPressed: () =>
                                              {Navigator.pop(context)},
                                              child: Text(
                                                AppLocalizations.of(context)!.cancel,
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                );
                              },
                            );
                          },
                        );
                      },
                      child: Text(AppLocalizations.of(context)!.pay, style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Container(
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
              child: Text(widget.title!, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),)
          ),
          SizedBox(height: 6,),
          GradientText(
              text: value.format(widget.amount),
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
                    text: widget.from!,
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
                Text(widget.note!, style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Roboto')),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Text(AppLocalizations.of(context)!.expiresIn + ": ",style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600)),
                Text(widget.expires!, style: TextStyle(fontWeight: FontWeight.w800, color: Colors.red)),
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
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(
                            builder: (context, setState) {
                              return AlertDialog(
                                title: Column(
                                  children: [
                                    const Icon(
                                      FontAwesomeIcons.exclamationTriangle,
                                      color: Colors.orangeAccent,
                                      size: 74.0,
                                    ),
                                  ],
                                ),
                                content: Text(
                                  AppLocalizations.of(context)!.areYouSureRejectPayment,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight:
                                      FontWeight.w400),
                                ),
                                actions: [
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: SizedBox(
                                          height: 44,
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                                primary: Colors.red),
                                            onPressed: () =>
                                            {Navigator.pop(context)},
                                            child: Text(
                                              AppLocalizations.of(context)!.cancel,
                                              style: TextStyle(
                                                  color: Colors.red),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          height: 44,
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(AppLocalizations.of(context)!.yes),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              );
                            },
                          );
                        },
                      );
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
                      showDialog(
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(
                            builder: (context, setState) {
                              return AlertDialog(
                                title: Column(
                                  children: [
                                    const Icon(
                                      FontAwesomeIcons.check,
                                      color: Colors.green,
                                      size: 74.0,
                                    ),
                                  ],
                                ),
                                content: Text(
                                  AppLocalizations.of(context)!.areYouSureAcceptPayment,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight:
                                      FontWeight.w400),
                                ),
                                actions: [
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: SizedBox(
                                          height: 44,
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                                primary: Colors.red),
                                            onPressed: () =>
                                            {Navigator.pop(context)},
                                            child: Text(
                                              AppLocalizations.of(context)!.cancel,
                                              style: TextStyle(
                                                  color: Colors.red),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          height: 44,
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(AppLocalizations.of(context)!.yes),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              );
                            },
                          );
                        },
                      );
                    },
                    child: Text(AppLocalizations.of(context)!.pay, style: TextStyle(color: Colors.white),),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

