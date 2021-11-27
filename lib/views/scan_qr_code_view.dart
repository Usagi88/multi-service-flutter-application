import 'package:flutter/material.dart';
import 'package:fpapp/widgets/sidemenu_widget.dart';
import 'package:flutter/services.dart';

class ScanQRCodeView extends StatefulWidget {
  const ScanQRCodeView({Key? key}) : super(key: key);

  @override
  _ScanQRCodeViewState createState() => _ScanQRCodeViewState();
}

class _ScanQRCodeViewState extends State<ScanQRCodeView> {
  @override
  Widget build(BuildContext context) {
    var safePadding = MediaQuery.of(context).padding.top;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _portraitModeOnly(context, safePadding);
  }
}

//portrait
Scaffold _portraitModeOnly(BuildContext context,safePadding) {
  return Scaffold(
    drawer: SideMenu(),
    body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height - (safePadding),
          width: MediaQuery.of(context).size.width,
          color: Color(0xff2F2F2F),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Container(
                  width: double.infinity,
                  height: 317,
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
              ),
              SizedBox(
                height: 30,
              ),
              Text('Aim the QR inside this Box',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),),
            ],
          )
        )
      )
    )
  );
}