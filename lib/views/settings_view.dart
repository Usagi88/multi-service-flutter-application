import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fpapp/classes/gradient_icon.dart';
import 'package:fpapp/classes/gradient_text.dart';
import 'package:fpapp/provider/locale_provider.dart';
import 'package:fpapp/widgets/language_picker.dart';
import 'package:fpapp/widgets/navbar_widget.dart';
import 'package:fpapp/widgets/navbar_with_back_button_widget.dart';
import 'package:fpapp/widgets/sidemenu_widget.dart';
import 'dart:math' as math;
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'dart:io' show Platform;
import 'package:permission_handler/permission_handler.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  bool _toggled = false;
  bool _contactToggled = false;
  bool _storageToggled = false;
  bool _cameraToggled = false;
  bool _smsToggled = false;
  bool _locationToggled = false;

  Tween<double> _tween = Tween(begin: 0.1, end: 1);

  Future<void> checkAllPermissionStatus() async {
    var contact = await Permission.contacts.status;
    var storage = await Permission.storage.status;
    var camera = await Permission.camera.status;
    var sms = await Permission.sms.status;
    var location = await Permission.locationWhenInUse.status;

    if (contact.isGranted) {
      setState(() {
        _contactToggled = true;
      });
    }
    if (storage.isGranted) {
      setState(() {
        _storageToggled = true;
      });
    }
    if (camera.isGranted) {
      setState(() {
        _cameraToggled = true;
      });
    }
    if (sms.isGranted) {
      setState(() {
        _smsToggled = true;
      });
    }
    if (location.isGranted) {
      setState(() {
        _locationToggled = true;
      });
    }
  }

  Future<void> requestContactPermission() async {
    final status = await Permission.contacts.request();
    if (status == PermissionStatus.granted) {
      _contactToggled = true;
      _switchContactToggle(_contactToggled);
    } else if (status == PermissionStatus.denied) {
      _contactToggled = false;
      _switchContactToggle(_contactToggled);
    } else if (status == PermissionStatus.permanentlyDenied) {
      _contactToggled = false;
      _switchContactToggle(_contactToggled);
      await openAppSettings();
    }
  }
  Future<void> requestStoragePermission() async {
    final status = await Permission.storage.request();
    if (status == PermissionStatus.granted) {
      _storageToggled = true;
      _switchStorageToggle(_storageToggled);
    } else if (status == PermissionStatus.denied) {
      _storageToggled = false;
      _switchStorageToggle(_storageToggled);
    } else if (status == PermissionStatus.permanentlyDenied) {
      _storageToggled = false;
      _switchStorageToggle(_storageToggled);
      await openAppSettings();
    }
  }

  Future<void> requestCameraPermission() async {
    final status = await Permission.camera.request();
    if (status == PermissionStatus.granted) {
      _cameraToggled = true;
      _switchCameraToggle(_cameraToggled);
    } else if (status == PermissionStatus.denied) {
      _cameraToggled = false;
      _switchCameraToggle(_cameraToggled);
    } else if (status == PermissionStatus.permanentlyDenied) {
      _cameraToggled = false;
      _switchCameraToggle(_cameraToggled);
      await openAppSettings();
    }
  }

  Future<void> requestSMSPermission() async {
    final status = await Permission.sms.request();
    if (status == PermissionStatus.granted) {
      _smsToggled = true;
      _switchSMSToggle(_smsToggled);
    } else if (status == PermissionStatus.denied) {
      _smsToggled = false;
      _switchSMSToggle(_smsToggled);
    } else if (status == PermissionStatus.permanentlyDenied) {
      _smsToggled = false;
      _switchSMSToggle(_smsToggled);
      await openAppSettings();
    }
  }

  Future<void> requestLocationPermission() async {
    final status = await Permission.locationWhenInUse.request();
    if (status == PermissionStatus.granted) {
      _locationToggled = true;
      _switchLocationToggle(_locationToggled);
    } else if (status == PermissionStatus.denied) {
      _locationToggled = false;
      _switchLocationToggle(_locationToggled);
    } else if (status == PermissionStatus.permanentlyDenied) {
      _locationToggled = false;
      _switchLocationToggle(_locationToggled);
      await openAppSettings();
    }
  }

  @override
  void initState() {
    checkAllPermissionStatus();
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

  _switchToggle() {
    setState(() {
      _toggled = !_toggled;
    });
  }

  _switchCameraToggle(boolValue) {
    setState(() {
      _cameraToggled = boolValue;
    });
  }

  _switchStorageToggle(boolValue) {
    setState(() {
      _storageToggled = boolValue;
    });
  }

  _switchContactToggle(boolValue) {
    setState(() {
      _contactToggled = boolValue;
    });
  }

  _switchSMSToggle(boolValue) {
    setState(() {
      _storageToggled = boolValue;
    });
  }

  _switchLocationToggle(boolValue) {
    setState(() {
      _locationToggled = boolValue;
    });
  }
  @override
  Widget build(BuildContext context) {
    var language = Provider.of<LocaleProvider>(context);
    double height = Navbar().preferredSize.height;
    var safePadding = MediaQuery.of(context).padding.top;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _portraitModeOnly(
        context, height, safePadding, _animationController, _tween, language);
  }

  //portrait
  Scaffold _portraitModeOnly(BuildContext context, height, safePadding,
      _animationController, _tween, language) {
    return Scaffold(
        appBar: NavbarWithBackButton(
          includeShadow: true,
        ),
        drawer: SideMenu(),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: GradientText(
                    text: 'System & Device',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Roboto'),
                    gradient: const LinearGradient(colors: [
                      Color(0xff3AC170),
                      Color(0xff25BFA3),
                    ], transform: GradientRotation(math.pi * 0.50))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SwitchListTile(
              value: _contactToggled,
              title: Text('Contacts'),
              secondary: GradientIcon(
                FontAwesomeIcons.idCardAlt,
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
              activeColor: Color(0xff28bf9b),
              onChanged: (bool value) {
                requestContactPermission();
              },
            ),
            SwitchListTile(
              value: _storageToggled,
              title: Text('Storage'),
              secondary: GradientIcon(
                FontAwesomeIcons.solidFolder,
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
              activeColor: Color(0xff28bf9b),
              onChanged: (bool value) {
                requestStoragePermission();
              },
            ),
            SwitchListTile(
              value: _cameraToggled,
              title: Text('Camera'),
              secondary: GradientIcon(
                FontAwesomeIcons.camera,
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
              activeColor: Color(0xff28bf9b),
              onChanged: (bool value) {
                requestCameraPermission();
              },
            ),
            SwitchListTile(
              value: _smsToggled,
              title: Text('SMS'),
              secondary: GradientIcon(
                FontAwesomeIcons.commentDots,
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
              activeColor: Color(0xff28bf9b),
              onChanged: (bool value) {
                requestSMSPermission();
              },
            ),
            SwitchListTile(
              value: _locationToggled,
              title: Text('Location'),
              secondary: GradientIcon(
                FontAwesomeIcons.mapMarkerAlt,
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
              activeColor: Color(0xff28bf9b),
              onChanged: (bool value) {
                requestLocationPermission();
              },
            ),
          ],
        ));
  }
}
