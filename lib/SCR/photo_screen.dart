import 'dart:io';

import 'package:anjum/controllers/allChequesController.dart';
import 'package:anjum/controllers/userAndpermissions.dart';
import 'package:anjum/network/json/insert_photos_json.dart';
import 'package:anjum/network/networkReq.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({Key key}) : super(key: key);

  @override
  _PhotoScreenState createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  bool _serviceEnabled;
  TextEditingController supervisor_note = TextEditingController();
  TextEditingController salesmanager_note = TextEditingController();
  AllNetworking _allNetworking = AllNetworking();
  UserAndPermissions _userAndPermissions = Get.find<UserAndPermissions>();
  Location location = new Location();

  PermissionStatus _permissionGranted;
  LocationData _locationData;
  bool sendpic = false;
  File _image;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    loctionuser();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        top: true,
        child: Scaffold(
          body: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Center(
                child: GestureDetector(
                  onTap: () async {
                    final pickedFile =
                        await picker.getImage(source: ImageSource.camera);

                    setState(() {
                      if (pickedFile != null) {
                        _image = File(pickedFile.path);
                      } else {
                        print('No image selected.');
                      }
                    });
                  },
                  child: Container(
                    height: size.height * .5,
                    width: size.width * .8,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: _image == null
                        ? Icon(
                            Icons.camera_alt,
                            size: 50,
                          )
                        : Image.file(
                            _image,
                            height: size.height * .5,
                            fit: BoxFit.fill,
                            width: size.width * .8,
                          ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              // Center(
              //   child: Container(
              //     width: MediaQuery
              //         .of(context)
              //         .size
              //         .width * .85,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       border: Border.all(color: Colors.black, width: 1),
              //       color: Colors.white,
              //       // boxShadow: [
              //       //   BoxShadow(
              //       //     color: Colors.grey.withOpacity(0.5),
              //       //     spreadRadius: 5,
              //       //     blurRadius: 7,
              //       //     offset: Offset(
              //       //         0, 3), // changes position of shadow
              //       //   ),
              //       // ],
              //     ),
              //     child: TextField(controller: supervisor_note,
              //       onChanged: (v) {},
              //       maxLines: 6,
              //       decoration: InputDecoration(
              //         hintText: 'supervisor note',
              //         border: InputBorder.none,
              //         focusedBorder: InputBorder.none,
              //         enabledBorder: InputBorder.none,
              //         errorBorder: InputBorder.none,
              //         disabledBorder: InputBorder.none,
              //       ),
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 10,
              ),

              sendpic
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : GestureDetector(
                      onTap: () async {
                        sendpic=true;
                        setState(() {

                        });
                        // var data = Insert_photos_json().toJson();
                        // _locationData = await location.getLocation();
                        // ListInvoice invoce = ListInvoice();
                        // invoce.salesmanagerNote = salesmanager_note.text;
                        // invoce.supervisorNote = supervisor_note.text;
                        // invoce.userId = _userAndPermissions.user.userId;
                        // invoce.customerId = 12;
                        // invoce.storeId = _userAndPermissions.user.storeId;
                        // invoce.employeeId = _userAndPermissions.user.id;
                        // invoce.androidVersion = 10;
                        // invoce.appVersion = 1;
                        // invoce.batteryLife = 100;
                        // invoce.latitude = _locationData.latitude.toString();
                        // invoce.longitude = _locationData.longitude.toString();
                        // data['key'] = '1234567890';
                        // List<ListInvoice> list = [];
                        // list.add(invoce);
                        // print(invoce.toJson());
                        // data['list_invoice'] =
                        //     list;
                        // _allNetworking.insert_photos(data);
                        print(
                            "00000000000000000000000000000000000000000000000000000");
                        print(Get.find<AllChequesController>().customer.userId);
                        print(Get.find<AllChequesController>()
                            .customer
                            .customerId);
                        print(Get.find<AllChequesController>().customer.id);
                        print(
                            "00000000000000000000000000000000000000000000000000000");
                        _allNetworking
                            .insert_employee_visit_photos(
                                user_id: _userAndPermissions.user.userId,
                                customer_id:_userAndPermissions.user.id.toString()
                                    ,
                                employee_id:
                                    _userAndPermissions.user.id.toString(),
                                file: _image)
                            .then((value) {
                             // print("valuevaluevaluevalue${value.visitId.toString()}");
                          _allNetworking.insert_visit_photo_comments(
                              user_id: _userAndPermissions.user.userId,

                              customer_id:     Get.find<AllChequesController>()
                                  .customer

                                  .id ,
                              comment: "comment",
                              commented_by:  1,//  int.parse( _userAndPermissions.user.customerId) ,
                              visit_id: value.visitId ,
                              photo_id: value.visitId ).then((value) {
                                 print(value);
                                sendpic=false;
                                 int count =
                                 0;
                                 Navigator.popUntil(
                                     context,
                                         (route) {
                                       return count++ ==
                                           1;
                                     });
                                setState(() {

                                });
                          });

                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(4),
                        child: Center(
                            child: Text(
                          'ارسال',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        )),
                        width: MediaQuery.of(context).size.width * .25,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11.0),
                          color: Colors.indigoAccent,
                          border: Border.all(
                            width: 1.0,
                            color: const Color(0xFFEBEBEB),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ));
  }

  loctionuser() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.DENIED) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.GRANTED) {
        return;
      }
    }
    _locationData = await location.getLocation();
  }
}
