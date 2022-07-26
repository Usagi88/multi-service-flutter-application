import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:fpapp/classes/custom_shape.dart';
import 'package:fpapp/provider/locale_provider.dart';
import 'package:provider/provider.dart';

class ReceiveMessage extends StatelessWidget {
  final String message;
  final String time;

  const ReceiveMessage({
    Key? key,
    required this.message,
    required this.time,
  })  : assert(message != null),
        assert(time != null),
        super(key: key);

  @override
  Widget build(
      BuildContext context) {
    var language = Provider.of<LocaleProvider>(context);
    if (language.locale.toString() == 'dv' || language.locale.toString() == 'ar'){
      return Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text('Helpdesk',style: TextStyle(fontSize: 14, color: Colors.grey.shade600, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),)
          ),

          LayoutBuilder(
            builder: (context, constraints) {
              double maxBubbleWidth = constraints.maxWidth * 0.7;
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: maxBubbleWidth,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(18),
                          bottomLeft: Radius.circular(18),
                          bottomRight: Radius.circular(18),
                        ),
                      ),
                      margin: const EdgeInsets.only(bottom: 10.0,top: 4.0),
                      padding: const EdgeInsets.all(10.0),
                      child: IntrinsicWidth(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(message,textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400 ,fontFamily: 'Roboto'),)),
                            const SizedBox(height: 5.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  time,
                                  style: TextStyle(color: Colors.grey.shade600, fontSize: 14, fontWeight: FontWeight.w400,fontFamily: 'Roboto'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0,top: 4.0,left: 4.0),
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(math.pi),
                      child: CustomPaint(
                        painter: CustomShape(Colors.grey.shade300),
                      ),
                    ),
                  ),
                ],
              );
            },
          )
        ],
      );
    }
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text('Helpdesk',style: TextStyle(fontSize: 14, color: Colors.grey.shade600, fontWeight: FontWeight.w400),)
        ),

        LayoutBuilder(
          builder: (context, constraints) {
            double maxBubbleWidth = constraints.maxWidth * 0.7;
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0,top: 4.0,left: 4.0),
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(math.pi),
                    child: CustomPaint(
                      painter: CustomShape(Colors.grey.shade300),
                    ),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: maxBubbleWidth,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(18),
                        bottomLeft: Radius.circular(18),
                        bottomRight: Radius.circular(18),
                      ),
                    ),
                    margin: const EdgeInsets.only(bottom: 10.0,top: 4.0),
                    padding: const EdgeInsets.all(10.0),
                    child: IntrinsicWidth(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(message, style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),),
                          const SizedBox(height: 5.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                time,
                                style: TextStyle(color: Colors.grey.shade600, fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        )
      ],
    );
  }
}

