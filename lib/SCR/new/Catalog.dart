import 'package:anjum/SCR/new/supCategories.dart';
import 'package:anjum/controllers/allCategoriesController.dart';
import 'package:anjum/controllers/userAndpermissions.dart';
import 'package:anjum/network/jsonofnwetry/get_third_step_json.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Catalog extends StatefulWidget {
  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  List<AllCategories> allCategories =
      Get.find<AllCategoriesController>().allCategories;
  List<String> listofimage = [];
  UserAndPermissions _userAndPermissions = Get.find<UserAndPermissions>();

  @override
  Widget build(BuildContext context) {


    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      height: size.height,
      width: size.width,
      child: Stack(
        children: [
          Container(
              height: size.height * .3,
              width: size.width,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/bk.png',
                    width: size.width,
                    fit: BoxFit.fill,
                  ),
                ],
              )),
          Positioned(
            top: size.height * .06,
            right: size.width * .02,
            child: Container(
                height: 75,
                width: 75,
                child: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 50,
                )),
          ),
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
              left: size.width * .1,
              top: size.height * .1,
              child: Text(
                'cat'.tr,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
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
                  child: Padding(
                      padding: const EdgeInsets.only(
                          top: 16, right: 8, left: 8, bottom: 8),
                      child: GridView.builder(
                          itemCount: allCategories.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.3,
                            //(itemWidth / itemHeight),
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                          ),
                          itemBuilder: (context, pos) {
                            print(allCategories[pos].userId ==
                                _userAndPermissions.user.userId.toString());

                            if (allCategories[pos].userId ==
                                _userAndPermissions.user.userId.toString()) {
                              return InkWell(
                                onTap: () {
                                  Get.to(
                                      () => SupCategories(allCategories[pos]));
                                },
                                child: Container( margin: EdgeInsets.all(4),height: size.height * .25,decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)
                                  ),border: Border.all(color: Colors.blueAccent)

                                ),
                                  child: Stack(

                                   children: [ CachedNetworkImage( fit: BoxFit.fill,height: size.height * .25,
                                     imageUrl: allCategories[pos].categoryImage,//imageBuilder: (context, imageprovider) =>Container(),
                                     placeholder: (context, url) => Center(
                                       child: Text(". . . "),
                                     ),
                                   ),Positioned(bottom: 4,left: 0,right: 0,
                                     child: Text(
                                       allCategories[pos].categoryNameEn,textAlign: TextAlign.center,
                                       style: TextStyle(backgroundColor: Colors.white.withOpacity(.5),
                                           fontWeight: FontWeight.bold,
                                           fontSize: 20,color: Colors.black),
                                     ),
                                   ),],
                                  ),
                                ),
                              );
                            } else {
                              return const SizedBox();
                            }
                          })))),
        ],
      ),
    ));
  }
}
