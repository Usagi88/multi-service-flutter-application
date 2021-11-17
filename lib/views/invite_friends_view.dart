import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fpapp/widgets/clickable_link_widget.dart';
import 'package:fpapp/widgets/navbar_widget.dart';
import 'package:fpapp/widgets/sidemenu_widget.dart';
import 'package:flutter/services.dart';

class InviteFriendsView extends StatelessWidget {
  const InviteFriendsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _portraitModeOnly(context);
  }
}

//portrait mode
Scaffold _portraitModeOnly(BuildContext context){
  return Scaffold(
      appBar: Navbar(),
      drawer: SideMenu(),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
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
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20.0),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 182,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                            ),
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xff3AC170),
                                const Color(0xff25BFA3),
                              ],
                            ),
                          ),
                          child: Text('Invite',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 182,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                            ),

                            gradient: LinearGradient(
                              colors: [
                                const Color(0xffffffff),
                                const Color(0xffffffff),
                              ],
                            ),
                          ),
                          child: Text('Referrals',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:20.0,right: 27.3),
                    child: Container(
                      width: double.infinity,
                      color: Colors.grey.shade300,
                      height: 1,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'How it works!',
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
                                child: Text('Invite your friends!',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width * 0.6,
                                  child: Text('Simply Share your referral link!',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, color: Color(0xff929292)))
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
                                child: Text('Your friends join and use FahiPay!',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width * 0.6,
                                  child: Text('Your Friend gets MVR 10.00',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, color: Color(0xff929292)))
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
                                child: Text('Earn money!',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width * 0.6,
                                  child: Text('You earn MVR 10.00',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, color: Color(0xff929292)))
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
                            label: Text('Share link',style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),),
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
                          clickableLinkText: 'Terms and conditions'
                      ),
                    ),
                  ),
                ],
              )
          )
      )
  );
}