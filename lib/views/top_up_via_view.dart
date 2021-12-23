import 'dart:async';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fpapp/widgets/banner_widget.dart';
import 'package:fpapp/widgets/button_widget.dart';
import 'package:fpapp/widgets/navbar_with_back_button_widget.dart';
import 'package:fpapp/widgets/sidemenu_widget.dart';
import 'package:flutter/services.dart';
import 'package:fpapp/widgets/textfield_text_widget.dart';
import 'dart:math' as math;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:fpapp/widgets/warning_text_widget.dart';

class TopUpViaView extends StatefulWidget {
  const TopUpViaView({Key? key}) : super(key: key);

  @override
  _TopUpViaViewState createState() => _TopUpViaViewState();
}

class UsersClass {
  final String name;
  final int id;
  const UsersClass(this.id,this.name);
}

class CurrencyClass {
  final String name;
  final int id;
  const CurrencyClass(this.id,this.name);
}

class _TopUpViaViewState extends State<TopUpViaView> with SingleTickerProviderStateMixin{
  AnimationController? _animationController;
  Tween<double> _tween = Tween(begin: 0.1, end: 1);

  UsersClass? _selectedUser;
  List<UsersClass> users = <UsersClass>[
    const UsersClass(0,'IBRAHIM NAISH'),
  ];


  CurrencyClass? _selectedCurrency;
  List<CurrencyClass> currencies = <CurrencyClass>[
    const CurrencyClass(0,'MVR'),
    const CurrencyClass(1,'USD'),
  ];
  @override
  // ignore: must_call_super
  void initState() {
    _selectedUser=users[0];
    _selectedCurrency=currencies[0];
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
    return _portraitModeOnly(context, height, safePadding, _animationController, _tween);
  }
  //portrait
  Scaffold _portraitModeOnly(BuildContext context, height, safePadding, _animationController, _tween) {
    return Scaffold (
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
                                animationController: _animationController,
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                top: 110,
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
                                                  child: Text("BML", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400)),
                                                ),
                                              ),
                                              Tab(
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text("MIB", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400)),
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
                                top: 159,
                                child: Container(
                                  height: MediaQuery.of(context).size.height - (height + safePadding + 158),
                                  child: TabBarView(
                                    children: [
                                      //bml view
                                      SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                                  child: SlideTransition(
                                                    position: Tween<Offset>(
                                                      begin: Offset(-1, 0),
                                                      end: Offset.zero,
                                                    ).animate(_animationController),
                                                    child: FadeTransition(
                                                      opacity: _animationController,
                                                      child: Container(
                                                        width: 68,
                                                        height: 68,
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
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            GradientText(
                                                                text: '1',
                                                                style: TextStyle(color: Colors.white,fontSize: 26,fontWeight: FontWeight.w700),
                                                                gradient: const LinearGradient(
                                                                    colors: [
                                                                      Color(0xff3AC170),
                                                                      Color(0xff25BFA3),
                                                                    ],
                                                                    transform: GradientRotation(math.pi * 0.50)
                                                                )
                                                            ),
                                                            GradientText(
                                                                text: AppLocalizations.of(context)!.step,
                                                                style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w700),
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
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    constraints: BoxConstraints(
                                                      maxWidth: 238
                                                    ),
                                                    //width: MediaQuery.of(context).size.width > 320 ? 238 : 160,
                                                    child: SlideTransition(
                                                      position: Tween<Offset>(
                                                        begin: Offset(2, 0),
                                                        end: Offset.zero,
                                                      ).animate(_animationController),
                                                      child: FadeTransition(
                                                        opacity: _animationController,
                                                        child: Text(AppLocalizations.of(context)!.topUpViaViewBmlFirsText,
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight: FontWeight.w400,
                                                                color: Colors.grey.shade600
                                                            )
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
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
                                                        child: Text(AppLocalizations.of(context)!.accountName, style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400)
                                                        )
                                                    ),
                                                  ),
                                                )
                                            ),
                                            SizedBox(
                                              height: 14,
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
                                                  child: Container(
                                                    height: 46,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                      color: Color(0xfff2f2f2),
                                                    ),
                                                    child: TextField(
                                                      decoration: InputDecoration(
                                                          contentPadding: EdgeInsets.all(13.0),
                                                          enabledBorder: UnderlineInputBorder(
                                                            borderSide: BorderSide(color: Colors.white),
                                                          ),
                                                          // Only numbers can be entered
                                                          hintText: 'Fahipay PVT LTD',
                                                          suffixIcon: Container(
                                                            width: 11,
                                                            height: 46,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                              gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                                                            ),
                                                            child: IconButton(
                                                              icon: Icon(FontAwesomeIcons.solidClone, color: Colors.white, size: 16),
                                                              onPressed: () {
                                                              },
                                                            ),
                                                          )
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),

                                            SizedBox(
                                              height: 14,
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
                                                        child: Text(AppLocalizations.of(context)!.accountName, style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400)
                                                        )
                                                    ),
                                                  ),
                                                )
                                            ),
                                            SizedBox(
                                              height: 14,
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
                                                  child: Container(
                                                    height: 46,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                      color: Color(0xfff2f2f2),
                                                    ),
                                                    child: TextField(
                                                      decoration: InputDecoration(
                                                          contentPadding: EdgeInsets.all(13.0),
                                                          enabledBorder: UnderlineInputBorder(
                                                            borderSide: BorderSide(color: Colors.white),
                                                          ),
                                                          // Only numbers can be entered
                                                          hintText: '90101480013752000 (MVR)',
                                                          suffixIcon: Container(
                                                            width: 11,
                                                            height: 46,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                              gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                                                            ),
                                                            child: IconButton(
                                                              icon: Icon(FontAwesomeIcons.solidClone, color: Colors.white, size: 16),
                                                              onPressed: () {
                                                              },
                                                            ),
                                                          )
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
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
                                                  child: Container(
                                                    height: 46,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                      color: Color(0xfff2f2f2),
                                                    ),
                                                    child: TextField(
                                                      decoration: InputDecoration(
                                                          contentPadding: EdgeInsets.all(13.0),
                                                          enabledBorder: UnderlineInputBorder(
                                                            borderSide: BorderSide(color: Colors.white),
                                                          ),
                                                          // Only numbers can be entered
                                                          hintText: '90101480013752000 (USD)',
                                                          suffixIcon: Container(
                                                            width: 11,
                                                            height: 46,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                              gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                                                            ),
                                                            child: IconButton(
                                                              icon: Icon(FontAwesomeIcons.solidClone, color: Colors.white, size: 16),
                                                              onPressed: () {
                                                              },
                                                            ),
                                                          )
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
                                                  child: WarningText(
                                                    warningText: AppLocalizations.of(context)!.usdConversion,
                                                    warningTextBottomColor: 0xffE03838,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                                  child: ScaleTransition(
                                                    scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutBack)),
                                                    child: Container(
                                                      width: 68,
                                                      height: 68,
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
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          GradientText(
                                                              text: '2',
                                                              style: TextStyle(color: Colors.white,fontSize: 26,fontWeight: FontWeight.w700),
                                                              gradient: const LinearGradient(
                                                                  colors: [
                                                                    Color(0xff3AC170),
                                                                    Color(0xff25BFA3),
                                                                  ],
                                                                  transform: GradientRotation(math.pi * 0.50)
                                                              )
                                                          ),
                                                          GradientText(
                                                              text: AppLocalizations.of(context)!.step,
                                                              style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w700),
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
                                                ),
                                                Expanded(
                                                  child: SlideTransition(
                                                    position: Tween<Offset>(
                                                      begin: Offset(2, 0),
                                                      end: Offset.zero,
                                                    ).animate(_animationController),
                                                    child: FadeTransition(
                                                      opacity: _animationController,
                                                      child: DottedBorder(
                                                        borderType: BorderType.RRect,
                                                        color: Color(0xff25bfa0),
                                                        radius: Radius.circular(12),
                                                        //padding: const EdgeInsets.all(0),
                                                        dashPattern: [16, 4],
                                                        child: ClipRRect(
                                                          borderRadius: BorderRadius.all(Radius.circular(12)),
                                                          child: Container(
                                                            //width: 282,
                                                            constraints: BoxConstraints(
                                                              maxWidth: 282
                                                            ),
                                                            height: 62,
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                GradientIcon(
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
                                                                Expanded(
                                                                  child: Container(
                                                                    //width: 200,
                                                                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                                                                    alignment: Alignment.center,
                                                                    height: double.infinity,
                                                                    constraints: BoxConstraints(
                                                                      maxWidth: 180,
                                                                    ),
                                                                    child: Text(
                                                                        AppLocalizations.of(context)!.uploadTransferReceipt,
                                                                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400)
                                                                    )
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            ScaleTransition(
                                              scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutBack)),
                                              child: Container(
                                                width: double.infinity,
                                                height: 55,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      const Color(0xff3AC170),
                                                      const Color(0xff25BFA3),
                                                    ],
                                                  ),
                                                ),
                                                child: Text(AppLocalizations.of(context)!.or, style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700, color: Colors.white)),
                                              ),
                                            ),
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
                                                        child: Text(AppLocalizations.of(context)!.enterFullName, style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400)
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
                                                  begin: Offset(2, 0),
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
                                                        child:DropdownButton<UsersClass>(
                                                          value: _selectedUser,
                                                          onChanged: (UsersClass? newValue) {
                                                            setState(() {
                                                              _selectedUser = newValue;
                                                              print(newValue?.id);
                                                            });
                                                          },
                                                          items: users.map((UsersClass user) {
                                                            return new DropdownMenuItem<UsersClass>(
                                                              value: user,
                                                              child: Container(
                                                                  width:double.infinity,
                                                                  alignment:Alignment.centerLeft,
                                                                  padding: const EdgeInsets.fromLTRB(0,8.0,0,6.0),
                                                                  child:Text(
                                                                    user.name,
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
                                                          hint:Text(AppLocalizations.of(context)!.selectAccount),
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
                                                        child: Text(AppLocalizations.of(context)!.transferredAmount, style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400)
                                                        )
                                                    ),
                                                  ),
                                                )
                                            ),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Expanded(
                                                  child: SlideTransition(
                                                    position: Tween<Offset>(
                                                      begin: Offset(-1, 0),
                                                      end: Offset.zero,
                                                    ).animate(_animationController),
                                                    child: FadeTransition(
                                                      opacity: _animationController,
                                                      child: Container(
                                                        height: 46,
                                                        //width: 281,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                          color: Color(0xfff2f2f2),
                                                        ),
                                                        child: TextField(
                                                          decoration: InputDecoration(
                                                            contentPadding: EdgeInsets.all(13.0),
                                                            enabledBorder: UnderlineInputBorder(
                                                              borderSide: BorderSide(color: Colors.white),
                                                            ),
                                                            // Only numbers can be entered
                                                            hintText: AppLocalizations.of(context)!.amount,

                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 20.0, left: 10.0),
                                                  child: SlideTransition(
                                                    position: Tween<Offset>(
                                                      begin: Offset(2, 0),
                                                      end: Offset.zero,
                                                    ).animate(_animationController),
                                                    child: FadeTransition(
                                                      opacity: _animationController,
                                                      child: Container(
                                                          padding: EdgeInsets.only(left: 10),
                                                          height: 46,
                                                          width: 75,
                                                          decoration: BoxDecoration(
                                                              color: Colors.grey.shade200,
                                                              borderRadius: BorderRadius.circular(10)
                                                          ),
                                                          child: DropdownButtonHideUnderline(
                                                            child:DropdownButton<CurrencyClass>(
                                                              value: _selectedCurrency,
                                                              onChanged: (CurrencyClass? newValue) {
                                                                setState(() {
                                                                  _selectedCurrency = newValue;
                                                                });
                                                              },
                                                              items: currencies.map((CurrencyClass currency) {
                                                                return new DropdownMenuItem<CurrencyClass>(
                                                                  value: currency,
                                                                  child: Container(
                                                                      width:double.infinity,
                                                                      alignment:Alignment.centerLeft,
                                                                      padding: const EdgeInsets.fromLTRB(0,8.0,0,6.0),
                                                                      child:Text(
                                                                        currency.name,
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
                                                              hint:Text(AppLocalizations.of(context)!.selectCurrency),
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
                                              ],
                                            ),

                                            SizedBox(
                                              height: 20,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                              child: ScaleTransition(
                                                scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutBack)),
                                                child: ButtonWidget(
                                                    buttonText: AppLocalizations.of(context)!.claim,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                              child: Container(
                                                width: double.infinity,
                                                child: SlideTransition(
                                                  position: Tween<Offset>(
                                                    begin: Offset(-1, 0),
                                                    end: Offset.zero,
                                                  ).animate(_animationController),
                                                  child: FadeTransition(
                                                    opacity: _animationController,
                                                    child: Text(AppLocalizations.of(context)!.topUpViaViewBmlSecondText,
                                                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, color: Color(0xffE03838)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                              child: Container(
                                                width: double.infinity,
                                                child: SlideTransition(
                                                  position: Tween<Offset>(
                                                    begin: Offset(-1, 0),
                                                    end: Offset.zero,
                                                  ).animate(_animationController),
                                                  child: FadeTransition(
                                                    opacity: _animationController,
                                                    child: Text(AppLocalizations.of(context)!.topUpViaViewBmlThirdText,
                                                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, color: Colors.grey.shade600),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                              child: Column(
                                                  children: [
                                                  Container(
                                                  alignment: Alignment.centerLeft,
                                                    child: SlideTransition(
                                                      position: Tween<Offset>(
                                                        begin: Offset(2, 0),
                                                        end: Offset.zero,
                                                      ).animate(_animationController),
                                                      child: FadeTransition(
                                                        opacity: _animationController,
                                                        child: Text(
                                                            AppLocalizations.of(context)!.topUpViaViewBmlFourthText,
                                                          style: TextStyle(
                                                              fontSize: 14.0,
                                                              fontWeight: FontWeight.w400,
                                                              color: Color(0xff909090)
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: Container(
                                                      height: 1,
                                                      width: MediaQuery.of(context).size.width * 0.25,
                                                      color: Color(0xff909090),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                      //mib view
                                      SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 20.0, right: 14),
                                                  child: SlideTransition(
                                                    position: Tween<Offset>(
                                                      begin: Offset(-1, 0),
                                                      end: Offset.zero,
                                                    ).animate(_animationController),
                                                    child: FadeTransition(
                                                      opacity: _animationController,
                                                      child: Container(
                                                        width: 68,
                                                        height: 68,
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
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            GradientText(
                                                                text: '1',
                                                                style: TextStyle(color: Colors.white,fontSize: 26,fontWeight: FontWeight.w700),
                                                                gradient: const LinearGradient(
                                                                    colors: [
                                                                      Color(0xff3AC170),
                                                                      Color(0xff25BFA3),
                                                                    ],
                                                                    transform: GradientRotation(math.pi * 0.50)
                                                                )
                                                            ),
                                                            GradientText(
                                                                text: AppLocalizations.of(context)!.step,
                                                                style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w700),
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
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 14.0, right: 20),
                                                  child: Container(
                                                    width: 238,
                                                    child: SlideTransition(
                                                      position: Tween<Offset>(
                                                        begin: Offset(2, 0),
                                                        end: Offset.zero,
                                                      ).animate(_animationController),
                                                      child: FadeTransition(
                                                        opacity: _animationController,
                                                        child: Text(AppLocalizations.of(context)!.topUpViaViewMIBFirsText,
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight: FontWeight.w400,
                                                                color: Colors.grey.shade600
                                                            )
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
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
                                                        child: Text(AppLocalizations.of(context)!.accountName, style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400)
                                                        )
                                                    ),
                                                  ),
                                                )
                                            ),
                                            SizedBox(
                                              height: 14,
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
                                                  child: Container(
                                                    height: 46,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                      color: Color(0xfff2f2f2),
                                                    ),
                                                    child: TextField(
                                                      decoration: InputDecoration(
                                                          contentPadding: EdgeInsets.all(13.0),
                                                          enabledBorder: UnderlineInputBorder(
                                                            borderSide: BorderSide(color: Colors.white),
                                                          ),
                                                          // Only numbers can be entered
                                                          hintText: 'Fahipay PVT LTD',
                                                          suffixIcon: Container(
                                                            width: 11,
                                                            height: 46,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                              gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                                                            ),
                                                            child: IconButton(
                                                              icon: Icon(FontAwesomeIcons.solidClone, color: Colors.white, size: 16),
                                                              onPressed: () {
                                                              },
                                                            ),
                                                          )
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),

                                            SizedBox(
                                              height: 14,
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
                                                        child: Text(AppLocalizations.of(context)!.accountName, style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400))
                                                    ),
                                                  ),
                                                )
                                            ),
                                            SizedBox(
                                              height: 14,
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
                                                  child: Container(
                                                    height: 46,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                      color: Color(0xfff2f2f2),
                                                    ),
                                                    child: TextField(
                                                      decoration: InputDecoration(
                                                          contentPadding: EdgeInsets.all(13.0),
                                                          enabledBorder: UnderlineInputBorder(
                                                            borderSide: BorderSide(color: Colors.white),
                                                          ),
                                                          // Only numbers can be entered
                                                          hintText: '90101480013752000 (MVR)',
                                                          suffixIcon: Container(
                                                            width: 11,
                                                            height: 46,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                              gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                                                            ),
                                                            child: IconButton(
                                                              icon: Icon(FontAwesomeIcons.solidClone, color: Colors.white, size: 16),
                                                              onPressed: () {
                                                              },
                                                            ),
                                                          )
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
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
                                                  child: Container(
                                                    height: 46,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                      color: Color(0xfff2f2f2),
                                                    ),
                                                    child: TextField(
                                                      decoration: InputDecoration(
                                                          contentPadding: EdgeInsets.all(13.0),
                                                          enabledBorder: UnderlineInputBorder(
                                                            borderSide: BorderSide(color: Colors.white),
                                                          ),
                                                          // Only numbers can be entered
                                                          hintText: '90101480013752000 (USD)',
                                                          suffixIcon: Container(
                                                            width: 11,
                                                            height: 46,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                              gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                                                            ),
                                                            child: IconButton(
                                                              icon: Icon(FontAwesomeIcons.solidClone, color: Colors.white, size: 16),
                                                              onPressed: () {
                                                              },
                                                            ),
                                                          )
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),

                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children: [
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
                                                        width: 68,
                                                        height: 68,
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
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            GradientText(
                                                                text: '2',
                                                                style: TextStyle(color: Colors.white,fontSize: 26,fontWeight: FontWeight.w700),
                                                                gradient: const LinearGradient(
                                                                    colors: [
                                                                      Color(0xff3AC170),
                                                                      Color(0xff25BFA3),
                                                                    ],
                                                                    transform: GradientRotation(math.pi * 0.50)
                                                                )
                                                            ),
                                                            GradientText(
                                                                text: AppLocalizations.of(context)!.step,
                                                                style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w700),
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
                                                  ),
                                                ),
                                                Expanded(
                                                  child: SlideTransition(
                                                    position: Tween<Offset>(
                                                      begin: Offset(2, 0),
                                                      end: Offset.zero,
                                                    ).animate(_animationController),
                                                    child: FadeTransition(
                                                      opacity: _animationController,
                                                      child: DottedBorder(
                                                        borderType: BorderType.RRect,
                                                        color: Color(0xff25bfa0),
                                                        radius: Radius.circular(12),
                                                        //padding: const EdgeInsets.all(0),
                                                        dashPattern: [16, 4],
                                                        child: ClipRRect(
                                                          borderRadius: BorderRadius.all(Radius.circular(12)),
                                                          child: Container(
                                                            //width: 282,
                                                            constraints: BoxConstraints(
                                                                maxWidth: 282
                                                            ),
                                                            height: 62,
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                GradientIcon(
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
                                                                Expanded(
                                                                  child: Container(
                                                                    //width: 200,
                                                                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                                                                      alignment: Alignment.center,
                                                                      height: double.infinity,
                                                                      constraints: BoxConstraints(
                                                                        maxWidth: 180,
                                                                      ),
                                                                      child: Text(
                                                                          AppLocalizations.of(context)!.uploadTransferReceipt,
                                                                          style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400)
                                                                      )
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            ScaleTransition(
                                              scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutBack)),
                                              child: Container(
                                                width: double.infinity,
                                                height: 55,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      const Color(0xff3AC170),
                                                      const Color(0xff25BFA3),
                                                    ],
                                                  ),
                                                ),
                                                child: Text(AppLocalizations.of(context)!.or, style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700, color: Colors.white)),
                                              ),
                                            ),
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
                                                        child: Text(AppLocalizations.of(context)!.referenceNumberFirstText, style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400)
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
                                                  begin: Offset(2, 0),
                                                  end: Offset.zero,
                                                ).animate(_animationController),
                                                child: FadeTransition(
                                                  opacity: _animationController,
                                                  child: TextfieldTextWidget(
                                                      hintText: AppLocalizations.of(context)!.referenceNumber
                                                  ),
                                                ),
                                              ),
                                            ),
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
                                                        child: Text(AppLocalizations.of(context)!.transferredAmount, style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400))
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
                                                  begin: Offset(2, 0),
                                                  end: Offset.zero,
                                                ).animate(_animationController),
                                                child: FadeTransition(
                                                  opacity: _animationController,
                                                  child: TextfieldTextWidget(
                                                      hintText: AppLocalizations.of(context)!.transferredAmount
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                              child: ScaleTransition(
                                                scale: _tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutBack)),
                                                child: ButtonWidget(
                                                    buttonText: AppLocalizations.of(context)!.claim
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



//class that makes text have gradient
class GradientText extends StatelessWidget {
  final String text;
  final Gradient gradient;
  final TextStyle? style;

  const GradientText({
    Key? key,
    required this.text,
    required this.gradient,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return gradient
            .createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height));
      },
      child: Text(
        text,
        style: style,
      ),
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
        width: size * 1.4,
        height: size * 1.4,
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


//class that makes icons have gradient. Used in navbar/appbar
class RadiantGradientMask extends StatelessWidget {
  final Widget child;
  RadiantGradientMask({Key? key,
    required this.child
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => RadialGradient(
        center: Alignment.center,
        radius: 0.5,
        colors: [Color(0xff3AC170), Color(0xff25BFA3)],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}