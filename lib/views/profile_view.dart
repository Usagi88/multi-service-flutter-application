import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fpapp/classes/gradient_icon.dart';
import 'package:fpapp/provider/locale_provider.dart';
import 'package:fpapp/widgets/header_widget.dart';
import 'package:fpapp/widgets/navbar_with_back_button_widget.dart';
import 'package:fpapp/widgets/sidemenu_widget.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> with SingleTickerProviderStateMixin{
  AnimationController? _animationController;
  Tween<double> _tween = Tween(begin: 0.1, end: 1);

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

  @override
  Widget build(BuildContext context) {
    var language = Provider.of<LocaleProvider>(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _portraitModeOnly(context, _animationController, _tween, language);
  }
}

//portrait
Scaffold _portraitModeOnly(BuildContext context, _animationController, _tween, language) {
  if (language.locale.toString() == 'dv' || language.locale.toString() == 'ar'){
    return Scaffold(
      appBar: NavbarWithBackButton(),
      drawer: SideMenu(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(//not putting padding on column because logo image requires different padding
            children: [
              Header(animationController: _animationController),
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
                          AppLocalizations.of(context)!.profile,
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
                      child: Text(AppLocalizations.of(context)!.email, style: TextStyle(fontSize: 16,),)
                  ),
                ),
                subtitle: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                      opacity: _animationController,
                      child: Text('Hussain.shafiu@gmail.com', style: TextStyle(fontFamily: 'Roboto'))
                  ),
                ),
                trailing: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(2, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                    opacity: _animationController,
                    child: GradientIcon(
                      FontAwesomeIcons.solidEdit,
                      22.0,
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
              ),
              ListTile(
                title: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                      opacity: _animationController,
                      child: Text(AppLocalizations.of(context)!.mobileNumber,style: TextStyle(fontSize: 16,))
                  ),
                ),
                subtitle: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                      opacity: _animationController,
                      child: Text('7776777',style: TextStyle(fontFamily: 'Roboto',))
                  ),
                ),
                trailing: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(2, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                    opacity: _animationController,
                    child: GradientIcon(
                      FontAwesomeIcons.solidEdit,
                      22.0,
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
              ),
              ListTile(
                title: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                      opacity: _animationController,
                      child: Text(AppLocalizations.of(context)!.address,style: TextStyle(fontSize: 16,))
                  ),
                ),
                subtitle: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                      opacity: _animationController,
                      child: Text('Hussain.shafiu@gmail.com',style: TextStyle(fontFamily: 'Roboto',))
                  ),
                ),
                trailing: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(2, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                    opacity: _animationController,
                    child: GradientIcon(
                      FontAwesomeIcons.solidEdit,
                      22.0,
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
              ),
              ListTile(
                title: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                      opacity: _animationController,
                      child: Text(AppLocalizations.of(context)!.islandCity,style: TextStyle(fontSize: 16,))
                  ),
                ),
                subtitle: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                      opacity: _animationController,
                      child: Text('Hussain.shafiu@gmail.com',style: TextStyle(fontFamily: 'Roboto',))
                  ),
                ),
                trailing: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(2, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                    opacity: _animationController,
                    child: GradientIcon(
                      FontAwesomeIcons.solidEdit,
                      22.0,
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
              ),
              ListTile(
                title: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                      opacity: _animationController,
                      child: Text(AppLocalizations.of(context)!.country, style: TextStyle(fontSize: 16,))
                  ),
                ),
                subtitle: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                      opacity: _animationController,
                      child: Text('Hussain.shafiu@gmail.com', style: TextStyle(fontFamily: 'Roboto',))
                  ),
                ),
                trailing: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(2, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                    opacity: _animationController,
                    child: GradientIcon(
                      FontAwesomeIcons.solidEdit,
                      22.0,
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
              ),
              ListTile(
                title: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                      opacity: _animationController,
                      child: Text(AppLocalizations.of(context)!.postCode, style: TextStyle(fontSize: 16,))
                  ),
                ),
                subtitle: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                      opacity: _animationController,
                      child: Text('Hussain.shafiu@gmail.com', style: TextStyle(fontFamily: 'Roboto',))
                  ),
                ),
                trailing: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(2, 0),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: FadeTransition(
                    opacity: _animationController,
                    child: GradientIcon(
                      FontAwesomeIcons.solidEdit,
                      22.0,
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
        child: Column(//not putting padding on column because logo image requires different padding
          children: [
            Header(animationController: _animationController),
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
                        AppLocalizations.of(context)!.profile,
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
                    child: Text(AppLocalizations.of(context)!.email)
                ),
              ),
              subtitle: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(-1, 0),
                  end: Offset.zero,
                ).animate(_animationController),
                child: FadeTransition(
                    opacity: _animationController,
                    child: Text('Hussain.shafiu@gmail.com')
                ),
              ),
              trailing: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(2, 0),
                  end: Offset.zero,
                ).animate(_animationController),
                child: FadeTransition(
                  opacity: _animationController,
                  child: GradientIcon(
                    FontAwesomeIcons.solidEdit,
                    22.0,
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
            ),
            ListTile(
              title: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(-1, 0),
                  end: Offset.zero,
                ).animate(_animationController),
                child: FadeTransition(
                    opacity: _animationController,
                    child: Text(AppLocalizations.of(context)!.mobileNumber)
                ),
              ),
              subtitle: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(-1, 0),
                  end: Offset.zero,
                ).animate(_animationController),
                child: FadeTransition(
                    opacity: _animationController,
                    child: Text('Hussain.shafiu@gmail.com')
                ),
              ),
              trailing: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(2, 0),
                  end: Offset.zero,
                ).animate(_animationController),
                child: FadeTransition(
                  opacity: _animationController,
                  child: GradientIcon(
                    FontAwesomeIcons.solidEdit,
                    22.0,
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
            ),
            ListTile(
              title: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(-1, 0),
                  end: Offset.zero,
                ).animate(_animationController),
                child: FadeTransition(
                    opacity: _animationController,
                    child: Text(AppLocalizations.of(context)!.address)
                ),
              ),
              subtitle: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(-1, 0),
                  end: Offset.zero,
                ).animate(_animationController),
                child: FadeTransition(
                    opacity: _animationController,
                    child: Text('Hussain.shafiu@gmail.com')
                ),
              ),
              trailing: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(2, 0),
                  end: Offset.zero,
                ).animate(_animationController),
                child: FadeTransition(
                  opacity: _animationController,
                  child: GradientIcon(
                    FontAwesomeIcons.solidEdit,
                    22.0,
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
            ),
            ListTile(
              title: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(-1, 0),
                  end: Offset.zero,
                ).animate(_animationController),
                child: FadeTransition(
                    opacity: _animationController,
                    child: Text(AppLocalizations.of(context)!.islandCity)
                ),
              ),
              subtitle: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(-1, 0),
                  end: Offset.zero,
                ).animate(_animationController),
                child: FadeTransition(
                    opacity: _animationController,
                    child: Text('Hussain.shafiu@gmail.com')
                ),
              ),
              trailing: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(2, 0),
                  end: Offset.zero,
                ).animate(_animationController),
                child: FadeTransition(
                  opacity: _animationController,
                  child: GradientIcon(
                    FontAwesomeIcons.solidEdit,
                    22.0,
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
            ),
            ListTile(
              title: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(-1, 0),
                  end: Offset.zero,
                ).animate(_animationController),
                child: FadeTransition(
                    opacity: _animationController,
                    child: Text(AppLocalizations.of(context)!.country)
                ),
              ),
              subtitle: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(-1, 0),
                  end: Offset.zero,
                ).animate(_animationController),
                child: FadeTransition(
                    opacity: _animationController,
                    child: Text('Hussain.shafiu@gmail.com')
                ),
              ),
              trailing: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(2, 0),
                  end: Offset.zero,
                ).animate(_animationController),
                child: FadeTransition(
                  opacity: _animationController,
                  child: GradientIcon(
                    FontAwesomeIcons.solidEdit,
                    22.0,
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
            ),
            ListTile(
              title: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(-1, 0),
                  end: Offset.zero,
                ).animate(_animationController),
                child: FadeTransition(
                    opacity: _animationController,
                    child: Text(AppLocalizations.of(context)!.postCode)
                ),
              ),
              subtitle: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(-1, 0),
                  end: Offset.zero,
                ).animate(_animationController),
                child: FadeTransition(
                    opacity: _animationController,
                    child: Text('Hussain.shafiu@gmail.com')
                ),
              ),
              trailing: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(2, 0),
                  end: Offset.zero,
                ).animate(_animationController),
                child: FadeTransition(
                  opacity: _animationController,
                  child: GradientIcon(
                    FontAwesomeIcons.solidEdit,
                    22.0,
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
            ),
          ],
        ),
      ),
    ),
  );
}
