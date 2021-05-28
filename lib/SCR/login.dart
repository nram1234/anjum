import 'package:anjum/controllers/userAndpermissions.dart';
import 'package:anjum/network/controllers/network_controller.dart';
import 'package:anjum/network/networkReq.dart';
import 'package:anjum/utilitie/utilities.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _checkbox = false;
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController url = TextEditingController();
  UserAndPermissions _userAndPermissions = Get.put(UserAndPermissions());
  final NetWorkController _controller = Get.put(NetWorkController());
  AllNetworking _allNetworking = AllNetworking();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: size.height,
          width: size.width,
          child: Image.asset(
            'assets/images/back.png',
            fit: BoxFit.fill,
          ),
        ),
        Center(
          child: Container(
            height: size.height,
            width: size.width,
            child: SingleChildScrollView(
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * .2,
                  ),
                  Container(
                    width: size.width * .8,
                    child: Image.asset(
                      'assets/images/logo.png',
                    ),
                  ),
                  SizedBox(
                    height: size.height * .02,
                  ),
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * .02,
                  ),
                  Container(
                    width: size.width * .85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: name,
                      decoration: InputDecoration(
                          hintText: 'user'.tr,
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          prefixIcon: Icon(Icons.person_rounded)),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .02,
                  ),
                  Container(
                    width: size.width * .85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: password,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'password'.tr,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          prefixIcon: Icon(Icons.lock)),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .02,
                  ),
                  Container(
                    width: size.width * .85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: url,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'change app URL (optional)',
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          prefixIcon: Icon(Icons.ac_unit)),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .02,
                  ),
                  Container(
                    width: size.width * .85,
                    child: Row(
                      children: [
                        Container(
                          color: Colors.white,
                          width: 75,
                          height: 35,
                          child: Center(child: Text('AR')),
                        ),
                        Container(
                          color: Colors.white,
                          width: 75,
                          height: 35,
                          child: Center(child: Text('EN')),
                        ),
                        Expanded(child: Container()),
                        Text('Remember me'),
                        Container(
                          height: 50,
                          width: 25,
                          child: Checkbox(
                            value: _checkbox,
                            onChanged: (value) {
                              setState(() {
                                _checkbox = !_checkbox;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * .02,
                  ),
                  GestureDetector(
                    onTap: () {
                      if(url.text.isNotEmpty){
                        AllNetworking.paseurl=url.text;
                      }
                      print( AllNetworking.paseurl);
                      if (name.text != null && password.text != null) {
                        _allNetworking
                            .login(
                                user_name: name.text, password: password.text)
                            .then((value) {
                          if (value != null) {
                            _userAndPermissions.setuser(value.user);
                            _userAndPermissions
                                .setPermissions(value.permissions);

                            Get.to(Home());
                            return;
                          }
                        });
                        //     .catchError((e) {
                        //   print(e.toString());
                        //   Get.snackbar("", e.toString()+"oooooooooooooooooooooooooooooo");
                        // });
                      } else {
                        Get.snackbar("", 'تاكد من ادخال البيانات ');
                      }

                          Get.offAll(Home());
                    },
                    child: Container(
                      height: 50,
                      width: size.width * .85,
                      decoration: BoxDecoration(
                        color: Color(0xff2C4B89),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Text(
                        'Login Now',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    )
        //_controller.connectionStatus.value?

        // :Center(child: Text('لا يوجد اتصال بلانترنت'),)

        );
  }
}
