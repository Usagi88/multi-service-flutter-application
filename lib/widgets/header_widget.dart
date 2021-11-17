import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait){
      return _portraitModeOnly(context);
    }else{
      return _landscapeModeOnly(context);
    }
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
    );
  }

  //landscape
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
}

