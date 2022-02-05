import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fpapp/provider/locale_provider.dart';
import 'package:fpapp/views/about_view.dart';
import 'package:fpapp/views/bill_pay_view.dart';
import 'package:fpapp/views/bonus_view.dart';
import 'package:fpapp/views/cash_in_view.dart';
import 'package:fpapp/views/contact_us_view.dart';
import 'package:fpapp/views/donate_view.dart';
import 'package:fpapp/views/fahisend_view.dart';
import 'package:fpapp/views/gift_card_view.dart';
import 'package:fpapp/views/home_view.dart';
import 'package:fpapp/views/invite_friends_view.dart';
import 'package:fpapp/views/live_chat_view.dart';
import 'package:fpapp/views/maldive_gas_view.dart';
import 'package:fpapp/views/payment_to_merchant_view.dart';
import 'package:fpapp/views/profile_view.dart';
import 'package:fpapp/views/register_view.dart';
import 'package:fpapp/views/reset_password_view.dart';
import 'package:fpapp/views/rol_bill_pay_view.dart';
import 'package:fpapp/views/scan_qr_code_view.dart';
import 'package:fpapp/views/schedule_payments_view.dart';
import 'package:fpapp/views/send_sms_view.dart';
import 'package:fpapp/views/package_recharge_view.dart';
import 'package:fpapp/views/services_view.dart';
import 'package:fpapp/views/settings_view.dart';
import 'package:fpapp/views/slip_view.dart';
import 'package:fpapp/views/top_up_via_bml_gateway_view.dart';
import 'package:fpapp/views/top_up_via_view.dart';
import 'package:fpapp/views/transaction_history_full.dart';
import 'package:fpapp/views/wholesale_view.dart';
import 'package:provider/provider.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'classes/dv_global_localizations.dart';
import 'classes/dv_intl.dart';
import 'views/add_cash_view.dart';
import 'views/medianet_bill_pay_view.dart';
import 'views/mwsc_bill_pay.dart';
import 'views/pubg_view.dart';
import 'views/raastas_reload_view.dart';

void main() {
  runApp(RestartWidget(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      child: Consumer<LocaleProvider>(builder: (context, locale, child) {
        var lang = locale.locale;
        return MaterialApp(
          theme: ThemeData(
              fontFamily: lang.toString() == 'dv' ? 'Faruma' : null,
              /*
                pageTransitionsTheme: PageTransitionsTheme(builders: {
                    TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
                    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                }),
                 */
              scaffoldBackgroundColor: Colors.white),
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            DvGlobalWidgetsLocalizations.delegate,
            // custom class to recognize dhivehi
            DvMaterialLocalizations.delegate,
            // add the newly created delegate
          ],

          supportedLocales: AppLocalizations.supportedLocales,
          locale: locale.locale,
          //initialRoute: '/home',
          routes: <String, WidgetBuilder>{
            '/about': (BuildContext context) => new AboutView(),
            '/contact-us': (context) => new ContactUsView(),
            '/gift-card': (context) => new GiftCardView(),
            '/home': (context) => new HomeView(),
            '/invite-friends': (context) => new InviteFriendsView(),
            '/live-chat': (context) => new LiveChatView(),
            '/profile': (context) => new ProfileView(),
            '/register': (context) => new RegisterView(),
            '/reset-password': (context) => new ResetPasswordView(),
            '/send-sms': (context) => new SendSmsView(),
            '/package-recharge': (context) => new PackageRechargeView(),
            '/services': (context) => new ServicesView(),
            '/scan-qr-code': (context) => new ScanQRCodeView(),
            '/transaction-history': (context) =>
                new TransactionHistoryFullView(),
            '/fahi-send': (context) => new FahisendView(),
            '/add-cash': (context) => new AddCashView(),
            '/top-up-via-bml-gateway': (context) =>
                new TopUpViaBMLGatewayView(),
            '/top-up-via': (context) => new TopUpViaView(),
            '/scheduled-payments': (context) => new ScheduledPaymentsView(),
            '/raastas-reload': (context) => new RaastasReloadView(),
            '/bill-pay': (context) => new BillPayView(),
            '/cash-in': (context) => new CashInView(),
            '/rol-bill-pay': (context) => new RolBillPayView(),
            '/pubg': (context) => new PubGView(),
            '/mwsc-bill-pay': (context) => new MwscBillPayView(),
            '/medianet-bill-pay': (context) => new MedianetBillPayView(),
            '/maldive-gas': (context) => new MaldiveGasView(),
            '/donate': (context) => new DonateView(),
            '/bonus': (context) => new BonusView(),
            '/settings': (context) => new SettingsView(),
            '/wholesale': (context) => new WholesaleView(),
            '/payment-to-merchant': (context) => new PaymentToMerchantView(),
          },
          home: HomeView(),
        );
      }),
    );
  }
}

class RestartWidget extends StatefulWidget {
  RestartWidget({required this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()?.restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
