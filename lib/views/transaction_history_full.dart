import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fpapp/widgets/banner_widget.dart';
import 'package:fpapp/widgets/fp_card_widget.dart';
import 'package:fpapp/widgets/navbar_widget.dart';
import 'package:fpapp/widgets/navbar_with_back_button_widget.dart';
import 'package:fpapp/widgets/sidemenu_widget.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class TransactionHistoryFullView extends StatelessWidget {
  const TransactionHistoryFullView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = Navbar().preferredSize.height;
    var safePadding = MediaQuery.of(context).padding.top;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _portraitModeOnly(context, height, safePadding);
  }
}
//portrait
Scaffold _portraitModeOnly(BuildContext context, height, safePadding) {
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
                  ),
                ]
            ),
            Row(
              children:[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    AppLocalizations.of(context)!.transactionHistory,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700
                    ),
                  ),
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
                  width: 20,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                height: MediaQuery.of(context).size.height - (height + safePadding + 224),
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  child: Column(
                    children: [
                      FPCard(
                        fpCardColor: 0xffE03838,
                        title: AppLocalizations.of(context)!.refundedTransaction,
                        date: '19 June 2021  -  17:30',
                        amount: 532,
                        currency: 'MVR',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FPCard(
                        fpCardColor: 0xff0CAF39,
                        title: AppLocalizations.of(context)!.cashDeposit,
                        date: '19 June 2021  -  17:30',
                        amount: 31912.29,
                        currency: 'MVR',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FPCard(
                        fpCardColor: 0xffFFA26B,
                        title: AppLocalizations.of(context)!.serviceRecharge,
                        date: '19 June 2021  -  17:30',
                        amount: 120.50,
                        currency: 'MVR',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FPCard(
                        fpCardColor: 0xffFFA26B,
                        title: AppLocalizations.of(context)!.serviceRecharge,
                        date: '19 June 2021  -  17:30',
                        amount: 520,
                        currency: 'MVR',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FPCard(
                        fpCardColor: 0xffFFA26B,
                        title: AppLocalizations.of(context)!.dhiraaguReload,
                        date: '19 June 2021  -  17:30',
                        amount: 31912.29,
                        currency: 'MVR',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FPCard(
                        fpCardColor: 0xffE03838,
                        title: AppLocalizations.of(context)!.refundedTransaction,
                        date: '19 June 2021  -  17:30',
                        amount: 532,
                        currency: 'MVR',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FPCard(
                        fpCardColor: 0xff0CAF39,
                        title: AppLocalizations.of(context)!.cashDeposit,
                        date: '19 June 2021  -  17:30',
                        amount: 31912.29,
                        currency: 'MVR',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FPCard(
                        fpCardColor: 0xffFFA26B,
                        title: AppLocalizations.of(context)!.serviceRecharge,
                        date: '19 June 2021  -  17:30',
                        amount: 120.50,
                        currency: 'MVR',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FPCard(
                        fpCardColor: 0xffFFA26B,
                        title: AppLocalizations.of(context)!.serviceRecharge,
                        date: '19 June 2021  -  17:30',
                        amount: 520,
                        currency: 'MVR',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FPCard(
                        fpCardColor: 0xffFFA26B,
                        title: AppLocalizations.of(context)!.dhiraaguReload,
                        date: '19 June 2021  -  17:30',
                        amount: 31912.29,
                        currency: 'MVR',
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        )
      )
    )
  );
}