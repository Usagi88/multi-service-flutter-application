import 'package:flutter/material.dart';


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



class CustomShape extends CustomPainter {
  final Color bgColor;

  CustomShape(this.bgColor);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = bgColor;

    var path = Path();
    path.lineTo(-5, 0);
    path.lineTo(0, 10);
    path.lineTo(5, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}