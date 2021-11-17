import 'package:flutter/material.dart';
import 'package:fpapp/widgets/button_widget.dart';
import 'package:fpapp/widgets/clickable_link_widget.dart';
import 'package:fpapp/widgets/textfield_text_widget.dart';
import 'package:fpapp/widgets/warning_text_widget.dart';
import '/widgets/textfield_number_widget.dart';
import 'package:flutter/services.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

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
Scaffold _portraitModeOnly(BuildContext context) {
  return Scaffold(
    body: SafeArea(
      child: SingleChildScrollView(
        child: Column(//not putting padding on column because logo image requires different padding
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20.0),
              child: Container(
                //height: 150,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/registration.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  //height: 150,
                  height: 34,
                  width: 152,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/fahipay-logo.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width * 0.50,
                  color: Color(0xffE0E0E0),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left:20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Register',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextfieldTextWidget(
                  hintText: 'ID Card Number',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextfieldTextWidget(
                  hintText: 'Full Name',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextfieldNumberWidget(
                  hintText: 'Mobile Number',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: ButtonWidget(
                    buttonText: 'Register'
                ),
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
                    clickableLinkText: 'Already have an account? Click here to go to login'
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:20.0),
              child: WarningText(
                warningText: 'Already have an account? Click here to go to login',
                warningTextBottomColor: 0xffE03838
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

//landscape mode
/*
  Scaffold _landscapeModeOnly(BuildContext context) {
  return Scaffold(
    body: SafeArea(
      child: SingleChildScrollView(
        child: Column(//not putting padding on column because logo image requires different padding
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20.0),
              child: Container(
                //height: 150,
                height: MediaQuery.of(context).size.height * 0.45,
                width: MediaQuery.of(context).size.width * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/registration.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  //height: 150,
                  height: 34,
                  width: 152,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/fahipay-logo.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width * 0.30,
                  color: Color(0xffE0E0E0),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left:20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Register',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextfieldTextWidget(
                  hintText: 'ID Card Number',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextfieldTextWidget(
                  hintText: 'Full Name',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextfieldNumberWidget(
                  hintText: 'Mobile Number',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: ButtonWidget(
                    buttonText: 'Register'
                ),
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
                    clickableLinkText: 'Already have an account? Click here to go to login'
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:20.0),
              child: WarningText(
                  warningText: 'Note you dont have to register again if you already have an account',
                  warningTextBottomColor: 0xffE03838
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ),
  );
}
 */
