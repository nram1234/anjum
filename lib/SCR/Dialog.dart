import 'package:flutter/material.dart';

import 'cashpayment.dart';
import 'chequepay.dart';

final _formkey = GlobalKey<FormState>();
final _myController1 = TextEditingController();

class Dialogpay extends StatefulWidget {


   Dialogpay();

  @override
  _DialogpayState createState() => _DialogpayState();
}

class _DialogpayState extends State<Dialogpay> {
  String getDate, date2;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .15,
      width: size.width,
      child: Stack(
        children: [
          Positioned(
            top: size.height * .002,
            left: size.width * .09,
            child: Text(
              "Payment Method",
              style: (TextStyle(color: Colors.blue)),
            ),
          ),
          Positioned(
            top: size.height * .021,
            left: size.width * .009,
            child: Row(
              children: [
                Container(
                  width: size.width * .4,
                  height: size.height * .08,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                        height: size.height * 1,
                        width: size.width * .05),
                    child: ElevatedButton(
                      child: Text('Cash'),
                      style: ElevatedButton.styleFrom(
                        elevation: 20,
                        primary: Colors.white70,
                        onPrimary: Colors.orangeAccent,
                        shape: const BeveledRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(5))),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CashPay()),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  width: size.width * .4,
                  height: size.height * .08,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.0),
                    color: const Color(0xffffffff),
                    border: Border.all(
                        width: 1.0,
                        color: const Color(0xffd4edff)),
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                        height: size.height * 1,
                        width: size.width * 1),
                    child: ElevatedButton(
                      child: Text('Cheque'),
                      style: ElevatedButton.styleFrom(
                        elevation: 20,
                        primary: Colors.white70,
                        onPrimary: Colors.orangeAccent,
                        shape: const BeveledRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(5))),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ChequePay()),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
