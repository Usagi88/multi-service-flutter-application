import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fpapp/widgets/banner_widget.dart';
import 'package:fpapp/widgets/button_widget.dart';
import 'package:fpapp/widgets/navbar_widget.dart';
import 'package:fpapp/widgets/navbar_with_back_button_widget.dart';
import 'package:fpapp/widgets/receive_message_widget.dart';
import 'package:fpapp/widgets/send_message_widget.dart';
import 'package:fpapp/widgets/sidemenu_widget.dart';
import 'package:fpapp/widgets/textfield_number_widget.dart';
import 'package:fpapp/widgets/textfield_text_widget.dart';
import 'dart:math' as math;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LiveChatView extends StatefulWidget {
  const LiveChatView({Key? key}) : super(key: key);

  @override
  _LiveChatViewState createState() => _LiveChatViewState();
}

class _LiveChatViewState extends State<LiveChatView> {
  @override
  Widget build(BuildContext context) {

    double navBarHeight = Navbar().preferredSize.height;
    var safePadding = MediaQuery.of(context).padding.top;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _portraitModeOnly(context, navBarHeight, safePadding);
  }

  //portrait
  Scaffold _portraitModeOnly(BuildContext context, navBarHeight, safePadding) {
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
                          Text(
                            AppLocalizations.of(context)!.liveChat,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 1,
                            child: const SizedBox(
                              height: 1.0,
                              child: const DecoratedBox(
                                decoration: const BoxDecoration(
                                    color: Color(0xffcccccc)
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
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
                              SendMessage(message: "Hello, i need your help on depositing", time: "19:12",),
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
                          Padding(
                            padding: const EdgeInsets.only(left: 6.0),
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
                              child: Icon(FontAwesomeIcons.locationArrow, size: 22,color: Colors.white,),
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



