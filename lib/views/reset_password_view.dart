import 'package:flutter/material.dart';
import 'package:fpapp/widgets/button_widget.dart';
import 'package:fpapp/widgets/clickable_link_widget.dart';
import '/widgets/textfield_number_widget.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      if (MediaQuery.of(context).orientation == Orientation.portrait){
        return _portraitModeOnly(context);
      }else{
        return _landscapeModeOnly(context);
      }
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
                height: MediaQuery.of(context).size.height * 0.35,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/forgot-password.png'),
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
                  'Reset Password',
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal:20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Enter your registered mobile number to receive the password reset code',
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400
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
                    buttonText: 'Request reset'
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
                    clickableLinkText: 'Click here if you already have the code'
                ),
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

//landscape mode
Scaffold _landscapeModeOnly(BuildContext context) {
  return Scaffold(
    body: SafeArea(
      child: SingleChildScrollView(
        child: Column(//not putting padding on column because logo image requires different padding
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20.0),
              child: Container(
                //height: 150,
                height: MediaQuery.of(context).size.height * 0.45,
                width: MediaQuery.of(context).size.width * 0.25,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/forgot-password.png'),
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
                  'Reset Password',
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal:20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Enter your registered mobile number to receive the password reset code',
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400
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
                    buttonText: 'Request reset'
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
                    clickableLinkText: 'Click here if you already have the code'
                ),
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