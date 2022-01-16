import 'package:flutter/material.dart';
import 'package:fpapp/classes/custom_shape.dart';
import 'package:fpapp/provider/locale_provider.dart';
import 'package:provider/provider.dart';


class SendMessage extends StatelessWidget {
  final String message;
  final String time;

  const SendMessage({
    Key? key,
    required this.message,
    required this.time,
  })  : assert(message != null),
        assert(time != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var language = Provider.of<LocaleProvider>(context);
    if (language.locale.toString() == 'dv' || language.locale.toString() == 'ar'){
      return Column(
        children: [
          Align(
              alignment: Alignment.centerRight,
              child: Text('You',style: TextStyle(fontSize: 14, color: Colors.grey.shade600, fontWeight: FontWeight.w400 ,fontFamily: 'Roboto'),)
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              double maxBubbleWidth = constraints.maxWidth * 0.7;
              return Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0,top: 4.0,right: 4.0),
                      child: CustomPaint(painter: CustomShape(Color(0xff25BFA3))),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: maxBubbleWidth),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 30.0,top: 4.0),
                        constraints: BoxConstraints(
                            minWidth: 100
                        ),
                        padding: const EdgeInsets.all(14.0),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xff3AC170),
                              const Color(0xff25BFA3),
                            ],
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(18),
                            bottomLeft: Radius.circular(18),
                            bottomRight: Radius.circular(18),
                          ),
                        ),
                        child: IntrinsicWidth(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(message, style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400,fontFamily: 'Roboto'),),
                              const SizedBox(height: 10.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    time,
                                    style: TextStyle(color: Colors.grey.shade200, fontSize: 14, fontWeight: FontWeight.w400,fontFamily: 'Roboto'),
                                  ),
                                ],
                              )
                            ],

                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              );
            },
          )
        ],
      );
    }
    return Column(
      children: [
        Align(
            alignment: Alignment.centerRight,
            child: Text('You',style: TextStyle(fontSize: 14, color: Colors.grey.shade600, fontWeight: FontWeight.w400),)
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            double maxBubbleWidth = constraints.maxWidth * 0.7;
            return Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: maxBubbleWidth),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 30.0,top: 4.0),
                      constraints: BoxConstraints(
                          minWidth: 100
                      ),
                      padding: const EdgeInsets.all(14.0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xff3AC170),
                            const Color(0xff25BFA3),
                          ],
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(18),
                          bottomLeft: Radius.circular(18),
                          bottomRight: Radius.circular(18),
                        ),
                      ),
                      child: IntrinsicWidth(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(message, style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),),
                            const SizedBox(height: 10.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  time,
                                  style: TextStyle(color: Colors.grey.shade200, fontSize: 14, fontWeight: FontWeight.w400),
                                ),
                              ],
                            )
                          ],

                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0,top: 4.0,right: 4.0),
                    child: CustomPaint(painter: CustomShape(Color(0xff25BFA3))),
                  ),
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
