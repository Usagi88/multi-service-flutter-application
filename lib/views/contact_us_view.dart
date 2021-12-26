import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fpapp/classes/gradient_icon.dart';
import 'package:fpapp/widgets/navbar_widget.dart';
import 'package:fpapp/widgets/navbar_with_back_button_widget.dart';
import 'package:fpapp/widgets/sidemenu_widget.dart';
import 'package:fpapp/widgets/banner_widget.dart';
import 'package:fpapp/widgets/social_media_button_widget.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactUsView extends StatefulWidget {
  const ContactUsView({Key? key}) : super(key: key);

  @override
  State<ContactUsView> createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> with TickerProviderStateMixin{

  static const _initialDelayTime = Duration(milliseconds: 50);
  static const _itemSlideTime = Duration(milliseconds: 250);
  static const _staggerTime = Duration(milliseconds: 50);
  static const _buttonDelayTime = Duration(milliseconds: 150);
  static const _buttonTime = Duration(milliseconds: 500);
  final _animationDuration = _initialDelayTime +
      (_staggerTime * 4) +
      _buttonDelayTime +
      _buttonTime;

  AnimationController? _animationController;
  Tween<double> _tween = Tween(begin: 0.1, end: 1);
  final List<Interval> _itemSlideIntervals = [];
  late AnimationController _staggeredController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),

    );
    _createAnimationIntervals();
    _staggeredController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..forward();

    Timer(Duration(milliseconds: 250), () => _animationController!.forward());
    //_animationController!.forward();
    super.initState();
  }

  void _createAnimationIntervals() {
    for (var i = 0; i < 4; ++i) {
      final startTime = _initialDelayTime + (_staggerTime * i);
      final endTime = startTime + _itemSlideTime;
      _itemSlideIntervals.add(
        Interval(
          startTime.inMilliseconds / _animationDuration.inMilliseconds,
          endTime.inMilliseconds / _animationDuration.inMilliseconds,
        ),
      );
    }

    final buttonStartTime =
        Duration(milliseconds: (4 * 50)) + _buttonDelayTime;

  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _portraitModeOnly(context, _animationController, _tween);
  }
  //portrait
  Scaffold _portraitModeOnly(BuildContext context, _animationController, _tween) {
    return Scaffold(
      appBar: NavbarWithBackButton(),
      drawer: SideMenu(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(//not putting padding on column because logo image requires different padding
            children: [
              Stack(
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
                    BannerWidget(
                      bannerIcon: FontAwesomeIcons.wallet,
                      bannerAmount: 20320.20,
                      bannerPoints: 200,
                      animationController: _animationController,
                    ),
                  ]
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children:[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(-1, 0),
                        end: Offset.zero,
                      ).animate(_animationController),
                      child: FadeTransition(
                        opacity: _animationController,
                        child: Text(AppLocalizations.of(context)!.contactUs,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(2, 0),
                        end: Offset.zero,
                      ).animate(_animationController),
                      child: FadeTransition(
                        opacity: _animationController,
                        child: const SizedBox(
                          height: 1.0,
                          child: const DecoratedBox(
                            decoration: const BoxDecoration(
                                color: Color(0xffcccccc)
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                minLeadingWidth: 10,
                leading: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                    opacity: _animationController,
                    child: GradientIcon(
                      FontAwesomeIcons.phoneAlt,
                      24.0,
                      LinearGradient(
                        colors: <Color>[
                          Color(0xff3AC170),
                          Color(0xff25BFA3),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                ),
                title: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(0, 1),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                      opacity: _animationController,
                      child: Text("4007004",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),)
                  ),
                ),
              ),
              ListTile(
                minLeadingWidth: 10,
                leading: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                    opacity: _animationController,
                    child: GradientIcon(
                      FontAwesomeIcons.solidEnvelope,
                      24.0,
                      LinearGradient(
                        colors: <Color>[
                          Color(0xff3AC170),
                          Color(0xff25BFA3),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                ),
                title: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(0, 1),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                      opacity: _animationController,
                      child: Text("info@fahipay.mv",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),)
                  ),
                ),
              ),
              ListTile(
                minLeadingWidth: 10,
                leading: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                    opacity: _animationController,
                    child: GradientIcon(
                      FontAwesomeIcons.globe,
                      24.0,
                      LinearGradient(
                        colors: <Color>[
                          Color(0xff3AC170),
                          Color(0xff25BFA3),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                ),
                title: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(0, 1),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                      opacity: _animationController,
                      child: Text("www.fahipay.mv",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),)
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children:[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(-1, 0),
                        end: Offset.zero,
                      ).animate(_animationController),
                      child: FadeTransition(
                        opacity: _animationController,
                        child: Text(
                          AppLocalizations.of(context)!.socialMediaHandles,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(2, 0),
                        end: Offset.zero,
                      ).animate(_animationController),
                      child: FadeTransition(
                        opacity: _animationController,
                        child: const SizedBox(
                          height: 1.0,
                          child: const DecoratedBox(
                            decoration: const BoxDecoration(
                                color: Color(0xffcccccc)
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children:[
                    ..._buildListItems()
                  ],
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

  List<Widget> _buildListItems() {
    final listItems = <Widget>[];
    for (var i = 0; i < 4; ++i) {
      listItems.add(
        AnimatedBuilder(
          animation: _staggeredController,
          builder: (context, child) {
            final animationPercent = Curves.elasticOut.transform(
                _itemSlideIntervals[i].transform(_staggeredController.value));
            final opacity = animationPercent.clamp(0.0, 1.0);
            final scale = (animationPercent * 0.5) + 0.5;

            return Opacity(
              opacity: opacity,
              child: Transform.scale(
                scale: scale,
                child: child,
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: SocialMediaButton(
              socialMediaIcon: FontAwesomeIcons.facebookF,
            ),
          ),
        ),
      );
    }
    return listItems;
  }
}



