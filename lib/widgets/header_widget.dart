import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';
import 'package:fpapp/provider/locale_provider.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  AnimationController? animationController;
  Tween<double> _tween = Tween(begin: 0.1, end: 1);
  Header({Key? key,
    this.animationController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var language = Provider.of<LocaleProvider>(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _portraitModeOnly(context, language);
  }
  //portrait
  Stack _portraitModeOnly(BuildContext context, language){
    if (language.locale.toString() == 'dv' || language.locale.toString() == 'ar'){
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
                left: 0,
                right: MediaQuery.of(context).size.width > 350 ? MediaQuery.of(context).size.width * 0.24 : MediaQuery.of(context).size.width * 0.20,
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
                          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700, fontFamily: 'Roboto')),
                    ),
                  ),
                  subtitle: SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(0, 1),
                      end: Offset.zero,
                    ).animate(animationController!),
                    child: FadeTransition(
                      opacity: animationController!,
                      child: Text("A000001",
                          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700, fontFamily: 'Roboto')
                      ),
                    ),
                  ),
                  dense: true,
                ),
              ),
            ] else ...[
              Positioned(
                left: MediaQuery.of(context).size.width > 350 ? MediaQuery.of(context).size.width * 0.24 : MediaQuery.of(context).size.width * 0.20,
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
                  subtitle: Text("A000001",
                      style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700)
                  ),
                  dense: true,
                ),
              ),
            ]
          ]
      );
    }
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
            left: MediaQuery.of(context).size.width > 350 ? MediaQuery.of(context).size.width * 0.24 : MediaQuery.of(context).size.width * 0.20,
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
                  child: Text("A000001",
                      style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700)
                  ),
                ),
              ),
              dense: true,
            ),
          ),
        ] else ...[
          Positioned(
            left: MediaQuery.of(context).size.width > 350 ? MediaQuery.of(context).size.width * 0.24 : MediaQuery.of(context).size.width * 0.20,
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
              subtitle: Text("A000001",
                  style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700)
              ),
              dense: true,
            ),
          ),
        ]
      ]
    );
  }

}

