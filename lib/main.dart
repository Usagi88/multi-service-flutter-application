import 'package:flutter/material.dart';
import 'package:fpapp/views/about_view.dart';
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
import 'package:fpapp/views/send_sms_view.dart';
import 'package:fpapp/views/service_details_view.dart';
import 'package:fpapp/views/services_view.dart';
import 'package:fpapp/views/slip_view.dart';
import 'package:fpapp/views/top_up_via_mib_view.dart';
import 'package:fpapp/views/transaction_history_full.dart';

void main() {

  runApp(MaterialApp(
    home: const TopUpViaMIB(),
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
      '/service-details': (BuildContext context) => new ServiceDetailsView(),
      '/services': (BuildContext context) => new ServicesView(),

    },
  ));
}