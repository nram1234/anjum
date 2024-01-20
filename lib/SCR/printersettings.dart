import 'package:flutter/material.dart';

import 'dashboard.dart';

class PrinterSettings extends StatefulWidget {
  @override
  _PrinterSettingsState createState() => _PrinterSettingsState();
}

enum SingingCharacter1 { zepra, bixlon }
enum SingingCharacter2 { inches3, inches5 }
enum SingingCharacter3 { Print_Code, Print_BarCode }

class _PrinterSettingsState extends State<PrinterSettings> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sHeight = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    SingingCharacter1? _type = SingingCharacter1.bixlon;
    SingingCharacter2 _label = SingingCharacter2.inches3;
    SingingCharacter3 _print = SingingCharacter3.Print_Code;
    bool _isChecked = true;
    String _currText = '';
    String dropdownValue = '1';
    List<String> text = [ "Print Barcode on Standard Paper", "Print Barcode With text"];
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
                        left: size.width * .1,
                        top: size.height * .1,
                        child: Text(
                          'Printers Settings',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                    Positioned(
                      right: size.width * .05,
                      top: size.height * .1,
                      child: Container(
                          child:InkWell(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Dashboard()),
                                );
                              },
                              child: Icon(Icons.home,color: Colors.white,size: 30, ))

                      ),
                    ),
                    Positioned(
                        left: size.width * .05,
                        top: size.height * .05,
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 50,
                        ))
                  ],
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
                  child: Stack(
                    children: [
                      Positioned(
                        top: size.height * .021,
                        left: size.width * .09,
                        child: Text(
                          "Printer Type",
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                      ),
                      Positioned(
                        top: size.height * .051,
                        left: size.width * .03,
                        child: Container(
                          height: size.height * .13,
                          width: size.width * .5,
                          child: Column(
                            children: [
                              ListTile(
                                title: const Text('zepra'),
                                leading: Radio<SingingCharacter1>(
                                  value: SingingCharacter1.zepra,
                                  groupValue: _type,
                                  onChanged: (SingingCharacter1? value) {
                                    setState(() {
                                      _type = value;
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text('bixlon'),
                                leading: Radio<SingingCharacter1>(
                                  value: SingingCharacter1.bixlon,
                                  groupValue: _type,
                                  onChanged: (SingingCharacter1? value) {
                                    setState(() {
                                      _type = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Positioned(
                        top: size.height * .17,
                        left: size.width * .09,
                        child: Text(
                          "Label Size",
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                      ),
                      Positioned(
                        top: size.height * .18,
                        left: size.width * .03,
                        child: Container(
                          height: size.height * .13,
                          width: size.width * .5,
                          child: Column(
                            children: [
                              ListTile(
                                title: const Text('inches3'),
                                leading: Radio<SingingCharacter2>(
                                  value: SingingCharacter2.inches3,
                                  groupValue: _label,
                                  onChanged: (SingingCharacter2? value2) {
                                    setState(() {
                                      _label = value2!;
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text('inches5'),
                                leading: Radio<SingingCharacter2>(
                                  value: SingingCharacter2.inches5,
                                  groupValue: _label,
                                  onChanged: (SingingCharacter2? value) {
                                    setState(() {
                                      _label = value!;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Positioned(
                        top: size.height * .3,
                        left: size.width * .09,
                        child: Text(
                          "Print Code Or BarCode ",
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                      ),
                      Positioned(
                        top: size.height * .32,
                        left: size.width * .03,
                        child: Container(
                          height: size.height * .13,
                          width: size.width * .5,
                          child: Column(
                            children: [
                              ListTile(
                                title: const Text('Print_BarCode'),
                                leading: Radio<SingingCharacter3>(
                                  value: SingingCharacter3.Print_BarCode,
                                  groupValue: _print,
                                  onChanged: (SingingCharacter3? value3) {
                                    setState(() {
                                      _print = value3!;
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text('Print_Code'),
                                leading: Radio<SingingCharacter3>(
                                  value: SingingCharacter3.Print_Code,
                                  groupValue: _print,
                                  onChanged: (SingingCharacter3? value) {
                                    setState(() {
                                      _print = value!;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: size.width * .05,
                        top: size.height * .4,
                        child: Container(
                          height: size.height * .42,
                          width: size.width * .8,
                          child: Column(
                            children: <Widget>[
                              Center(
                                child: Text(_currText,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              Container(
                                height: size.height * .15,
                                child: Column(
                                  children: text
                                      .map((t) => CheckboxListTile(
                                    title: Text(t),
                                    value: _isChecked,
                                    onChanged: (val) {
                                      setState(() {
                                        _isChecked = val!;
                                        if (val == true) {
                                          _currText = t;
                                        }
                                      });
                                    },
                                  ))
                                      .toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),


                      Positioned(
                        bottom: size.height * .18,
                        left: size.width * .14,
                        child: Container(
                          width: size.width * .7,
                          height: size.height * .05,

                            child: Row(
                              children: [
                                Text('Shift Logo By'),
                                SizedBox(width: size.width*0.3,),
                                Container(
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
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownValue = newValue!;
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
                              ],
                            ),
                          ),
                        ),

                      //button save
                      Positioned(
                        bottom: size.height * .021,
                        left: size.width * .14,
                        child: Container(
                          width: size.width * .7,
                          height: size.height * .05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.0),
                            color: const Color(0xffffffff),
                            border: Border.all(
                                width: 1.0, color: const Color(0xffd4edff)),
                          ),
                          child: ConstrainedBox(
                            constraints: BoxConstraints.tightFor(
                                height: size.height * 1, width: size.width * 1),
                            child: ElevatedButton(
                              child: Text('Save'),
                              style: ElevatedButton.styleFrom(
                                elevation: 20,
                                primary: Colors.indigo,
                                onPrimary: Colors.white70,
                                shape: const BeveledRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
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
