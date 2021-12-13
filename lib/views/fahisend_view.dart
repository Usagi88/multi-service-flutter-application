import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fpapp/widgets/banner_widget.dart';
import 'package:fpapp/widgets/button_widget.dart';
import 'package:fpapp/widgets/navbar_with_back_button_widget.dart';
import 'package:fpapp/widgets/sidemenu_widget.dart';
import 'package:flutter/services.dart';
import 'package:fpapp/widgets/textfield_number_widget.dart';
import 'package:fpapp/widgets/textfield_text_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FahisendView extends StatelessWidget {
  const FahisendView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _portraitModeOnly(context);
  }
}


//portrait
Scaffold _portraitModeOnly(BuildContext context) {
  return Scaffold (
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
                  ),
                ]
            ),
            SizedBox(
              height: 6,
            ),
            Container(
              width: 126,
              height: 126,
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
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
              child: Text(AppLocalizations.of(context)!.fahiSendViewFirstText,
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600,fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 56,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Container(
                      height: 46,
                      width: MediaQuery.of(context).size.width * 0.43,
                      constraints: BoxConstraints(
                          maxWidth: 177
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                      ),
                      child: TextButton.icon(
                          label: Text(AppLocalizations.of(context)!.qrScan, style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),),
                          icon: Icon(FontAwesomeIcons.qrcode, color: Colors.white, size: 22,),
                          onPressed: () {

                          }
                      )
                  ),
                  Spacer(),
                  Container(
                      height: 46,
                      width: MediaQuery.of(context).size.width * 0.43,
                      constraints: BoxConstraints(
                          maxWidth: 177
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        gradient: LinearGradient(colors: [Color(0xff3AC170), Color(0xff25BFA3)]),
                      ),
                      child: TextButton.icon(
                          label: Text(AppLocalizations.of(context)!.pickContact, style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),),
                          icon: Icon(FontAwesomeIcons.phoneAlt, color: Colors.white, size: 22),
                          onPressed: () {

                          }
                      )
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 90,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextfieldTextWidget(hintText: AppLocalizations.of(context)!.emailOrContactNumber),
            ),
            SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextfieldNumberWidget(
                hintText: AppLocalizations.of(context)!.amount,
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ButtonWidget(
                buttonText: AppLocalizations.of(context)!.submit,
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