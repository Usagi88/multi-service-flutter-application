import 'package:flutter/material.dart';
import 'package:fpapp/views/about_view.dart';
import 'package:fpapp/views/contact_us_view.dart';
import 'package:fpapp/views/gift_card_view.dart';
import 'package:fpapp/views/home_view.dart';
import 'package:fpapp/views/invite_friends_view.dart';
import 'package:fpapp/views/profile_view.dart';
import 'package:fpapp/views/register_view.dart';
import 'package:fpapp/views/reset_password_view.dart';
import 'package:fpapp/views/send_sms_view.dart';
import 'package:fpapp/views/services_view.dart';

void main() {

  runApp(MaterialApp(
      home: const GiftCardView()
  ));
}