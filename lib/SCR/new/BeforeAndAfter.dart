import 'dart:io';

import 'package:anjum/utilitie/utilities.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';

class BeforeAndAfter extends StatefulWidget {
  @override
  _BeforeAndAfterState createState() => _BeforeAndAfterState();
}

class _BeforeAndAfterState extends State<BeforeAndAfter> {
  File _image1, _image2;
  final picker = ImagePicker();
  LocationData locationData;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff2C4B89),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
                height: size.height * .18,
                width: size.width,
                color: Colors.blue,
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
                          'Before / After',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                    Positioned(
                        left: size.width * .05,
                        top: size.height * .05,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 30,
                          ),
                        )),
                    Positioned(
                      top: size.height * .06,
                      right: size.width * .02,
                      child: Container(
                        height: 75,
                        width: 75,
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                    )
                  ],
                )),
          ),
          Expanded(
            flex: 9,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                  color: Color(0xffeeeeee)),
              padding: EdgeInsets.only(top: 10),
              child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text("Before"),
                                SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: () async{
                                    final pickedFile = await picker.getImage(source: ImageSource.camera);

                                    setState(() {
                                      if (pickedFile != null) {
                                        _image1 = File(pickedFile.path);
                                      } else {
                                        print('No image selected.');
                                      }
                                    });
                                    },
                                  child: Container(
                                    height:size.width*.4,
                                    width: size.width*.4,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white),
                                    child:_image1==null? Icon(
                                      Icons.camera_alt,
                                      size: 50,
                                    ):Image.file(_image1, height:size.width*.4,
                                      width: size.width*.4,fit: BoxFit.fill,),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text("After"),
                                SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: () async{
                                    final pickedFile = await picker.getImage(source: ImageSource.camera);

                                    setState(() {
                                      if (pickedFile != null) {
                                        _image2 = File(pickedFile.path);
                                      } else {
                                        print('No image selected.');
                                      }
                                    });
                                  },
                                  child: Container(
                                    height:size.width*.4,
                                    width: size.width*.4,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white),
                                    child:_image2==null? Icon(
                                      Icons.camera_alt,
                                      size: 50,
                                    ):Image.file(_image2, height:size.width*.4,
                                      width: size.width*.4,fit: BoxFit.fill,),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        child: TextField(
                          onChanged: (v) {},
                          maxLines: 5,
                          decoration: InputDecoration(
                            hintText: "Add Note",
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      RaisedButton(
                        onPressed: () {
                          getMyLoction(  locationData    );
                        },
                        color: Color(0xff2C4B89),
                        child: Text(
                          "Submit",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }


}
