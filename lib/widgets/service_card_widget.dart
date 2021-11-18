import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class ServiceCard extends StatelessWidget {
  String serviceCardText;
  String serviceCardImage;
  ServiceCard({Key? key,
    required this.serviceCardText,
    required this.serviceCardImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _portraitModeOnly(context);
  }
  //portrait mode
  Container _portraitModeOnly(BuildContext context) {
    return Container(
      width: 166,
      height: 84,
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
      child: Row(
        children: [
          SizedBox(
            width: 8,
          ),
          Container(
            height: 57,
            width: 60,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    serviceCardImage),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: VerticalDivider(
              thickness: 1,
              color: Colors.grey.shade400,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            width: 59,
            height: 43,
            alignment: Alignment.center,
            child: Text(
              serviceCardText,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600,fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            width: 2,
          ),
        ],
      ),
    );
  }
}
