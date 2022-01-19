import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fpapp/provider/locale_provider.dart';
import 'package:fpapp/views/about_view.dart';
import 'package:fpapp/views/bill_pay_view.dart';
import 'package:fpapp/views/cash_in_view.dart';
import 'package:fpapp/views/contact_us_view.dart';
import 'package:fpapp/views/fahisend_view.dart';
import 'package:fpapp/views/gift_card_view.dart';
import 'package:fpapp/views/home_view.dart';
import 'package:fpapp/views/invite_friends_view.dart';
import 'package:fpapp/views/live_chat_view.dart';
import 'package:fpapp/views/profile_view.dart';
import 'package:fpapp/views/register_view.dart';
import 'package:fpapp/views/reset_password_view.dart';
import 'package:fpapp/views/scan_qr_code_view.dart';
import 'package:fpapp/views/schedule_payments_view.dart';
import 'package:fpapp/views/send_sms_view.dart';
import 'package:fpapp/views/package_recharge_view.dart';
import 'package:fpapp/views/services_view.dart';
import 'package:fpapp/views/slip_view.dart';
import 'package:fpapp/views/top_up_via_bml_gateway_view.dart';
import 'package:fpapp/views/top_up_via_view.dart';
import 'package:fpapp/views/transaction_history_full.dart';
import 'package:provider/provider.dart';


import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'classes/dv_global_localizations.dart';
import 'classes/dv_intl.dart';
import 'views/add_cash_view.dart';
import 'views/raastas_reload_view.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      child: Consumer<LocaleProvider>(
          builder: (context, locale, child) {
            var lang = locale.locale;
            return MaterialApp(
              theme: ThemeData(
                fontFamily: lang.toString() == 'dv' ? 'Faruma' : null,
                pageTransitionsTheme: PageTransitionsTheme(builders: {
                    TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
                    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                }),
                scaffoldBackgroundColor: Colors.white
              ),
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                DvGlobalWidgetsLocalizations.delegate, // custom class to recognize dhivehi
                DvMaterialLocalizations.delegate, // add the newly created delegate
              ],

              supportedLocales: AppLocalizations.supportedLocales,
              locale: locale.locale,
              routes: <String, WidgetBuilder>{
                '/about': (BuildContext context) => new AboutView(),
                '/contact-us': (BuildContext context) => new ContactUsView(),
                '/gift-card': (BuildContext context) => new GiftCardView(),
                '/home': (BuildContext context) => new HomeView(),
                '/invite-friends': (BuildContext context) => new InviteFriendsView(),
                '/live-chat': (BuildContext context) => new LiveChatView(),
                '/profile': (BuildContext context) => new ProfileView(),
                '/register': (BuildContext context) => new RegisterView(),
                '/reset-password': (BuildContext context) => new ResetPasswordView(),
                '/send-sms': (BuildContext context) => new SendSmsView(),
                '/package-recharge': (BuildContext context) => new PackageRechargeView(),
                '/services': (BuildContext context) => new ServicesView(),
                '/scan-qr-code': (BuildContext context) => new ScanQRCodeView(),
                '/transaction-history': (BuildContext context) => new TransactionHistoryFullView(),
                '/fahi-send': (BuildContext context) => new FahisendView(),
                '/add-cash': (BuildContext context) => new AddCashView(),
                '/top-up-via-bml-gateway': (BuildContext context) => new TopUpViaBMLGatewayView(),
                '/top-up-via': (BuildContext context) => new TopUpViaView(),
                '/scheduled-payments': (BuildContext context) => new ScheduledPaymentsView(),
                '/raastas-reload': (BuildContext context) => new RaastasReloadView(),
                '/bill-pay': (BuildContext context) => new BillPayView(),
                '/cash-in': (BuildContext context) => new CashInView(),
              },
              home: CashInView(),
            );
          }
      ),
    );


  }
}