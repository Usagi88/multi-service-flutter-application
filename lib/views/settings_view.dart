import 'dart:async';
import 'dart:ffi';

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
  bool _contactToggled = false;
  bool _storageToggled = false;
  bool _cameraToggled = false;
  bool _smsToggled = false;
  bool _locationToggled = false;
  bool _notificationToggled = false;

  Tween<double> _tween = Tween(begin: 0.1, end: 1);

  Future<void> checkAllPermissionStatus() async {
    var contact = await Permission.contacts.status;
    var storage = await Permission.storage.status;
    var camera = await Permission.camera.status;
    var sms = await Permission.sms.status;
    var location = await Permission.locationWhenInUse.status;
    var notification = await Permission.notification.status;

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
    if (notification.isGranted) {
      setState(() {
        _notificationToggled = true;
      });
    }
  }

  Future<void> requestContactPermission(bool value) async {
    final status = await Permission.contacts.request();
    if (status == PermissionStatus.granted) {
      _contactToggled = value;
      _switchContactToggle(_contactToggled);
    } else if (status == PermissionStatus.denied) {
      _contactToggled = value;
      _switchContactToggle(_contactToggled);
    } else if (status == PermissionStatus.permanentlyDenied) {
      _contactToggled = value;
      _switchContactToggle(_contactToggled);
      await openAppSettings();
    }
  }

  Future<void> requestStoragePermission(bool value) async {
    final status = await Permission.storage.request();
    if (status == PermissionStatus.granted) {
      _storageToggled = value;
      _switchStorageToggle(_storageToggled);
    } else if (status == PermissionStatus.denied) {
      _storageToggled = value;
      _switchStorageToggle(_storageToggled);
    } else if (status == PermissionStatus.permanentlyDenied) {
      _storageToggled = value;
      _switchStorageToggle(_storageToggled);
      await openAppSettings();
    }
  }

  Future<void> requestCameraPermission(bool value) async {
    final status = await Permission.camera.request();
    if (status == PermissionStatus.granted) {
      _cameraToggled = value;
      _switchCameraToggle(_cameraToggled);
    } else if (status == PermissionStatus.denied) {
      _cameraToggled = value;
      _switchCameraToggle(_cameraToggled);
    } else if (status == PermissionStatus.permanentlyDenied) {
      _cameraToggled = value;
      _switchCameraToggle(_cameraToggled);
      await openAppSettings();
    }
  }

  Future<void> requestSMSPermission(bool value) async {
    final status = await Permission.sms.request();
    if (status == PermissionStatus.granted) {
      _smsToggled = value;
      _switchSMSToggle(_smsToggled);
    } else if (status == PermissionStatus.denied) {
      _smsToggled = value;
      _switchSMSToggle(_smsToggled);
    } else if (status == PermissionStatus.permanentlyDenied) {
      _smsToggled = value;
      _switchSMSToggle(_smsToggled);
      await openAppSettings();
    }
  }

  Future<void> requestLocationPermission(bool value) async {
    final status = await Permission.locationWhenInUse.request();
    if (status == PermissionStatus.granted) {
      _locationToggled = value;
      _switchLocationToggle(_locationToggled);
    } else if (status == PermissionStatus.denied) {
      _locationToggled = value;
      _switchLocationToggle(_locationToggled);
    } else if (status == PermissionStatus.permanentlyDenied) {
      _locationToggled = value;
      _switchLocationToggle(_locationToggled);
      await openAppSettings();
    }
  }

  Future<void> requestNotificationPermission(bool value) async {
    final status = await Permission.notification.request();
    if (status == PermissionStatus.granted) {
      _notificationToggled = value;
      _switchNotificationToggle(_notificationToggled);
    } else if (status == PermissionStatus.denied) {
      _locationToggled = value;
      _switchNotificationToggle(_notificationToggled);
    } else if (status == PermissionStatus.permanentlyDenied) {
      _locationToggled = value;
      _switchNotificationToggle(_notificationToggled);
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

  _switchContactToggle(boolValue) async {
    if (boolValue) {
      setState(() {
        _contactToggled = boolValue;
      });
    } else {
      setState(() {
        _contactToggled = boolValue;
      });
      await openAppSettings();
    }
  }

  _switchStorageToggle(boolValue) async {
    if (boolValue) {
      setState(() {
        _storageToggled = boolValue;
      });
    } else {
      setState(() {
        _storageToggled = boolValue;
      });
      await openAppSettings();
    }
  }

  _switchCameraToggle(boolValue) async {
    if (boolValue) {
      setState(() {
        _cameraToggled = boolValue;
      });
    } else {
      setState(() {
        _cameraToggled = boolValue;
      });
      await openAppSettings();
    }
  }

  _switchSMSToggle(boolValue) async {
    if (boolValue) {
      setState(() {
        _storageToggled = boolValue;
      });
    } else {
      setState(() {
        _storageToggled = boolValue;
      });
      await openAppSettings();
    }
  }

  _switchLocationToggle(boolValue) async {
    if (boolValue) {
      setState(() {
        _locationToggled = boolValue;
      });
    } else {
      setState(() {
        _locationToggled = boolValue;
      });
      await openAppSettings();
    }
  }

  _switchNotificationToggle(boolValue) async {
    if (boolValue) {
      setState(() {
        _notificationToggled = boolValue;
      });
    } else {
      setState(() {
        _notificationToggled = boolValue;
      });
      await openAppSettings();
    }
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

    if (language.locale.toString() == 'dv' || language.locale.toString() == 'ar'){
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
                    alignment: Alignment.centerRight,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(1, 0),
                        end: Offset.zero,
                      ).animate(_animationController),
                      child: FadeTransition(
                          opacity: _animationController,
                          child: Text(AppLocalizations.of(context)!.systemAndDevice, style: TextStyle(fontWeight: FontWeight.w600),)),
                    )
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(1, 0),
                  end: Offset.zero,
                ).animate(_animationController),
                child: FadeTransition(
                  opacity: _animationController,
                  child: SwitchListTile(
                    value: _contactToggled,
                    title: Text(AppLocalizations.of(context)!.contacts),
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
                      setState(() {
                        _switchContactToggle(value);
                      });
                      requestContactPermission(value);
                    },
                  ),
                ),
              ),
              SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(1, 0),
                  end: Offset.zero,
                ).animate(_animationController),
                child: FadeTransition(
                  opacity: _animationController,
                  child: SwitchListTile(
                    value: _storageToggled,
                    title: Text(AppLocalizations.of(context)!.storage),
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
                      setState(() {
                        _switchStorageToggle(value);
                      });
                      requestStoragePermission(value);
                    },
                  ),
                ),
              ),
              SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(1, 0),
                  end: Offset.zero,
                ).animate(_animationController),
                child: FadeTransition(
                  opacity: _animationController,
                  child: SwitchListTile(
                    value: _cameraToggled,
                    title: Text(AppLocalizations.of(context)!.camera),
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
                      setState(() {
                        _switchCameraToggle(value);
                      });
                      requestCameraPermission(value);
                    },
                  ),
                ),
              ),
              SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(1, 0),
                  end: Offset.zero,
                ).animate(_animationController),
                child: FadeTransition(
                  opacity: _animationController,
                  child: SwitchListTile(
                    value: _smsToggled,
                    title: Text(AppLocalizations.of(context)!.sms),
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
                      setState(() {
                        _switchSMSToggle(value);
                      });
                      requestSMSPermission(value);
                    },
                  ),
                ),
              ),
              SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(1, 0),
                  end: Offset.zero,
                ).animate(_animationController),
                child: FadeTransition(
                  opacity: _animationController,
                  child: SwitchListTile(
                    value: _locationToggled,
                    title: Text(AppLocalizations.of(context)!.location),
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
                      setState(() {
                        _switchLocationToggle(value);
                      });
                      requestLocationPermission(value);
                    },
                  ),
                ),
              ),
              SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(1, 0),
                  end: Offset.zero,
                ).animate(_animationController),
                child: FadeTransition(
                  opacity: _animationController,
                  child: SwitchListTile(
                    value: _notificationToggled,
                    title: Text(AppLocalizations.of(context)!.notification),
                    secondary: GradientIcon(
                      FontAwesomeIcons.solidBell,
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
                      setState(() {
                        _switchNotificationToggle(value);
                      });
                      requestNotificationPermission(value);
                    },
                  ),
                ),
              ),
            ],
          ));
    }

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
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(-1, 0),
                      end: Offset.zero,
                    ).animate(_animationController),
                    child: FadeTransition(
                        opacity: _animationController,
                        child: Text(
                          AppLocalizations.of(context)!.systemAndDevice,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            SlideTransition(
              position: Tween<Offset>(
                begin: Offset(-1, 0),
                end: Offset.zero,
              ).animate(_animationController),
              child: FadeTransition(
                opacity: _animationController,
                child: SwitchListTile(
                  value: _contactToggled,
                  title: Text(AppLocalizations.of(context)!.contacts),
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
                    setState(() {
                      _switchContactToggle(value);
                    });
                    requestContactPermission(value);
                  },
                ),
              ),
            ),
            SlideTransition(
              position: Tween<Offset>(
                begin: Offset(-1, 0),
                end: Offset.zero,
              ).animate(_animationController),
              child: FadeTransition(
                opacity: _animationController,
                child: SwitchListTile(
                  value: _storageToggled,
                  title: Text(AppLocalizations.of(context)!.storage),
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
                    setState(() {
                      _switchStorageToggle(value);
                    });
                    requestStoragePermission(value);
                  },
                ),
              ),
            ),
            SlideTransition(
              position: Tween<Offset>(
                begin: Offset(-1, 0),
                end: Offset.zero,
              ).animate(_animationController),
              child: FadeTransition(
                opacity: _animationController,
                child: SwitchListTile(
                  value: _cameraToggled,
                  title: Text(AppLocalizations.of(context)!.camera),
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
                    setState(() {
                      _switchCameraToggle(value);
                    });
                    requestCameraPermission(value);
                  },
                ),
              ),
            ),
            SlideTransition(
              position: Tween<Offset>(
                begin: Offset(-1, 0),
                end: Offset.zero,
              ).animate(_animationController),
              child: FadeTransition(
                opacity: _animationController,
                child: SwitchListTile(
                  value: _smsToggled,
                  title: Text(AppLocalizations.of(context)!.sms),
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
                    setState(() {
                      _switchSMSToggle(value);
                    });
                    requestSMSPermission(value);
                  },
                ),
              ),
            ),
            SlideTransition(
              position: Tween<Offset>(
                begin: Offset(-1, 0),
                end: Offset.zero,
              ).animate(_animationController),
              child: FadeTransition(
                opacity: _animationController,
                child: SwitchListTile(
                  value: _locationToggled,
                  title: Text(AppLocalizations.of(context)!.location),
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
                    setState(() {
                      _switchLocationToggle(value);
                    });
                    requestLocationPermission(value);
                  },
                ),
              ),
            ),
            SlideTransition(
              position: Tween<Offset>(
                begin: Offset(-1, 0),
                end: Offset.zero,
              ).animate(_animationController),
              child: FadeTransition(
                opacity: _animationController,
                child: SwitchListTile(
                  value: _notificationToggled,
                  title: Text(AppLocalizations.of(context)!.notification),
                  secondary: GradientIcon(
                    FontAwesomeIcons.solidBell,
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
                    setState(() {
                      _switchNotificationToggle(value);
                    });
                    requestNotificationPermission(value);
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
