import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';
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

class RaastasReloadView extends StatefulWidget {
  final bool? dhiraagu;
  final bool? ooredoo;
  RaastasReloadView({Key? key,
    this.dhiraagu,
    this.ooredoo
  }) : super(key: key);

  @override
  _RaastasReloadViewState createState() => _RaastasReloadViewState();
}

class _RaastasReloadViewState extends State<RaastasReloadView> with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin<RaastasReloadView>{
  final FlutterContactPicker _contactPicker = new FlutterContactPicker();
  Contact? _contact;
  AnimationController? _animationController;
  Tween<double> _tween = Tween(begin: 0.1, end: 1);
  bool? _checked = false;
  bool _isVisible = false;

  @override
  bool get wantKeepAlive => true;

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
                                                        child: Text(AppLocalizations.of(context)!.reloadFirstText,
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
                                                        onPressed: () async {
                                                          Contact? contact = await _contactPicker.selectContact();
                                                          setState(() {
                                                            _contact = contact;
                                                          });
                                                        },
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

                                                          decoration: InputDecoration(
                                                            contentPadding: EdgeInsets.all(10.0),
                                                            enabledBorder: UnderlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.white),
                                                            ),
                                                            // Only numbers can be entered
                                                            hintText: AppLocalizations.of(context)!.mobileNumber,

                                                          ),
                                                        ),
                                                      )
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
                                                          title: Text(AppLocalizations.of(context)!.keepInfoSaved, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,),),
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
                                                      buttonText: AppLocalizations.of(context)!.sendReload,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children:[
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                                    child: SlideTransition(
                                                      position: Tween<Offset>(
                                                        begin: Offset(1, 0),
                                                        end: Offset.zero,
                                                      ).animate(_animationController),
                                                      child: FadeTransition(
                                                        opacity: _animationController,
                                                        child: Text(
                                                          AppLocalizations.of(context)!.savedNumbers,
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight: FontWeight.w700
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: SlideTransition(
                                                      position: Tween<Offset>(
                                                        begin: Offset(1, 0),
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
                                                    width: 20,
                                                  )
                                                ],
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
                                                              columnSpacing: 0,
                                                              horizontalMargin: 0,
                                                              columns: [
                                                                DataColumn(label:
                                                                Padding(
                                                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                                  child: Text("#",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w600),),
                                                                )
                                                                ),
                                                                DataColumn(
                                                                    label: Padding(
                                                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                                      child: Text(AppLocalizations.of(context)!.details,style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w600),),
                                                                    )
                                                                ),
                                                                DataColumn(label:
                                                                Padding(
                                                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                                  child: Text(AppLocalizations.of(context)!.delete,style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w600,fontFamily: 'Roboto'),),
                                                                )
                                                                ),
                                                                DataColumn(label:
                                                                Padding(
                                                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                                  child: Text(AppLocalizations.of(context)!.show,style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w600,fontFamily: 'Roboto'),),
                                                                )
                                                                ),
                                                              ],
                                                              rows: [
                                                                DataRow(
                                                                    cells: [
                                                                      DataCell(Padding(
                                                                        padding: const EdgeInsets.symmetric(horizontal:4.0),
                                                                        child: Text("1",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                                                      )),
                                                                      DataCell(
                                                                          Padding(
                                                                            padding: const EdgeInsets.symmetric(horizontal:4.0),
                                                                            child: Column(
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Align(
                                                                                      alignment: Alignment.centerRight,
                                                                                      child: Text("7566561", style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),)
                                                                                  ),
                                                                                  Align(
                                                                                      alignment: Alignment.centerRight,
                                                                                      child: Text("Hussain Shafiu", style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),)
                                                                                  ),
                                                                                ]
                                                                            ),
                                                                          )
                                                                      ),
                                                                      DataCell(
                                                                        Padding(
                                                                          padding: const EdgeInsets.symmetric(horizontal:4.0),
                                                                          child: GradientIcon(
                                                                            FontAwesomeIcons.trash,
                                                                            MediaQuery.of(context).size.width > 350 ? 24.0 : 18.0,
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
                                                                      ),
                                                                      DataCell(
                                                                        Padding(
                                                                          padding: const EdgeInsets.symmetric(horizontal:4.0),
                                                                          child: GradientIcon(
                                                                            FontAwesomeIcons.locationArrow,
                                                                            MediaQuery.of(context).size.width > 350 ? 24.0 : 18.0,
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
                                                                      )
                                                                    ]
                                                                ),
                                                                DataRow(
                                                                    cells: [
                                                                      DataCell(Padding(
                                                                        padding: const EdgeInsets.symmetric(horizontal:4.0),
                                                                        child: Text("1",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                                                      )),
                                                                      DataCell(
                                                                          Padding(
                                                                            padding: const EdgeInsets.symmetric(horizontal:4.0),
                                                                            child: Column(
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Align(
                                                                                      alignment: Alignment.centerRight,
                                                                                      child: Text("7566561", style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),)
                                                                                  ),
                                                                                  Align(
                                                                                      alignment: Alignment.centerRight,
                                                                                      child: Text("Hussain Shafiu", style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),)
                                                                                  ),
                                                                                ]
                                                                            ),
                                                                          )
                                                                      ),
                                                                      DataCell(
                                                                        Padding(
                                                                          padding: const EdgeInsets.symmetric(horizontal:4.0),
                                                                          child: GradientIcon(
                                                                            FontAwesomeIcons.trash,
                                                                            MediaQuery.of(context).size.width > 350 ? 24.0 : 18.0,
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
                                                                      ),
                                                                      DataCell(
                                                                        Padding(
                                                                          padding: const EdgeInsets.symmetric(horizontal:4.0),
                                                                          child: GradientIcon(
                                                                            FontAwesomeIcons.locationArrow,
                                                                            MediaQuery.of(context).size.width > 350 ? 24.0 : 18.0,
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
                                                                      )
                                                                    ]
                                                                ),
                                                              ]
                                                          )
                                                        ],

                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 100,
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
                                                        child: Text(AppLocalizations.of(context)!.raastasFirstText,
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
                                                        onPressed: () async {
                                                          Contact? contact = await _contactPicker.selectContact();
                                                          setState(() {
                                                            _contact = contact;
                                                          });
                                                        },
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

                                                          decoration: InputDecoration(
                                                            contentPadding: EdgeInsets.all(10.0),
                                                            enabledBorder: UnderlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.white),
                                                            ),
                                                            // Only numbers can be entered
                                                            hintText: AppLocalizations.of(context)!.mobileNumber,

                                                          ),
                                                        ),
                                                      )
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
                                                          title: Text(AppLocalizations.of(context)!.keepInfoSaved, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,),),
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
                                                      buttonText: AppLocalizations.of(context)!.sendRaastas,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children:[
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                                    child: SlideTransition(
                                                      position: Tween<Offset>(
                                                        begin: Offset(1, 0),
                                                        end: Offset.zero,
                                                      ).animate(_animationController),
                                                      child: FadeTransition(
                                                        opacity: _animationController,
                                                        child: Text(
                                                          AppLocalizations.of(context)!.savedNumbers,
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight: FontWeight.w700
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: SlideTransition(
                                                      position: Tween<Offset>(
                                                        begin: Offset(1, 0),
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
                                                    width: 20,
                                                  )
                                                ],
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
                                                              columnSpacing: 0,
                                                              horizontalMargin: 0,
                                                              columns: [
                                                                DataColumn(label:
                                                                Padding(
                                                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                                  child: Text("#",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w600),),
                                                                )
                                                                ),
                                                                DataColumn(
                                                                    label: Padding(
                                                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                                      child: Text(AppLocalizations.of(context)!.details,style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w600),),
                                                                    )
                                                                ),
                                                                DataColumn(label:
                                                                Padding(
                                                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                                  child: Text(AppLocalizations.of(context)!.delete,style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w600,fontFamily: 'Roboto'),),
                                                                )
                                                                ),
                                                                DataColumn(label:
                                                                Padding(
                                                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                                  child: Text(AppLocalizations.of(context)!.show,style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w600,fontFamily: 'Roboto'),),
                                                                )
                                                                ),
                                                              ],
                                                              rows: [
                                                                DataRow(
                                                                    cells: [
                                                                      DataCell(Padding(
                                                                        padding: const EdgeInsets.symmetric(horizontal:4.0),
                                                                        child: Text("1",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                                                      )),
                                                                      DataCell(
                                                                          Padding(
                                                                            padding: const EdgeInsets.symmetric(horizontal:4.0),
                                                                            child: Column(
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Align(
                                                                                      alignment: Alignment.centerRight,
                                                                                      child: Text("7566561", style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),)
                                                                                  ),
                                                                                  Align(
                                                                                      alignment: Alignment.centerRight,
                                                                                      child: Text("Hussain Shafiu", style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),)
                                                                                  ),
                                                                                ]
                                                                            ),
                                                                          )
                                                                      ),
                                                                      DataCell(
                                                                        Padding(
                                                                          padding: const EdgeInsets.symmetric(horizontal:4.0),
                                                                          child: GradientIcon(
                                                                            FontAwesomeIcons.trash,
                                                                            MediaQuery.of(context).size.width > 350 ? 24.0 : 18.0,
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
                                                                      ),
                                                                      DataCell(
                                                                        Padding(
                                                                          padding: const EdgeInsets.symmetric(horizontal:4.0),
                                                                          child: GradientIcon(
                                                                            FontAwesomeIcons.locationArrow,
                                                                            MediaQuery.of(context).size.width > 350 ? 24.0 : 18.0,
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
                                                                      )
                                                                    ]
                                                                ),
                                                                DataRow(
                                                                    cells: [
                                                                      DataCell(Padding(
                                                                        padding: const EdgeInsets.symmetric(horizontal:4.0),
                                                                        child: Text("1",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                                                      )),
                                                                      DataCell(
                                                                          Padding(
                                                                            padding: const EdgeInsets.symmetric(horizontal:4.0),
                                                                            child: Column(
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Align(
                                                                                      alignment: Alignment.centerRight,
                                                                                      child: Text("7566561", style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),)
                                                                                  ),
                                                                                  Align(
                                                                                      alignment: Alignment.centerRight,
                                                                                      child: Text("Hussain Shafiu", style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),)
                                                                                  ),
                                                                                ]
                                                                            ),
                                                                          )
                                                                      ),
                                                                      DataCell(
                                                                        Padding(
                                                                          padding: const EdgeInsets.symmetric(horizontal:4.0),
                                                                          child: GradientIcon(
                                                                            FontAwesomeIcons.trash,
                                                                            MediaQuery.of(context).size.width > 350 ? 24.0 : 18.0,
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
                                                                      ),
                                                                      DataCell(
                                                                        Padding(
                                                                          padding: const EdgeInsets.symmetric(horizontal:4.0),
                                                                          child: GradientIcon(
                                                                            FontAwesomeIcons.locationArrow,
                                                                            MediaQuery.of(context).size.width > 350 ? 24.0 : 18.0,
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
                                                                      )
                                                                    ]
                                                                ),
                                                              ]
                                                          )
                                                        ],

                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 100,
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
                                                      child: Text(AppLocalizations.of(context)!.reloadFirstText,
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
                                                      onPressed: () async {
                                                        Contact? contact = await _contactPicker.selectContact();
                                                        setState(() {
                                                          _contact = contact;
                                                        });
                                                      },
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
                                                        hintText: AppLocalizations.of(context)!.mobileNumber,

                                                      ),
                                                    ),
                                                  )
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
                                                    buttonText: AppLocalizations.of(context)!.sendReload,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children:[
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                                  child: SlideTransition(
                                                    position: Tween<Offset>(
                                                      begin: Offset(-1, 0),
                                                      end: Offset.zero,
                                                    ).animate(_animationController),
                                                    child: FadeTransition(
                                                      opacity: _animationController,
                                                      child: Text(
                                                        AppLocalizations.of(context)!.savedNumbers,
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight: FontWeight.w700
                                                        ),
                                                      ),
                                                    ),
                                                  ),
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
                                                  width: 20,
                                                )
                                              ],
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
                                                            columnSpacing: 0,
                                                            horizontalMargin: 0,
                                                            columns: [
                                                              DataColumn(label:
                                                              Padding(
                                                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                                child: Text("#",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w600),),
                                                              )
                                                              ),
                                                              DataColumn(
                                                                  label: Padding(
                                                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                                    child: Text(AppLocalizations.of(context)!.details,style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w600),),
                                                                  )
                                                              ),
                                                              DataColumn(label:
                                                              Padding(
                                                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                                child: Text(AppLocalizations.of(context)!.delete,style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w600,fontFamily: 'Roboto'),),
                                                              )
                                                              ),
                                                              DataColumn(label:
                                                              Padding(
                                                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                                child: Text(AppLocalizations.of(context)!.show,style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w600,fontFamily: 'Roboto'),),
                                                              )
                                                              ),
                                                            ],
                                                            rows: [
                                                              DataRow(
                                                                  cells: [
                                                                    DataCell(Padding(
                                                                      padding: const EdgeInsets.symmetric(horizontal:4.0),
                                                                      child: Text("1",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                                                    )),
                                                                    DataCell(
                                                                        Padding(
                                                                          padding: const EdgeInsets.symmetric(horizontal:4.0),
                                                                          child: Column(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                Align(
                                                                                    alignment: Alignment.centerLeft,
                                                                                    child: Text("7566561", style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),)
                                                                                ),
                                                                                Align(
                                                                                    alignment: Alignment.centerLeft,
                                                                                    child: Text("Hussain Shafiu", style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),)
                                                                                ),
                                                                              ]
                                                                          ),
                                                                        )
                                                                    ),
                                                                    DataCell(
                                                                      Padding(
                                                                        padding: const EdgeInsets.symmetric(horizontal:4.0),
                                                                        child: GradientIcon(
                                                                          FontAwesomeIcons.trash,
                                                                          MediaQuery.of(context).size.width > 350 ? 24.0 : 18.0,
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
                                                                    ),
                                                                    DataCell(
                                                                      Padding(
                                                                        padding: const EdgeInsets.symmetric(horizontal:4.0),
                                                                        child: GradientIcon(
                                                                          FontAwesomeIcons.locationArrow,
                                                                          MediaQuery.of(context).size.width > 350 ? 24.0 : 18.0,
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
                                                                    )
                                                                  ]
                                                              ),
                                                              DataRow(
                                                                  cells: [
                                                                    DataCell(Padding(
                                                                      padding: const EdgeInsets.symmetric(horizontal:4.0),
                                                                      child: Text("1",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                                                    )),
                                                                    DataCell(
                                                                        Padding(
                                                                          padding: const EdgeInsets.symmetric(horizontal:4.0),
                                                                          child: Column(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                Align(
                                                                                    alignment: Alignment.centerLeft,
                                                                                    child: Text("7566561", style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),)
                                                                                ),
                                                                                Align(
                                                                                    alignment: Alignment.centerLeft,
                                                                                    child: Text("Hussain Shafiu", style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),)
                                                                                ),
                                                                              ]
                                                                          ),
                                                                        )
                                                                    ),
                                                                    DataCell(
                                                                      Padding(
                                                                        padding: const EdgeInsets.symmetric(horizontal:4.0),
                                                                        child: GradientIcon(
                                                                          FontAwesomeIcons.trash,
                                                                          MediaQuery.of(context).size.width > 350 ? 24.0 : 18.0,
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
                                                                    ),
                                                                    DataCell(
                                                                      Padding(
                                                                        padding: const EdgeInsets.symmetric(horizontal:4.0),
                                                                        child: GradientIcon(
                                                                          FontAwesomeIcons.locationArrow,
                                                                          MediaQuery.of(context).size.width > 350 ? 24.0 : 18.0,
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
                                                                    )
                                                                  ]
                                                              ),
                                                            ]
                                                        )
                                                      ],

                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 100,
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
                                                  alignment: Alignment.centerLeft,
                                                  child: SlideTransition(
                                                    position: Tween<Offset>(
                                                      begin: Offset(-1, 0),
                                                      end: Offset.zero,
                                                    ).animate(_animationController),
                                                    child: FadeTransition(
                                                      opacity: _animationController,
                                                      child: Text(AppLocalizations.of(context)!.raastasFirstText,
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
                                                      onPressed: () async {
                                                        Contact? contact = await _contactPicker.selectContact();
                                                        setState(() {
                                                          _contact = contact;
                                                        });
                                                      },
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

                                                        decoration: InputDecoration(
                                                          contentPadding: EdgeInsets.all(10.0),
                                                          enabledBorder: UnderlineInputBorder(
                                                            borderSide: BorderSide(color: Colors.white),
                                                          ),
                                                          // Only numbers can be entered
                                                          hintText: AppLocalizations.of(context)!.mobileNumber,

                                                        ),
                                                      ),
                                                    )
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
                                                    buttonText: AppLocalizations.of(context)!.sendRaastas,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children:[
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                                  child: SlideTransition(
                                                    position: Tween<Offset>(
                                                      begin: Offset(-1, 0),
                                                      end: Offset.zero,
                                                    ).animate(_animationController),
                                                    child: FadeTransition(
                                                      opacity: _animationController,
                                                      child: Text(
                                                        AppLocalizations.of(context)!.savedNumbers,
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight: FontWeight.w700
                                                        ),
                                                      ),
                                                    ),
                                                  ),
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
                                                  width: 20,
                                                )
                                              ],
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
                                                            columnSpacing: 0,
                                                            horizontalMargin: 0,
                                                            columns: [
                                                              DataColumn(label:
                                                              Padding(
                                                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                                child: Text("#",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w600),),
                                                              )
                                                              ),
                                                              DataColumn(
                                                                  label: Padding(
                                                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                                    child: Text(AppLocalizations.of(context)!.details,style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w600),),
                                                                  )
                                                              ),
                                                              DataColumn(label:
                                                              Padding(
                                                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                                child: Text(AppLocalizations.of(context)!.delete,style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w600,fontFamily: 'Roboto'),),
                                                              )
                                                              ),
                                                              DataColumn(label:
                                                              Padding(
                                                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                                child: Text(AppLocalizations.of(context)!.show,style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w600,fontFamily: 'Roboto'),),
                                                              )
                                                              ),
                                                            ],
                                                            rows: [
                                                              DataRow(
                                                                  cells: [
                                                                    DataCell(Padding(
                                                                      padding: const EdgeInsets.symmetric(horizontal:4.0),
                                                                      child: Text("1",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                                                    )),
                                                                    DataCell(
                                                                        Padding(
                                                                          padding: const EdgeInsets.symmetric(horizontal:4.0),
                                                                          child: Column(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                Align(
                                                                                    alignment: Alignment.centerLeft,
                                                                                    child: Text("7566561", style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),)
                                                                                ),
                                                                                Align(
                                                                                    alignment: Alignment.centerLeft,
                                                                                    child: Text("Hussain Shafiu", style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),)
                                                                                ),
                                                                              ]
                                                                          ),
                                                                        )
                                                                    ),
                                                                    DataCell(
                                                                      Padding(
                                                                        padding: const EdgeInsets.symmetric(horizontal:4.0),
                                                                        child: GradientIcon(
                                                                          FontAwesomeIcons.trash,
                                                                          MediaQuery.of(context).size.width > 350 ? 24.0 : 18.0,
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
                                                                    ),
                                                                    DataCell(
                                                                      Padding(
                                                                        padding: const EdgeInsets.symmetric(horizontal:4.0),
                                                                        child: GradientIcon(
                                                                          FontAwesomeIcons.locationArrow,
                                                                          MediaQuery.of(context).size.width > 350 ? 24.0 : 18.0,
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
                                                                    )
                                                                  ]
                                                              ),
                                                              DataRow(
                                                                  cells: [
                                                                    DataCell(Padding(
                                                                      padding: const EdgeInsets.symmetric(horizontal:4.0),
                                                                      child: Text("1",style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
                                                                    )),
                                                                    DataCell(
                                                                        Padding(
                                                                          padding: const EdgeInsets.symmetric(horizontal:4.0),
                                                                          child: Column(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                Align(
                                                                                    alignment: Alignment.centerLeft,
                                                                                    child: Text("7566561", style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),)
                                                                                ),
                                                                                Align(
                                                                                    alignment: Alignment.centerLeft,
                                                                                    child: Text("Hussain Shafiu", style: TextStyle(fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),)
                                                                                ),
                                                                              ]
                                                                          ),
                                                                        )
                                                                    ),
                                                                    DataCell(
                                                                      Padding(
                                                                        padding: const EdgeInsets.symmetric(horizontal:4.0),
                                                                        child: GradientIcon(
                                                                          FontAwesomeIcons.trash,
                                                                          MediaQuery.of(context).size.width > 350 ? 24.0 : 18.0,
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
                                                                    ),
                                                                    DataCell(
                                                                      Padding(
                                                                        padding: const EdgeInsets.symmetric(horizontal:4.0),
                                                                        child: GradientIcon(
                                                                          FontAwesomeIcons.locationArrow,
                                                                          MediaQuery.of(context).size.width > 350 ? 24.0 : 18.0,
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
                                                                    )
                                                                  ]
                                                              ),
                                                            ]
                                                        )
                                                      ],

                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 100,
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


