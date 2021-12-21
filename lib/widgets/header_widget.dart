import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';

class Header extends StatelessWidget {
  AnimationController? animationController;
  Tween<double> _tween = Tween(begin: 0.1, end: 1);
  Header({Key? key,
    this.animationController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _portraitModeOnly(context);
  }
  //portrait
  Stack _portraitModeOnly(BuildContext context){
    return Stack(
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
        if(animationController != null) ...[
          Positioned(
            left: MediaQuery.of(context).size.width * 0.24,
            right: 0,
            top: 30,
            child: ListTile(
              minLeadingWidth: 10,
              leading: ScaleTransition(
                scale: _tween.animate(CurvedAnimation(parent: animationController!, curve: Curves.easeInOutBack)),
                child: Icon(FontAwesomeIcons.userAlt,
                  size: 32,
                  color: Colors.white,
                ),
              ),
              title: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(0, -1),
                  end: Offset.zero,
                ).animate(animationController!),
                child: FadeTransition(
                  opacity: animationController!,
                  child: Text("Ibrahim Naish",
                      style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700)),
                ),
              ),
              subtitle: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(0, 1),
                  end: Offset.zero,
                ).animate(animationController!),
                child: FadeTransition(
                  opacity: animationController!,
                  child: Text("A327029",
                      style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700)
                  ),
                ),
              ),
              dense: true,
            ),
          ),
        ] else ...[
          Positioned(
            left: MediaQuery.of(context).size.width * 0.24,
            right: 0,
            top: 30,
            child: ListTile(
              minLeadingWidth: 10,
              leading: Icon(FontAwesomeIcons.userAlt,
                size: 32,
                color: Colors.white,
              ),
              title: Text("Ibrahim Naish",
                  style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700)),
              subtitle: Text("A327029",
                  style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700)
              ),
              dense: true,
            ),
          ),
        ]
      ]
    );
  }

  //landscape
  /*
    Stack _landscapeModeOnly(BuildContext context){
    return Stack(
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
          Positioned(
            left: MediaQuery.of(context).size.width * 0.35,
            right: 0,
            top: 30,
            child: ListTile(
              minLeadingWidth: 10,
              leading: Icon(FontAwesomeIcons.userAlt,
                size: 32,
                color: Colors.white,
              ),
              title: Text("Ibrahim Naish",
                  style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700)),
              subtitle: Text("A327029",
                  style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700)
              ),
              dense: true,
            ),
          ),
        ]
    );
  }
   */

}

