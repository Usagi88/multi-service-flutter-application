import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class ServiceCard extends StatelessWidget {
  String serviceCardText;
  String serviceCardImage;
  AnimationController? animationController;
  Tween<double> _tween = Tween(begin: 0.1, end: 1);
  ServiceCard({Key? key,
    required this.serviceCardText,
    required this.serviceCardImage,
    this.animationController
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
  Expanded _portraitModeOnly(BuildContext context) {
    if(animationController != null) {
      return Expanded(
        child: ScaleTransition(
          scale: _tween.animate(CurvedAnimation(parent: animationController!, curve: Curves.easeInOutBack)),
          child: Container(
            //width: 166,
            //padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                  height: MediaQuery.of(context).size.width > 350 ? 56 : 42,
                  width: MediaQuery.of(context).size.width > 350 ? 56 : 42,
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
                Expanded(
                  child: Text(
                    serviceCardText,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width > 350 ? 14 : 12,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Expanded(
        child: Container(
          //width: 166,
          //padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                height: 56,
                width: 56,
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
              Expanded(
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
        ),
      );
    }

  }
}
