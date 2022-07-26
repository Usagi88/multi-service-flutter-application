import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fpapp/classes/gradient_icon.dart';
import 'package:fpapp/classes/radiant_gradient_mask.dart';
import 'package:fpapp/provider/locale_provider.dart';
import 'package:fpapp/widgets/header_widget.dart';
import 'package:fpapp/widgets/navbar_with_back_button_widget.dart';
import 'package:fpapp/widgets/sidemenu_widget.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:fialogs/fialogs.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Tween<double> _tween = Tween(begin: 0.1, end: 1);
  bool _passwordVisible = true;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    Timer(Duration(milliseconds: 250), () => _animationController!.forward());
    _animationController!.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  _togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    var language = Provider.of<LocaleProvider>(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _portraitModeOnly(context, _animationController, _tween, language);
  }

  //portrait
  Scaffold _portraitModeOnly(
      BuildContext context, _animationController, _tween, language) {
    if (language.locale.toString() == 'dv' ||
        language.locale.toString() == 'ar') {
      return Scaffold(
        appBar: NavbarWithBackButton(),
        drawer: SideMenu(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              //not putting padding on column because logo image requires different padding
              children: [
                Header(animationController: _animationController),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: Offset(1, 0),
                          end: Offset.zero,
                        ).animate(_animationController),
                        child: FadeTransition(
                          opacity: _animationController,
                          child: Text(
                            AppLocalizations.of(context)!.profile,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: Offset(1, 0),
                          end: Offset.zero,
                        ).animate(_animationController),
                        child: FadeTransition(
                          opacity: _animationController,
                          child: const SizedBox(
                            height: 1.0,
                            child: const DecoratedBox(
                              decoration:
                                  const BoxDecoration(color: Color(0xffcccccc)),
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
                  height: 10,
                ),
                ListTile(
                  title: SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(1, 0),
                      end: Offset.zero,
                    ).animate(_animationController),
                    child: FadeTransition(
                        opacity: _animationController,
                        child: Text(
                          AppLocalizations.of(context)!.email,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        )),
                  ),
                  subtitle: SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(1, 0),
                      end: Offset.zero,
                    ).animate(_animationController),
                    child: FadeTransition(
                        opacity: _animationController,
                        child: Text('test@gmail.com',
                            style: TextStyle(fontFamily: 'Roboto'))),
                  ),
                  trailing: SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(-1, 0),
                      end: Offset.zero,
                    ).animate(_animationController),
                    child: FadeTransition(
                      opacity: _animationController,
                      child: RadiantGradientMask(
                        child: IconButton(
                          icon: SvgPicture.asset(
                              "assets/images/icon/solid-edit.svg"),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return StatefulBuilder(
                                  builder: (context, setState) {
                                    return AlertDialog(
                                      title: Column(
                                        children: [
                                          Text(
                                            AppLocalizations.of(context)!.password,
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            AppLocalizations.of(context)!.pleaseEnterYourPassword,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                      content: Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextFormField(
                                              obscureText: _passwordVisible,
                                              decoration: InputDecoration(
                                                  labelText: AppLocalizations.of(context)!.password,
                                                  suffixIcon: IconButton(
                                                      icon: _passwordVisible
                                                          ? Icon(FontAwesomeIcons
                                                          .eye)
                                                          : Icon(FontAwesomeIcons
                                                          .eyeSlash),
                                                      onPressed: () {
                                                        setState(() {
                                                          _togglePasswordVisibility();
                                                        });
                                                        print(_passwordVisible);
                                                      })),
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () async {
                                            Navigator.pop(context);
                                            await showDialog(context: context, builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Column(
                                                  children: [
                                                    Text(
                                                      AppLocalizations.of(context)!.newEmail,
                                                      style: TextStyle(
                                                          fontSize: 22,
                                                          fontWeight:
                                                          FontWeight.w600),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      AppLocalizations.of(context)!.enterNewEmail,
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                          FontWeight.w400),
                                                    ),
                                                  ],
                                                ),
                                                content: Container(
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      TextFormField(
                                                        keyboardType: TextInputType.number,
                                                        inputFormatters: <TextInputFormatter>[
                                                          FilteringTextInputFormatter.digitsOnly
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                actions: <Widget>[

                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(AppLocalizations.of(context)!.ok),
                                                  ),
                                                  TextButton(
                                                    style: TextButton.styleFrom(
                                                        primary: Colors.red),
                                                    onPressed: () =>
                                                    {Navigator.pop(context)},
                                                    child: Text(
                                                      AppLocalizations.of(context)!.cancel,
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            });

                                          },
                                          child: Text(AppLocalizations.of(context)!.ok),
                                        ),
                                        TextButton(
                                          style: TextButton.styleFrom(
                                              primary: Colors.red),
                                          onPressed: () =>
                                          {Navigator.pop(context)},
                                          child: Text(
                                            AppLocalizations.of(context)!.cancel,
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),

                                      ],
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(1, 0),
                      end: Offset.zero,
                    ).animate(_animationController),
                    child: FadeTransition(
                        opacity: _animationController,
                        child: Text(AppLocalizations.of(context)!.mobileNumber,
                            style: TextStyle(
                              fontSize: 16,
                            ))),
                  ),
                  subtitle: SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(1, 0),
                      end: Offset.zero,
                    ).animate(_animationController),
                    child: FadeTransition(
                        opacity: _animationController,
                        child: Text('7776777',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                            ))),
                  ),
                  trailing: SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(-1, 0),
                      end: Offset.zero,
                    ).animate(_animationController),
                    child: FadeTransition(
                      opacity: _animationController,
                      child: RadiantGradientMask(
                        child: IconButton(
                          icon: SvgPicture.asset(
                              "assets/images/icon/solid-edit.svg"),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return StatefulBuilder(
                                  builder: (context, setState) {
                                    return AlertDialog(
                                      title: Column(
                                        children: [
                                          Text(
                                            AppLocalizations.of(context)!.password,
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            AppLocalizations.of(context)!.pleaseEnterYourPassword,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                      content: Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextFormField(
                                              obscureText: _passwordVisible,
                                              decoration: InputDecoration(
                                                  labelText: AppLocalizations.of(context)!.password,
                                                  suffixIcon: IconButton(
                                                      icon: _passwordVisible
                                                          ? Icon(FontAwesomeIcons
                                                          .eye)
                                                          : Icon(FontAwesomeIcons
                                                          .eyeSlash),
                                                      onPressed: () {
                                                        setState(() {
                                                          _togglePasswordVisibility();
                                                        });
                                                        print(_passwordVisible);
                                                      })),
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () async {
                                            Navigator.pop(context);
                                            await showDialog(context: context, builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Column(
                                                  children: [
                                                    Text(
                                                      AppLocalizations.of(context)!.newMobileNumber,
                                                      style: TextStyle(
                                                          fontSize: 22,
                                                          fontWeight:
                                                          FontWeight.w600),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      AppLocalizations.of(context)!.enterNewMobileNumber,
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                          FontWeight.w400),
                                                    ),
                                                  ],
                                                ),
                                                content: Container(
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      TextFormField(
                                                        keyboardType: TextInputType.number,
                                                        inputFormatters: <TextInputFormatter>[
                                                          FilteringTextInputFormatter.digitsOnly
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                actions: <Widget>[

                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(AppLocalizations.of(context)!.ok),
                                                  ),
                                                  TextButton(
                                                    style: TextButton.styleFrom(
                                                        primary: Colors.red),
                                                    onPressed: () =>
                                                    {Navigator.pop(context)},
                                                    child: Text(
                                                      AppLocalizations.of(context)!.cancel,
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            });

                                          },
                                          child: Text(AppLocalizations.of(context)!.ok),
                                        ),
                                        TextButton(
                                          style: TextButton.styleFrom(
                                              primary: Colors.red),
                                          onPressed: () =>
                                          {Navigator.pop(context)},
                                          child: Text(
                                            AppLocalizations.of(context)!.cancel,
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),

                                      ],
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(1, 0),
                      end: Offset.zero,
                    ).animate(_animationController),
                    child: FadeTransition(
                        opacity: _animationController,
                        child: Text(AppLocalizations.of(context)!.address,
                            style: TextStyle(
                              fontSize: 16,
                            ))),
                  ),
                  subtitle: SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(1, 0),
                      end: Offset.zero,
                    ).animate(_animationController),
                    child: FadeTransition(
                        opacity: _animationController,
                        child: Text('Nowhere',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                            ))),
                  ),
                  trailing: SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(-1, 0),
                      end: Offset.zero,
                    ).animate(_animationController),
                    child: FadeTransition(
                      opacity: _animationController,
                      child: RadiantGradientMask(
                        child: IconButton(
                          icon: SvgPicture.asset(
                              "assets/images/icon/solid-edit.svg"),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return StatefulBuilder(
                                  builder: (context, setState) {
                                    return AlertDialog(
                                      title: Column(
                                        children: [
                                          Text(
                                            AppLocalizations.of(context)!.newAddress,
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight:
                                                FontWeight.w600),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            AppLocalizations.of(context)!.enterNewAddress,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight:
                                                FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                      content: Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextFormField(

                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(AppLocalizations.of(context)!.ok),
                                        ),
                                        TextButton(
                                          style: TextButton.styleFrom(
                                              primary: Colors.red),
                                          onPressed: () =>
                                          {Navigator.pop(context)},
                                          child: Text(
                                            AppLocalizations.of(context)!.cancel,
                                            style: TextStyle(
                                                color: Colors.red),
                                          ),
                                        ),

                                      ],
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(1, 0),
                      end: Offset.zero,
                    ).animate(_animationController),
                    child: FadeTransition(
                        opacity: _animationController,
                        child: Text(AppLocalizations.of(context)!.islandCity,
                            style: TextStyle(
                              fontSize: 16,
                            ))),
                  ),
                  subtitle: SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(1, 0),
                      end: Offset.zero,
                    ).animate(_animationController),
                    child: FadeTransition(
                        opacity: _animationController,
                        child: Text('K. Malé',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                            ))),
                  ),
                  trailing: SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(-1, 0),
                      end: Offset.zero,
                    ).animate(_animationController),
                    child: FadeTransition(
                      opacity: _animationController,
                      child: RadiantGradientMask(
                        child: IconButton(
                          icon: SvgPicture.asset(
                              "assets/images/icon/solid-edit.svg"),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return StatefulBuilder(
                                  builder: (context, setState) {
                                    return AlertDialog(
                                      title: Column(
                                        children: [
                                          Text(
                                            AppLocalizations.of(context)!.newIslandCity,
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight:
                                                FontWeight.w600),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            AppLocalizations.of(context)!.newIslandCity,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight:
                                                FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                      content: Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextFormField(

                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(AppLocalizations.of(context)!.ok),
                                        ),
                                        TextButton(
                                          style: TextButton.styleFrom(
                                              primary: Colors.red),
                                          onPressed: () =>
                                          {Navigator.pop(context)},
                                          child: Text(
                                            AppLocalizations.of(context)!.cancel,
                                            style: TextStyle(
                                                color: Colors.red),
                                          ),
                                        ),

                                      ],
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(1, 0),
                      end: Offset.zero,
                    ).animate(_animationController),
                    child: FadeTransition(
                        opacity: _animationController,
                        child: Text(AppLocalizations.of(context)!.country,
                            style: TextStyle(
                              fontSize: 16,
                            ))),
                  ),
                  subtitle: SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(1, 0),
                      end: Offset.zero,
                    ).animate(_animationController),
                    child: FadeTransition(
                        opacity: _animationController,
                        child: Text('Maldives',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                            ))),
                  ),
                  trailing: SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(-1, 0),
                      end: Offset.zero,
                    ).animate(_animationController),
                    child: FadeTransition(
                      opacity: _animationController,
                      child: RadiantGradientMask(
                        child: IconButton(
                          icon: SvgPicture.asset(
                              "assets/images/icon/solid-edit.svg"),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return StatefulBuilder(
                                  builder: (context, setState) {
                                    return AlertDialog(
                                      title: Column(
                                        children: [
                                          Text(
                                            AppLocalizations.of(context)!.newCountry,
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight:
                                                FontWeight.w600),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            AppLocalizations.of(context)!.newCountry,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight:
                                                FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                      content: Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextFormField(

                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(AppLocalizations.of(context)!.ok),
                                        ),
                                        TextButton(
                                          style: TextButton.styleFrom(
                                              primary: Colors.red),
                                          onPressed: () =>
                                          {Navigator.pop(context)},
                                          child: Text(
                                            AppLocalizations.of(context)!.cancel,
                                            style: TextStyle(
                                                color: Colors.red),
                                          ),
                                        ),

                                      ],
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(1, 0),
                      end: Offset.zero,
                    ).animate(_animationController),
                    child: FadeTransition(
                        opacity: _animationController,
                        child: Text(AppLocalizations.of(context)!.postCode,
                            style: TextStyle(
                              fontSize: 16,
                            ))),
                  ),
                  subtitle: SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(1, 0),
                      end: Offset.zero,
                    ).animate(_animationController),
                    child: FadeTransition(
                        opacity: _animationController,
                        child: Text('20002',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                            ))),
                  ),
                  trailing: SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(-1, 0),
                      end: Offset.zero,
                    ).animate(_animationController),
                    child: FadeTransition(
                      opacity: _animationController,
                      child: RadiantGradientMask(
                        child: IconButton(
                          icon: SvgPicture.asset(
                              "assets/images/icon/solid-edit.svg"),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return StatefulBuilder(
                                  builder: (context, setState) {
                                    return AlertDialog(
                                      title: Column(
                                        children: [
                                          Text(
                                            AppLocalizations.of(context)!.newPostCode,
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight:
                                                FontWeight.w600),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            AppLocalizations.of(context)!.newPostCode,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight:
                                                FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                      content: Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextFormField(

                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(AppLocalizations.of(context)!.ok),
                                        ),
                                        TextButton(
                                          style: TextButton.styleFrom(
                                              primary: Colors.red),
                                          onPressed: () =>
                                          {Navigator.pop(context)},
                                          child: Text(
                                            AppLocalizations.of(context)!.cancel,
                                            style: TextStyle(
                                                color: Colors.red),
                                          ),
                                        ),

                                      ],
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: NavbarWithBackButton(),
      drawer: SideMenu(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            //not putting padding on column because logo image requires different padding
            children: [
              Header(animationController: _animationController),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
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
                          AppLocalizations.of(context)!.profile,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
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
                            decoration:
                                const BoxDecoration(color: Color(0xffcccccc)),
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
                height: 10,
              ),
              ListTile(
                title: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                      opacity: _animationController,
                      child: Text(AppLocalizations.of(context)!.email)),
                ),
                subtitle: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                      opacity: _animationController,
                      child: Text('test@gmail.com')),
                ),
                trailing: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(2, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                    opacity: _animationController,
                    child: RadiantGradientMask(
                      child: IconButton(
                        icon: SvgPicture.asset(
                            "assets/images/icon/solid-edit.svg"),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return AlertDialog(
                                    title: Column(
                                      children: [
                                        Text(
                                          AppLocalizations.of(context)!.password,
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          AppLocalizations.of(context)!.pleaseEnterYourPassword,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    content: Container(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextFormField(
                                            obscureText: _passwordVisible,
                                            decoration: InputDecoration(
                                                labelText: AppLocalizations.of(context)!.password,
                                                suffixIcon: IconButton(
                                                    icon: _passwordVisible
                                                        ? Icon(FontAwesomeIcons
                                                        .eye)
                                                        : Icon(FontAwesomeIcons
                                                        .eyeSlash),
                                                    onPressed: () {
                                                      setState(() {
                                                        _togglePasswordVisibility();
                                                      });
                                                      print(_passwordVisible);
                                                    })),
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        style: TextButton.styleFrom(
                                            primary: Colors.red),
                                        onPressed: () =>
                                        {Navigator.pop(context)},
                                        child: Text(
                                          AppLocalizations.of(context)!.cancel,
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          Navigator.pop(context);
                                          await showDialog(context: context, builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Column(
                                                children: [
                                                  Text(
                                                    AppLocalizations.of(context)!.newEmail,
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                        FontWeight.w600),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    AppLocalizations.of(context)!.enterNewEmail,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                        FontWeight.w400),
                                                  ),
                                                ],
                                              ),
                                              content: Container(
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    TextFormField(
                                                      keyboardType: TextInputType.number,
                                                      inputFormatters: <TextInputFormatter>[
                                                        FilteringTextInputFormatter.digitsOnly
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  style: TextButton.styleFrom(
                                                      primary: Colors.red),
                                                  onPressed: () =>
                                                  {Navigator.pop(context)},
                                                  child: Text(
                                                    AppLocalizations.of(context)!.cancel,
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(AppLocalizations.of(context)!.ok),
                                                ),
                                              ],
                                            );
                                          });

                                        },
                                        child: Text(AppLocalizations.of(context)!.ok),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
                title: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                      opacity: _animationController,
                      child: Text(AppLocalizations.of(context)!.mobileNumber)),
                ),
                subtitle: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                      opacity: _animationController,
                      child: Text('7676767')),
                ),
                trailing: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(2, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                    opacity: _animationController,
                    child: RadiantGradientMask(
                      child: IconButton(
                        icon: SvgPicture.asset(
                            "assets/images/icon/solid-edit.svg"),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return AlertDialog(
                                    title: Column(
                                      children: [
                                        Text(
                                          AppLocalizations.of(context)!.password,
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          AppLocalizations.of(context)!.pleaseEnterYourPassword,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    content: Container(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextFormField(
                                            obscureText: _passwordVisible,
                                            decoration: InputDecoration(
                                                labelText: AppLocalizations.of(context)!.password,
                                                suffixIcon: IconButton(
                                                    icon: _passwordVisible
                                                        ? Icon(FontAwesomeIcons
                                                            .eye)
                                                        : Icon(FontAwesomeIcons
                                                            .eyeSlash),
                                                    onPressed: () {
                                                      setState(() {
                                                        _togglePasswordVisibility();
                                                      });
                                                      print(_passwordVisible);
                                                    })),
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        style: TextButton.styleFrom(
                                            primary: Colors.red),
                                        onPressed: () =>
                                            {Navigator.pop(context)},
                                        child: Text(
                                          AppLocalizations.of(context)!.cancel,
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          Navigator.pop(context);
                                          await showDialog(context: context, builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Column(
                                                children: [
                                                  Text(
                                                    AppLocalizations.of(context)!.newMobileNumber,
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                        FontWeight.w600),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    AppLocalizations.of(context)!.enterNewMobileNumber,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                        FontWeight.w400),
                                                  ),
                                                ],
                                              ),
                                              content: Container(
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    TextFormField(

                                                    ),
                                                  ],
                                                ),
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  style: TextButton.styleFrom(
                                                      primary: Colors.red),
                                                  onPressed: () =>
                                                  {Navigator.pop(context)},
                                                  child: Text(
                                                    AppLocalizations.of(context)!.cancel,
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(AppLocalizations.of(context)!.ok),
                                                ),
                                              ],
                                            );
                                          });

                                        },
                                        child: Text(AppLocalizations.of(context)!.ok),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
                title: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                      opacity: _animationController,
                      child: Text(AppLocalizations.of(context)!.address)),
                ),
                subtitle: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                      opacity: _animationController,
                      child: Text('Nowhere')),
                ),
                trailing: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(2, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                    opacity: _animationController,
                    child: RadiantGradientMask(
                      child: IconButton(
                        icon: SvgPicture.asset(
                            "assets/images/icon/solid-edit.svg"),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return AlertDialog(
                                    title: Column(
                                      children: [
                                        Text(
                                          AppLocalizations.of(context)!.newAddress,
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight:
                                              FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          AppLocalizations.of(context)!.enterNewAddress,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight:
                                              FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    content: Container(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextFormField(

                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        style: TextButton.styleFrom(
                                            primary: Colors.red),
                                        onPressed: () =>
                                        {Navigator.pop(context)},
                                        child: Text(
                                          AppLocalizations.of(context)!.cancel,
                                          style: TextStyle(
                                              color: Colors.red),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(AppLocalizations.of(context)!.ok),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
                title: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                      opacity: _animationController,
                      child: Text(AppLocalizations.of(context)!.islandCity)),
                ),
                subtitle: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                      opacity: _animationController,
                      child: Text('K. Malé')),
                ),
                trailing: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(2, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                    opacity: _animationController,
                    child: RadiantGradientMask(
                      child: IconButton(
                        icon: SvgPicture.asset(
                            "assets/images/icon/solid-edit.svg"),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return AlertDialog(
                                    title: Column(
                                      children: [
                                        Text(
                                          AppLocalizations.of(context)!.newIslandCity,
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight:
                                              FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          AppLocalizations.of(context)!.enterNewIslandCity,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight:
                                              FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    content: Container(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextFormField(

                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        style: TextButton.styleFrom(
                                            primary: Colors.red),
                                        onPressed: () =>
                                        {Navigator.pop(context)},
                                        child: Text(
                                          AppLocalizations.of(context)!.cancel,
                                          style: TextStyle(
                                              color: Colors.red),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(AppLocalizations.of(context)!.ok),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
                title: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                      opacity: _animationController,
                      child: Text(AppLocalizations.of(context)!.country)),
                ),
                subtitle: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                      opacity: _animationController,
                      child: Text('Maldives')),
                ),
                trailing: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(2, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                    opacity: _animationController,
                    child: RadiantGradientMask(
                      child: IconButton(
                        icon: SvgPicture.asset(
                            "assets/images/icon/solid-edit.svg"),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return AlertDialog(
                                    title: Column(
                                      children: [
                                        Text(
                                          AppLocalizations.of(context)!.newCountry,
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight:
                                              FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          AppLocalizations.of(context)!.enterNewCountry,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight:
                                              FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    content: Container(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextFormField(

                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        style: TextButton.styleFrom(
                                            primary: Colors.red),
                                        onPressed: () =>
                                        {Navigator.pop(context)},
                                        child: Text(
                                          AppLocalizations.of(context)!.cancel,
                                          style: TextStyle(
                                              color: Colors.red),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(AppLocalizations.of(context)!.ok),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
                title: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                      opacity: _animationController,
                      child: Text(AppLocalizations.of(context)!.postCode)),
                ),
                subtitle: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                      opacity: _animationController,
                      child: Text('20002')),
                ),
                trailing: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(2, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                    opacity: _animationController,
                    child: RadiantGradientMask(
                      child: IconButton(
                        icon: SvgPicture.asset(
                            "assets/images/icon/solid-edit.svg"),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return AlertDialog(
                                    title: Column(
                                      children: [
                                        Text(
                                          AppLocalizations.of(context)!.newPostCode,
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight:
                                              FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          AppLocalizations.of(context)!.enterNewPostCode,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight:
                                              FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    content: Container(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextFormField(

                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        style: TextButton.styleFrom(
                                            primary: Colors.red),
                                        onPressed: () =>
                                        {Navigator.pop(context)},
                                        child: Text(
                                          AppLocalizations.of(context)!.cancel,
                                          style: TextStyle(
                                              color: Colors.red),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(AppLocalizations.of(context)!.ok),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
