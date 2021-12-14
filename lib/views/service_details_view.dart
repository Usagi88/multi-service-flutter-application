import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fpapp/widgets/banner_widget.dart';
import 'package:fpapp/widgets/button_widget.dart';
import 'package:fpapp/widgets/navbar_widget.dart';
import 'package:fpapp/widgets/navbar_with_back_button_widget.dart';
import 'package:fpapp/widgets/sidemenu_widget.dart';
import 'package:fpapp/widgets/textfield_number_widget.dart';
import 'package:fpapp/widgets/textfield_text_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ServiceDetailsView extends StatefulWidget {
  const ServiceDetailsView({Key? key}) : super(key: key);

  @override
  _ServiceDetailsViewState createState() => _ServiceDetailsViewState();
}

class _ServiceDetailsViewState extends State<ServiceDetailsView> {
  @override
  bool? _checked = false;
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _portraitModeOnly(context);
  }

  //portrait
  Scaffold _portraitModeOnly(BuildContext context) {
    return Scaffold(
        appBar: NavbarWithBackButton(),
        drawer: SideMenu(),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
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
                          ),
                        ]
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:20.0),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 182,
                            height: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                              gradient: LinearGradient(
                                colors: [
                                  const Color(0xff3AC170),
                                  const Color(0xff25BFA3),
                                ],
                              ),
                            ),
                            child: Text('Dhiraagu',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 182,
                            height: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),

                              gradient: LinearGradient(
                                colors: [
                                  const Color(0xffffffff),
                                  const Color(0xffffffff),
                                ],
                              ),
                            ),
                            child: Text('Ooredoo',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Enter the dhiraagu number and amount to send reload.',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey.shade600),)
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Align( alignment: Alignment.centerLeft, child: Text('Select Package',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextfieldTextWidget(
                        hintText: 'Field Name',
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Align( alignment: Alignment.centerLeft, child: Text('Amount',style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextfieldNumberWidget(
                        hintText: 'Field Name',
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          width: 172,
                          alignment: Alignment.centerLeft,
                          child: CheckboxListTile(
                            title: Text('Keep info saved', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                            value: _checked,
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: Color(0xff29bf9a),
                            contentPadding: const EdgeInsets.all(0.0),
                            onChanged: (bool? newValue) {
                              setState(() {
                                _checked = newValue;
                                print(_checked);
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: ButtonWidget(
                        buttonText: 'Send Reload',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children:[
                          Text(
                            'Saved Numbers',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Container(
                              height: 1,
                              width: MediaQuery.of(context).size.width * 0.49,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        child: Table(
                          columnWidths: {
                            0: FlexColumnWidth(2),
                            1: FlexColumnWidth(6),
                            2: FlexColumnWidth(2),
                            3: FlexColumnWidth(2),
                          },
                          border: TableBorder(
                            horizontalInside: BorderSide(
                                width: 1, color: Colors.grey.shade300, style: BorderStyle.solid
                            ),
                            bottom: BorderSide(
                                width: 1, color: Colors.grey.shade300, style: BorderStyle.solid
                            )
                          ),
                          // textDirection: TextDirection.rtl,
                          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                          children: [
                            TableRow(
                                children: [
                                  Container(
                                    height: 50,
                                    alignment: Alignment.centerLeft,
                                    child: Text("#",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),)
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Details",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),)
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    child: Text("Delete",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),)
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    child: Text("Show",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),)
                                  ),
                                ]
                            ),
                            TableRow(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text("1",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),)
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: ListTile(
                                      contentPadding: EdgeInsets.all(0.0),
                                      title: Text("7566561",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                      subtitle: Text("Hussain Shafiu",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    child: GradientIcon(
                                      FontAwesomeIcons.trash,
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
                                  Container(
                                    alignment: Alignment.center,
                                    child: GradientIcon(
                                      FontAwesomeIcons.locationArrow,
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
                                ]
                            ),

                            TableRow(
                                children: [
                                  Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text("2",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),)
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: ListTile(
                                      contentPadding: EdgeInsets.all(0.0),
                                      title: Text("7566561",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                      subtitle: Text("Hussain Shafiu",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    child: GradientIcon(
                                      FontAwesomeIcons.trash,
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
                                  Container(
                                    alignment: Alignment.center,
                                    child: GradientIcon(
                                      FontAwesomeIcons.locationArrow,
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
                                ]
                            ),
                          ],
                        )
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )
            )
        )
    );
  }
}

//class that makes icons have gradient
class GradientIcon extends StatelessWidget {
  GradientIcon(
      this.icon,
      this.size,
      this.gradient,
      );

  final IconData icon;
  final double size;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: SizedBox(
        width: size * 1.2,
        height: size * 1.2,
        child: Icon(
          icon,
          size: size,
          color: Colors.white,
        ),
      ),
      shaderCallback: (Rect bounds) {
        final Rect rect = Rect.fromLTRB(0, 0, size, size);
        return gradient.createShader(rect);
      },
    );
  }
}


