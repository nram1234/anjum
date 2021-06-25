import 'package:anjum/controllers/langController.dart';
import 'package:anjum/controllers/userAndpermissions.dart';
import 'package:anjum/network/controllers/network_controller.dart';
import 'package:anjum/network/networkReq.dart';
import 'package:anjum/utilitie/utilities.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var box = GetStorage();
  bool _checkbox = false;
  bool login = false;
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController url = TextEditingController();
  TextEditingController user_Id = TextEditingController();
  UserAndPermissions _userAndPermissions = Get.put(UserAndPermissions());
  final NetWorkController _controller =
      Get.put(NetWorkController(), permanent: true);
  final LangController _langController =
      Get.put(LangController(), permanent: true);

  AllNetworking _allNetworking = AllNetworking();

  @override
  void initState() {
    super.initState();
    var lan = box.read('lan');
    var user = box.read('user');
    var passwor = box.read('password');

    name.text = user;
    password.text = passwor;

    if (lan != null) {
      if (lan == 'ar') {
        var locale = Locale('ar', 'AR');
        Get.updateLocale(locale);
      } else {
        var locale = Locale('en', 'En');
        Get.updateLocale(locale);
      }
    }
    print('llllllllllllllllllll');
    print(box.read('lan'));
  }

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
                      obscureText: true,
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
                      controller: user_Id,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Userid'.tr,
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
                          hintText: 'changeURL'.tr,
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
                        GestureDetector(
                          onTap: () {
                            box.write('lan', 'ar');
                            var locale = Locale('ar', 'AR');
                            Get.updateLocale(locale);
                          },
                          child: Container(
                            color: Colors.white,
                            width: 75,
                            height: 35,
                            child: Center(child: Text('AR')),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            box.write('lan', 'en');
                            var locale = Locale('en', 'US');
                            Get.updateLocale(locale);
                          },
                          child: Container(
                            color: Colors.white,
                            width: 75,
                            height: 35,
                            child: Center(child: Text('EN')),
                          ),
                        ),
                        Expanded(child: Container()),
                        Text('Rememberme'.tr),
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
                  login
                      ? CircularProgressIndicator()
                      : GestureDetector(
                          onTap: () async {
                            // http.Response response = await http.post(
                            //     Uri.parse(
                            //         "http://18.220.206.74/API/api/auth/login"),
                            //     body: {
                            //       "mode": "formdata",
                            //       "user_name": "omar.m",
                            //       "password": "12345678",
                            //       "user_id": "12",
                            //     });
                            // print(
                            //     '000000000000000000000000000000000000000000000000000000000000000000');
                            // print(response.bodyBytes);
                            // print(response.reasonPhrase);
                            // print(response.isRedirect);
                            // print("response.headers ${response.headers}");
                            // print('response.statusCode  ${response.statusCode}');
                            // print(response.persistentConnection);
                            // print(response.body);
                            // print('000000000000000000000000000000000000000000000000000000000000000000');
                            //


                            if(url.text.isNotEmpty){
                              AllNetworking.paseurl=url.text;
                            }
                            print( AllNetworking.paseurl);
                            if(user_Id.text != null&&user_Id.text.isNotEmpty){
                              if (name.text != null && password.text != null) {
                                login=true;
                                setState(() {

                                });
                                if(_checkbox){
                                  box.write('user', name.text);
                                  box.write('password', password.text);
                                }
                                _allNetworking
                                    .login(
                                    user_name: name.text, password: password.text,user_id: int.tryParse(user_Id.text))
                                    .then((value) {
                                  if (value != null) {
                                    print(value.user);
                                    _userAndPermissions.setuser(value.user);
                                    _userAndPermissions
                                        .setPermissions(value.permissions);
print(value.toString());
                                    Get.to(Home());

                                  }
                                  login=false;
                                  setState(() {

                                  });  })
                                    .catchError((e) {
                                  print("oooooooooooooooooooooooooooooo");
                                  Get.snackbar("", e.toString()+"oooooooooooooooooooooooooooooo");
                                });
                              } else {
                                Get.snackbar("", 'تاكد من ادخال البيانات ');
                              }
                            }else {
                              Get.snackbar("", 'تاكد من ادخال رقم الشركة ');
                            }
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
                              'login'.tr,
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
