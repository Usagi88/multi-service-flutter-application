import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fpapp/widgets/banner_widget.dart';
import 'package:fpapp/widgets/button_widget.dart';
import 'package:fpapp/widgets/clickable_link_widget.dart';
import 'package:fpapp/widgets/navbar_widget.dart';
import 'package:fpapp/widgets/navbar_with_back_button_widget.dart';
import 'package:fpapp/widgets/sidemenu_widget.dart';
import 'package:fpapp/widgets/textfield_number_widget.dart';
import 'package:fpapp/widgets/textfield_text_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fpapp/widgets/warning_text_widget.dart';

import 'about_view.dart';


class ServiceDetailsView extends StatefulWidget {
  const ServiceDetailsView({Key? key}) : super(key: key);

  @override
  _ServiceDetailsViewState createState() => _ServiceDetailsViewState();
}

class _ServiceDetailsViewState extends State<ServiceDetailsView> with SingleTickerProviderStateMixin{
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
    double height = NavbarWithBackButton().preferredSize.height;
    var safePadding = MediaQuery.of(context).padding.top;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _portraitModeOnly(context, height, safePadding,  _animationController, _tween);
  }

  //portrait
  Scaffold _portraitModeOnly(BuildContext context, height, safePadding, _animationController, _tween) {
    return Scaffold(
        appBar: NavbarWithBackButton(),
        drawer: SideMenu(),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                  children: [
                    DefaultTabController(
                      length: 2,
                      initialIndex: 0,
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
                                                      child: Text(AppLocalizations.of(context)!.serviceDetailsViewDhiraaguFirstText,
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
                                              child: Align( alignment: Alignment.centerLeft,
                                                  child: SlideTransition(
                                                    position: Tween<Offset>(
                                                      begin: Offset(-1, 0),
                                                      end: Offset.zero,
                                                    ).animate(_animationController),
                                                    child: FadeTransition(
                                                      opacity: _animationController,
                                                        child: Text(
                                                          AppLocalizations.of(context)!.selectPackage,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)
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
                                                  begin: Offset(2, 0),
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
                                                        title: Text('Keep info saved', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                                        value: _checked,
                                                        controlAffinity: ListTileControlAffinity.leading,
                                                        activeColor: Color(0xff29bf9a),
                                                        contentPadding: const EdgeInsets.all(0.0),
                                                        onChanged: (bool? newValue) {
                                                          setState(() {
                                                            _checked = newValue;
                                                            print(_checked);
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
                                                      child: Table(
                                                        columnWidths: {
                                                          0: FlexColumnWidth(2),
                                                          1: FlexColumnWidth(6),
                                                          2: FlexColumnWidth(2),
                                                          3: FlexColumnWidth(2),
                                                        },
                                                        border: TableBorder(
                                                            horizontalInside: BorderSide(
                                                                width: 1, color: Colors.grey.shade300, style: BorderStyle.solid
                                                            ),
                                                            bottom: BorderSide(
                                                                width: 1, color: Colors.grey.shade300, style: BorderStyle.solid
                                                            )
                                                        ),
                                                        // textDirection: TextDirection.rtl,
                                                        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                                        children: [
                                                          TableRow(
                                                              children: [
                                                                Container(
                                                                    height: 50,
                                                                    alignment: Alignment.centerLeft,
                                                                    child: Text("#",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),)
                                                                ),
                                                                Container(
                                                                    alignment: Alignment.centerLeft,
                                                                    child: Text(AppLocalizations.of(context)!.details,style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),)
                                                                ),
                                                                Container(
                                                                    alignment: Alignment.center,
                                                                    child: Text(AppLocalizations.of(context)!.delete,style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),)
                                                                ),
                                                                Container(
                                                                    alignment: Alignment.center,
                                                                    child: Text(AppLocalizations.of(context)!.show,style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),)
                                                                ),
                                                              ]
                                                          ),
                                                          TableRow(
                                                              children: [
                                                                Container(
                                                                    alignment: Alignment.centerLeft,
                                                                    child: Text("1",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),)
                                                                ),
                                                                Container(
                                                                  alignment: Alignment.centerLeft,
                                                                  child: ListTile(
                                                                    contentPadding: EdgeInsets.all(0.0),
                                                                    title: Text("7566561",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                                                    subtitle: Text("Hussain Shafiu",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  alignment: Alignment.center,
                                                                  child: GradientIcon(
                                                                    FontAwesomeIcons.trash,
                                                                    24.0,
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
                                                                Container(
                                                                  alignment: Alignment.center,
                                                                  child: GradientIcon(
                                                                    FontAwesomeIcons.locationArrow,
                                                                    24.0,
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
                                                              ]
                                                          ),

                                                          TableRow(
                                                              children: [
                                                                Container(
                                                                    alignment: Alignment.centerLeft,
                                                                    child: Text("2",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),)
                                                                ),
                                                                Container(
                                                                  alignment: Alignment.centerLeft,
                                                                  child: ListTile(
                                                                    contentPadding: EdgeInsets.all(0.0),
                                                                    title: Text("7566561",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                                                    subtitle: Text("Hussain Shafiu",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  alignment: Alignment.center,
                                                                  child: GradientIcon(
                                                                    FontAwesomeIcons.trash,
                                                                    24.0,
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
                                                                Container(
                                                                  alignment: Alignment.center,
                                                                  child: GradientIcon(
                                                                    FontAwesomeIcons.locationArrow,
                                                                    24.0,
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
                                                              ]
                                                          ),
                                                        ],
                                                      )
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
                                      //ooredoo view
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
                                                      child: Text(AppLocalizations.of(context)!.serviceDetailsViewOoredooFirstText,
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
                                              child: Align( alignment: Alignment.centerLeft,
                                                  child: SlideTransition(
                                                    position: Tween<Offset>(
                                                      begin: Offset(-1, 0),
                                                      end: Offset.zero,
                                                    ).animate(_animationController),
                                                    child: FadeTransition(
                                                        opacity: _animationController,
                                                        child: Text(
                                                          AppLocalizations.of(context)!.selectPackage,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)
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
                                                  begin: Offset(2, 0),
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
                                                        title: Text('Keep info saved', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                                        value: _checked,
                                                        controlAffinity: ListTileControlAffinity.leading,
                                                        activeColor: Color(0xff29bf9a),
                                                        contentPadding: const EdgeInsets.all(0.0),
                                                        onChanged: (bool? newValue) {
                                                          setState(() {
                                                            _checked = newValue;
                                                            print(_checked);
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
                                                      child: Table(
                                                        columnWidths: {
                                                          0: FlexColumnWidth(2),
                                                          1: FlexColumnWidth(6),
                                                          2: FlexColumnWidth(2),
                                                          3: FlexColumnWidth(2),
                                                        },
                                                        border: TableBorder(
                                                            horizontalInside: BorderSide(
                                                                width: 1, color: Colors.grey.shade300, style: BorderStyle.solid
                                                            ),
                                                            bottom: BorderSide(
                                                                width: 1, color: Colors.grey.shade300, style: BorderStyle.solid
                                                            )
                                                        ),
                                                        // textDirection: TextDirection.rtl,
                                                        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                                        children: [
                                                          TableRow(
                                                              children: [
                                                                Container(
                                                                    height: 50,
                                                                    alignment: Alignment.centerLeft,
                                                                    child: Text("#",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),)
                                                                ),
                                                                Container(
                                                                    alignment: Alignment.centerLeft,
                                                                    child: Text(AppLocalizations.of(context)!.details,style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),)
                                                                ),
                                                                Container(
                                                                    alignment: Alignment.center,
                                                                    child: Text(AppLocalizations.of(context)!.delete,style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),)
                                                                ),
                                                                Container(
                                                                    alignment: Alignment.center,
                                                                    child: Text(AppLocalizations.of(context)!.show,style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),)
                                                                ),
                                                              ]
                                                          ),
                                                          TableRow(
                                                              children: [
                                                                Container(
                                                                    alignment: Alignment.centerLeft,
                                                                    child: Text("1",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),)
                                                                ),
                                                                Container(
                                                                  alignment: Alignment.centerLeft,
                                                                  child: ListTile(
                                                                    contentPadding: EdgeInsets.all(0.0),
                                                                    title: Text("7566561",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                                                    subtitle: Text("Hussain Shafiu",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  alignment: Alignment.center,
                                                                  child: GradientIcon(
                                                                    FontAwesomeIcons.trash,
                                                                    24.0,
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
                                                                Container(
                                                                  alignment: Alignment.center,
                                                                  child: GradientIcon(
                                                                    FontAwesomeIcons.locationArrow,
                                                                    24.0,
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
                                                              ]
                                                          ),

                                                          TableRow(
                                                              children: [
                                                                Container(
                                                                    alignment: Alignment.centerLeft,
                                                                    child: Text("2",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),)
                                                                ),
                                                                Container(
                                                                  alignment: Alignment.centerLeft,
                                                                  child: ListTile(
                                                                    contentPadding: EdgeInsets.all(0.0),
                                                                    title: Text("7566561",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                                                    subtitle: Text("Hussain Shafiu",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  alignment: Alignment.center,
                                                                  child: GradientIcon(
                                                                    FontAwesomeIcons.trash,
                                                                    24.0,
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
                                                                Container(
                                                                  alignment: Alignment.center,
                                                                  child: GradientIcon(
                                                                    FontAwesomeIcons.locationArrow,
                                                                    24.0,
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
                                                              ]
                                                          ),
                                                        ],
                                                      )
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

//class that makes icons have gradient
class GradientIcon extends StatelessWidget {
  GradientIcon(
      this.icon,
      this.size,
      this.gradient,
      );

  final IconData icon;
  final double size;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: SizedBox(
        width: size * 1.2,
        height: size * 1.2,
        child: Icon(
          icon,
          size: size,
          color: Colors.white,
        ),
      ),
      shaderCallback: (Rect bounds) {
        final Rect rect = Rect.fromLTRB(0, 0, size, size);
        return gradient.createShader(rect);
      },
    );
  }
}


