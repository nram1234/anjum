

import 'package:flutter/material.dart';

import 'dashboard.dart';


class ChequePay extends StatefulWidget {
  @override
  _ChequePayState createState() => _ChequePayState();
}

class _ChequePayState extends State<ChequePay> {
  String getDate, date2;
  Future<String> pickdate() async {
    DateTime time = await showDatePicker(
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2050),
        context: context);
    print(time);

    date2 = time.toString().substring(0, 10);
    return date2;
  }
  String dropdownValue = '1';
  String dropdownValue1 = 'left';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Container(
                height: size.height * 2,
                width: size.width,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/bk.png',
                      width: size.width,
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                        left: size.width * .05,
                        top: size.height * .05,
                        child: InkWell(
                          onTap: (){  Navigator.pop(context);},
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 50,
                          ),
                        )),
                    Positioned(
                      right: size.width * .05,
                      top: size.height * .1,
                      child: Container(
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dashboard()),
                                );
                              },
                              child: Icon(
                                Icons.home,
                                color: Colors.white,
                                size: 30,
                              ))),
                    ),
                    Positioned(
                        left: size.width * .1,
                        top: size.height * .12,
                        child: Text(
                          'Cheque Payment',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )), ],
                )),
            Positioned(
                right: 0,
                left: 0,
                top: size.height * .2,
                child: Container(
                  height: size.height * .8,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30))),
                  child: Column(
                    children: [
                      //cheque no
                      Positioned(
                        top: size.height * .25,
                        left: size.width * .04,
                        child: Text("Cheque  no",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
                      ),
                      Positioned(
                        top: size.height * .31,
                        left: size.width * .04,
                        child: Container(
                          width: size.width * .8,
                          height: size.height * .04,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.0),
                            color: const Color(0xffffffff),
                            border: Border.all(
                                width: 1.0,
                                color: const Color(0xffd4edff)),
                          ),
                          child: TextField(),
                        ),
                      ),

                      //bank
                      Positioned(
                        top: size.height * .25,
                        left: size.width * .04,
                        child: Text("Bank",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
                      ),
                      Positioned(
                        top: size.height * .31,
                        left: size.width * .04,
                        child: Container(
                          width: size.width * .8,
                          height: size.height * .04,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.0),
                            color: const Color(0xffffffff),
                            border: Border.all(
                                width: 1.0,
                                color: const Color(0xffd4edff)),
                          ),
                          child: Container(
                            width: size.width * .2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9.0),
                              color: const Color(0xffffffff),
                              border: Border.all(width: 1.0, color: const Color(0xffd4edff)),
                            ),
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              elevation: 30,
                              style: const TextStyle(color: Colors.grey),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownValue = newValue;
                                });
                              },
                              items: <String>['1', '2', '3', '4']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),

                      //branch
                      Positioned(
                        top: size.height * .25,
                        left: size.width * .04,
                        child: Text("branch",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
                      ),
                      Positioned(
                        top: size.height * .31,
                        left: size.width * .04,
                        child: Container(
                          width: size.width * .8,
                          height: size.height * .04,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.0),
                            color: const Color(0xffffffff),
                            border: Border.all(
                                width: 1.0,
                                color: const Color(0xffd4edff)),
                          ),
                          child: Container(
                            width: size.width * .2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9.0),
                              color: const Color(0xffffffff),
                              border: Border.all(width: 1.0, color: const Color(0xffd4edff)),
                            ),
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              elevation: 30,
                              style: const TextStyle(color: Colors.grey),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownValue = newValue;
                                });
                              },
                              items: <String>['1', '2', '3', '4']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),

                      //drawer
                      Positioned(
                        top: size.height * .25,
                        left: size.width * .04,
                        child: Text("drawer",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
                      ),
                      Positioned(
                        top: size.height * .31,
                        left: size.width * .04,
                        child: Container(
                          width: size.width * .8,
                          height: size.height * .04,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.0),
                            color: const Color(0xffffffff),
                            border: Border.all(
                                width: 1.0,
                                color: const Color(0xffd4edff)),
                          ),
                          child: Container(
                            width: size.width * .2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9.0),
                              color: const Color(0xffffffff),
                              border: Border.all(width: 1.0, color: const Color(0xffd4edff)),
                            ),
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              elevation: 30,
                              style: const TextStyle(color: Colors.grey),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownValue = newValue;
                                });
                              },
                              items: <String>['1', '2', '3', '4']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                      //add note
                      Positioned(
                        top: size.height * .25,
                        left: size.width * .04,
                        child: Text("Add Note",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),

                      ),
                      Positioned(
                        top: size.height * .31,
                        left: size.width * .04,
                        child: Container(
                          width: size.width * .8,
                          height: size.height * .04,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.0),
                            color: const Color(0xffffffff),
                            border: Border.all(
                                width: 1.0,
                                color: const Color(0xffd4edff)),
                          ),
                          child: TextField(),
                        ),
                      ),
                      //date
                      Positioned(
                        top: size.height * .021,
                        left: size.width * .04,
                        child: Text("Date",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
                      ),
                      Positioned(
                        top: size.height * .07,
                        left: size.width * .04,
                        child: Container(
                          width: size.width * .8,
                          height: size.height * .04,
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
                                width: size.width * .8),
                            child: ElevatedButton(
                              child: Row(
                                children: [
                                  Text('Select Date'),
                                  SizedBox(width: size.width * .48),
                                  Icon(Icons.calendar_today)
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                elevation: 20,
                                primary: Colors.white,
                                onPrimary: Colors.blueGrey,
                                shape: const BeveledRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5))),
                              ),
                              onPressed: () async {
                                pickdate().then((String value) {
                                  setState(() {
                                    getDate = value;
                                  });
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      //Amount of Cash
                      Positioned(
                        top: size.height * .13,
                        left: size.width * .04,
                        child: Text("Amount of Cash",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
                      ),
                      Positioned(
                        top: size.height * .19,
                        left: size.width * .04,
                        child:  Container(
                          width: size.width * .8,
                          height: size.height * .04,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.0),
                            color: const Color(0xffffffff),
                            border: Border.all(
                                width: 1.0,
                                color: const Color(0xffd4edff)),
                          ),
                          child: TextField(),
                        ),
                      ),
                      //image
                      Positioned(
                        top: size.height * .13,
                        left: size.width * .04,
                        child: Text("Image",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
                      ),
                      Positioned(
                        top: size.height * .19,
                        left: size.width * .04,
                        child:  Container(
                          width: size.width * .8,
                          height: size.height * .2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.0),
                            color: const Color(0xffffffff),
                            border: Border.all(
                                width: 1.0,
                                color: const Color(0xffd4edff)),
                          ),
                          child: InkWell(
                            onTap: (){},
                            child: Image.asset(
                              'assets/images/imgpicker.png',
                              width: size.width*.8,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),

                      //button
                      Positioned(
                        bottom: size.height * .021,
                        left: size.width * .14,
                        child: Container(
                          width: size.width * .7,
                          height: size.height * .06,

                          child: ConstrainedBox(
                            constraints: BoxConstraints.tightFor(
                                height: size.height * 1,
                                width: size.width * 1),
                            child: ElevatedButton(
                              child: Text('Submit'),
                              style: ElevatedButton.styleFrom(
                                elevation: 20,
                                primary: Colors.indigo,
                                onPrimary: Colors.white70,
                                shape: const BeveledRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5))),
                              ),
                              onPressed: () {

                                Navigator.pop(context);
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(builder: (context) => Bill()),
                                // );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),

          ],
        ),
      ),
    );
  }
}
