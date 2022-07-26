import 'package:flutter/material.dart';
import 'package:fpapp/provider/locale_provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

final value = new NumberFormat("#,##0.00", "en_US");

class FPCard extends StatelessWidget {
  int fpCardColor; //put icon later
  String title;
  String date;
  double amount;
  String currency;
  String image;

  FPCard({Key? key,
    required this.fpCardColor,
    required this.title,
    required this.date,
    required this.amount,
    required this.currency,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var language = Provider.of<LocaleProvider>(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return _portraitModeOnly(context, language);
  }

  //portrait
  Container _portraitModeOnly(BuildContext context, language){
    if (language.locale.toString() == 'dv' || language.locale.toString() == 'ar'){
      return Container(
          alignment: Alignment.center,
          width: double.infinity,
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
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    image: DecorationImage(
                      image: AssetImage(
                        image),
                      fit: BoxFit.fill,
                    ),
                ),

              ),
              SizedBox(
                width: 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  //mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text(title,style: TextStyle(fontWeight: FontWeight.w400),),
                      ),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text(date,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, color: Color(0xff929292), fontFamily: 'Roboto'))
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Column(
                  //mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      //color: Colors.green,
                      alignment: Alignment.centerLeft,
                      //width: MediaQuery.of(context).size.width * 0.3,
                      child: Text(value.format(amount),textAlign: TextAlign.left,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, color: Color(fpCardColor), fontFamily: 'Roboto'),),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      //width: MediaQuery.of(context).size.width * 0.3,
                      child: Text(currency,textAlign: TextAlign.left,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, color: Color(0xff626262), fontFamily: 'Roboto'),),
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

    return Container(
        alignment: Alignment.center,
        width: double.infinity,
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
                borderRadius: BorderRadius.all(Radius.circular(5)),
                image: DecorationImage(
                  image: AssetImage(
                      image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Column(
                //mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text(title,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text(date,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400, color: Color(0xff929292)))
                  ),
                ],
              ),
            ),
            //Spacer(),
            Expanded(
              child: Column(
                //mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    //color: Colors.green,
                    alignment: Alignment.centerRight,
                    //width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(value.format(amount),textAlign: TextAlign.right,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, color: Color(fpCardColor)),),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    //width: MediaQuery.of(context).size.width * 0.3,
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

