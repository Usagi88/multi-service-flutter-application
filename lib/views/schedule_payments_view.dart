import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fpapp/classes/gradient_icon.dart';
import 'package:fpapp/classes/gradient_text.dart';
import 'package:fpapp/provider/locale_provider.dart';
import 'package:fpapp/widgets/banner_widget.dart';
import 'package:fpapp/widgets/button_widget.dart';
import 'package:fpapp/widgets/navbar_widget.dart';
import 'package:fpapp/widgets/navbar_with_back_button_widget.dart';
import 'package:fpapp/widgets/sidemenu_widget.dart';
import 'dart:math' as math;
import 'package:flutter/services.dart';
import 'package:fpapp/widgets/textfield_number_widget.dart';
import 'package:fpapp/widgets/textfield_text_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ScheduledPaymentsView extends StatefulWidget {
  const ScheduledPaymentsView({Key? key}) : super(key: key);

  @override
  _ScheduledPaymentsViewState createState() => _ScheduledPaymentsViewState();
}

class ScheduledPaymentsClass {
  final String name;
  final int id;
  const ScheduledPaymentsClass(this.id,this.name);
}

class _ScheduledPaymentsViewState extends State<ScheduledPaymentsView> with SingleTickerProviderStateMixin{
  AnimationController? _animationController;
  Tween<double> _tween = Tween(begin: 0.1, end: 1);

  ScheduledPaymentsClass? _selectedService;
  List<ScheduledPaymentsClass> services = <ScheduledPaymentsClass>[
    const ScheduledPaymentsClass(1,'Select a service'),
    const ScheduledPaymentsClass(2,'Dhiraagu Bill Pay'),
    const ScheduledPaymentsClass(3,'Ooredoo Bill Pay'),
    const ScheduledPaymentsClass(4,'MediaNet Bill Pay')
  ];

  get child => null;
  @override
  // ignore: must_call_super
  void initState() {
    _selectedService=services[0];
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
                        begin: Offset(1, 0),
                        end: Offset.zero,
                      ).animate(_animationController),
                      child: FadeTransition(
                        opacity: _animationController,
                        child: Text(AppLocalizations.of(context)!.scheduledPaymentsViewFirstText,
                          style: TextStyle(fontSize: 14, color: Colors.grey.shade600,fontWeight: FontWeight.w400),
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
                                AppLocalizations.of(context)!.selectAService,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)
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
                              child:DropdownButton<ScheduledPaymentsClass>(
                                value: _selectedService,
                                onChanged: (ScheduledPaymentsClass? newValue) {
                                  setState(() {
                                    _selectedService = newValue;
                                    print(newValue?.id);
                                  });
                                },
                                items: services.map((ScheduledPaymentsClass service) {
                                  return new DropdownMenuItem<ScheduledPaymentsClass>(
                                    value: service,
                                    child: Container(
                                        width:double.infinity,
                                        alignment:Alignment.centerRight,
                                        padding: const EdgeInsets.fromLTRB(0,8.0,0,6.0),
                                        child:Text(
                                          service.name,
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
                                hint:Text(AppLocalizations.of(context)!.selectAService),
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
                                AppLocalizations.of(context)!.paymentDayOfMonth,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)
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
                            hintText: AppLocalizations.of(context)!.paymentDayOfMonth
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
                                AppLocalizations.of(context)!.serviceNumber,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)
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
                            hintText: AppLocalizations.of(context)!.serviceNumber
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
                                AppLocalizations.of(context)!.amount,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)
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
                            hintText: AppLocalizations.of(context)!.amount
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
                          child: ButtonWidget(buttonText: AppLocalizations.of(context)!.schedulePayment)
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
                        begin: Offset(0, 1),
                        end: Offset.zero,
                      ).animate(_animationController),
                      child: FadeTransition(
                        opacity: _animationController,
                        child: Container(
                          height: 200,
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            children: [
                              DataTable(
                                  dataRowHeight: 80,
                                  columnSpacing: 0,
                                  horizontalMargin: 0,
                                  columns: [
                                    DataColumn(label:
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: Text("#",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w600),),
                                    )
                                    ),
                                    DataColumn(
                                        label: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                          child: Text(AppLocalizations.of(context)!.service,style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w600),),
                                        )
                                    ),
                                    DataColumn(label:
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text(AppLocalizations.of(context)!.number,style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w600,),),
                                    )
                                    ),
                                    DataColumn(label:
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text(AppLocalizations.of(context)!.amount,style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w600,),),
                                    )
                                    ),
                                    DataColumn(label:
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text(AppLocalizations.of(context)!.day,style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w600,),),
                                    )
                                    ),
                                  ],
                                  rows: [
                                    DataRow(
                                        cells: [
                                          DataCell(Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                            child: Text("1",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                          )),
                                          DataCell(Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                            child: Text("Dhiraagu bill pay",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                          )),
                                          DataCell(Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                            child: Text("123",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                          )),
                                          DataCell(Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                            child: Text("500.00",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                          )),
                                          DataCell(Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                            child: Text("18/1/2022",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                          )),
                                        ]
                                    ),
                                    DataRow(
                                        cells: [
                                          DataCell(Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                            child: Text("2",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                          )),
                                          DataCell(Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                            child: Text("Dhiraagu bill pay",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                          )),
                                          DataCell(Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                            child: Text("123",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                          )),
                                          DataCell(Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                            child: Text("500.00",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                          )),
                                          DataCell(Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                            child: Text("18/1/2022",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                          )),
                                        ]
                                    ),
                                    DataRow(
                                        cells: [
                                          DataCell(Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                            child: Text("3",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                          )),
                                          DataCell(Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                            child: Text("Dhiraagu bill pay",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                          )),
                                          DataCell(Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                            child: Text("123",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                          )),
                                          DataCell(Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                            child: Text("500.00",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                          )),
                                          DataCell(Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                            child: Text("18/1/2022",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                          )),
                                        ]
                                    ),
                                    DataRow(
                                        cells: [
                                          DataCell(Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                            child: Text("4",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                          )),
                                          DataCell(Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                            child: Text("Dhiraagu bill pay",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                          )),
                                          DataCell(Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                            child: Text("123",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                          )),
                                          DataCell(Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                            child: Text("500.00",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                          )),
                                          DataCell(Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                            child: Text("18/1/2022",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                          )),
                                        ]
                                    ),
                                  ]
                              ),
                            ],

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
          ),
        ),
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
                      child: Text(AppLocalizations.of(context)!.scheduledPaymentsViewFirstText,
                          style: TextStyle(fontSize: 14, color: Colors.grey.shade600,fontWeight: FontWeight.w400),
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
                              AppLocalizations.of(context)!.selectAService,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)
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
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          height: 46,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: DropdownButtonHideUnderline(
                            child:DropdownButton<ScheduledPaymentsClass>(
                              value: _selectedService,
                              onChanged: (ScheduledPaymentsClass? newValue) {
                                setState(() {
                                  _selectedService = newValue;
                                  print(newValue?.id);
                                });
                              },
                              items: services.map((ScheduledPaymentsClass service) {
                                return new DropdownMenuItem<ScheduledPaymentsClass>(
                                  value: service,
                                  child: Container(
                                      width:double.infinity,
                                      alignment:Alignment.centerLeft,
                                      padding: const EdgeInsets.fromLTRB(0,8.0,0,6.0),
                                      child:Text(
                                        service.name,
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
                              hint:Text(AppLocalizations.of(context)!.selectAService),
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
                              AppLocalizations.of(context)!.paymentDayOfMonth,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)
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
                          hintText: AppLocalizations.of(context)!.paymentDayOfMonth
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
                              AppLocalizations.of(context)!.serviceNumber,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)
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
                          hintText: AppLocalizations.of(context)!.serviceNumber
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
                              AppLocalizations.of(context)!.amount,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)
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
                          hintText: AppLocalizations.of(context)!.amount
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
                        child: ButtonWidget(buttonText: AppLocalizations.of(context)!.schedulePayment)
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
                      begin: Offset(0, 1),
                      end: Offset.zero,
                    ).animate(_animationController),
                    child: FadeTransition(
                      opacity: _animationController,
                      child: Container(
                        height: 200,
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: [
                            DataTable(
                                dataRowHeight: 80,
                                columnSpacing: 0,
                                horizontalMargin: 0,
                                columns: [
                                  DataColumn(label:
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Text("#",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w600),),
                                  )
                                  ),
                                  DataColumn(
                                      label: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Text(AppLocalizations.of(context)!.service,style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w600),),
                                      )
                                  ),
                                  DataColumn(label:
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(AppLocalizations.of(context)!.number,style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w600,fontFamily: 'Roboto'),),
                                  )
                                  ),
                                  DataColumn(label:
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(AppLocalizations.of(context)!.amount,style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w600,fontFamily: 'Roboto'),),
                                  )
                                  ),
                                  DataColumn(label:
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(AppLocalizations.of(context)!.day,style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w600,fontFamily: 'Roboto'),),
                                  )
                                  ),
                                ],
                                rows: [
                                  DataRow(
                                      cells: [
                                        DataCell(Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                          child: Text("1",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                        )),
                                        DataCell(Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                          child: Text("Dhiraagu bill pay",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                        )),
                                        DataCell(Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                          child: Text("123",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                        )),
                                        DataCell(Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                          child: Text("500.00",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                        )),
                                        DataCell(Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                          child: Text("18/1/2022",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                        )),
                                      ]
                                  ),
                                  DataRow(
                                      cells: [
                                        DataCell(Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                          child: Text("2",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                        )),
                                        DataCell(Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                          child: Text("Dhiraagu bill pay",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                        )),
                                        DataCell(Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                          child: Text("123",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                        )),
                                        DataCell(Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                          child: Text("500.00",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                        )),
                                        DataCell(Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                          child: Text("18/1/2022",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                        )),
                                      ]
                                  ),
                                  DataRow(
                                      cells: [
                                        DataCell(Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                          child: Text("3",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                        )),
                                        DataCell(Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                          child: Text("Dhiraagu bill pay",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                        )),
                                        DataCell(Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                          child: Text("123",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                        )),
                                        DataCell(Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                          child: Text("500.00",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                        )),
                                        DataCell(Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                          child: Text("18/1/2022",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                        )),
                                      ]
                                  ),
                                  DataRow(
                                      cells: [
                                        DataCell(Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                          child: Text("4",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                        )),
                                        DataCell(Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                          child: Text("Dhiraagu bill pay",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                        )),
                                        DataCell(Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                          child: Text("123",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                        )),
                                        DataCell(Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                          child: Text("500.00",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                        )),
                                        DataCell(Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                          child: Text("18/1/2022",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                        )),
                                      ]
                                  ),
                                ]
                            ),
                          ],

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
        ),
      ),
    );
  }
}

