import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fpapp/widgets/banner_widget.dart';
import 'package:fpapp/widgets/clickable_link_widget.dart';
import 'package:fpapp/widgets/navbar_widget.dart';
import 'package:fpapp/widgets/navbar_with_back_button_widget.dart';
import 'package:fpapp/widgets/sidemenu_widget.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InviteFriendsView extends StatelessWidget {
  const InviteFriendsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = NavbarWithBackButton().preferredSize.height;
    var safePadding = MediaQuery.of(context).padding.top;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _portraitModeOnly(context, height, safePadding);
  }
}

//portrait mode
Scaffold _portraitModeOnly(BuildContext context, height, safePadding){
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

                            Positioned(
                              left: 0,
                              right: 0,
                              top: 20,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal:20.0),
                                child: Container(
                                  //height: 150,
                                  height: MediaQuery.of(context).size.height * 0.15,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/inviteFriends.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              right: 0,
                              top: 150,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                                            child: Text(AppLocalizations.of(context)!.invite, style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400)),
                                          ),
                                        ),
                                        Tab(
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(AppLocalizations.of(context)!.referrals, style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400)),
                                          ),
                                        ),
                                      ]
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              right: 0,
                              top: 220,
                              child: Container(
                                height: MediaQuery.of(context).size.height - (height + safePadding + 158),
                                child: TabBarView(
                                  children: [
                                    //invite friends view
                                    SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                AppLocalizations.of(context)!.howItWorks,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w700
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 36,
                                                  height: 36,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                    gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Container(
                                                        width: MediaQuery.of(context).size.width * 0.6,
                                                        child: Text(AppLocalizations.of(context)!.inviteYourFriends,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                                                      ),
                                                      Container(
                                                          width: MediaQuery.of(context).size.width * 0.6,
                                                          child: Text(AppLocalizations.of(context)!.inviteYourFriendsTwo,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, color: Color(0xff929292)))
                                                      ),
                                                    ],
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
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 36,
                                                  height: 36,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                    gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Container(
                                                        width: MediaQuery.of(context).size.width * 0.6,
                                                        child: Text(AppLocalizations.of(context)!.joinAndUse,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                                                      ),
                                                      Container(
                                                          width: MediaQuery.of(context).size.width * 0.6,
                                                          child: Text(AppLocalizations.of(context)!.joinAndUseTwo,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, color: Color(0xff929292)))
                                                      ),
                                                    ],
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
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 36,
                                                  height: 36,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                    gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Container(
                                                        width: MediaQuery.of(context).size.width * 0.6,
                                                        child: Text(AppLocalizations.of(context)!.earnMoney,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                                                      ),
                                                      Container(
                                                          width: MediaQuery.of(context).size.width * 0.6,
                                                          child: Text(AppLocalizations.of(context)!.earnMoneyTwo,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, color: Color(0xff929292)))
                                                      ),
                                                    ],
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
                                            child: Container(
                                              height: MediaQuery.of(context).size.height * 0.053,
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
                                                    // Only numbers can be entered
                                                    hintText: 'www.fahipay.mv',
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
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                            child: Container(
                                                height: MediaQuery.of(context).size.height * 0.053,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                  gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                                                ),
                                                child: TextButton.icon(
                                                    label: Text(AppLocalizations.of(context)!.shareLink,style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),),
                                                    icon: Icon(FontAwesomeIcons.share, color: Colors.white,),
                                                    onPressed: () {

                                                    }
                                                )
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal:20.0),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: ClickableLink(
                                                  clickableLinkText: AppLocalizations.of(context)!.termsAndConditions
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    //referral view
                                    SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Container()
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
                  SizedBox(
                    height: 20,
                  ),






                ],
              )
          )
      )
  );
}