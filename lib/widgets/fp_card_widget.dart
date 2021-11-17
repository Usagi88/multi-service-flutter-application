import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final value = new NumberFormat("#,##0.00", "en_US");

class FPCard extends StatelessWidget {
  int fpCardColor; //put icon later
  String title;
  String date;
  double amount;
  String currency;

  FPCard({Key? key,
    required this.fpCardColor,
    required this.title,
    required this.date,
    required this.amount,
    required this.currency
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait){
      return _portraitModeOnly(context);
    }else{
      return _landscapeModeOnly(context);
    }
  }

  //portrait
  Container _portraitModeOnly(BuildContext context){
    return Container(
        alignment: Alignment.center,
        constraints: BoxConstraints(
            minHeight: 59
        ),

        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),

        child: Row(
          children: [
            Container(
              width: 2,
              height: 40,
              color: Color(fpCardColor),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 38,
              height: 41,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5))
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(title,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text(date,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, color: Color(0xff929292)))
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(value.format(amount),textAlign: TextAlign.right,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, color: Color(fpCardColor)),),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(currency,textAlign: TextAlign.right,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, color: Color(0xff626262)),),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 16,
            ),

          ],

        )

    );
  }

  //landscape
  Container _landscapeModeOnly(BuildContext context){
    return Container(
        alignment: Alignment.center,
        constraints: BoxConstraints(
            minHeight: 59
        ),

        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),

        child: Row(
          children: [
            Container(
              width: 2,
              height: 40,
              color: Color(fpCardColor),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 38,
              height: 41,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5))
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(title,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text(date,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, color: Color(0xff929292)))
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(value.format(amount),textAlign: TextAlign.right,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, color: Color(fpCardColor)),),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(currency,textAlign: TextAlign.right,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, color: Color(0xff626262)),),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 16,
            ),

          ],

        )

    );
  }
}

