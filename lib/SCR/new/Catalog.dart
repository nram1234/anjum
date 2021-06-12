import 'package:anjum/controllers/allCategoriesController.dart';
import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Catalog extends StatefulWidget {
  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  List<AllCategories> allCategories =
      Get.find<AllCategoriesController>().allCategories;
  List<String>listofimage=[];


  @override
  Widget build(BuildContext context) {

    print(allCategories);

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
                'Catalog',
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
                            childAspectRatio: .8,
                            //(itemWidth / itemHeight),
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5,
                          ),
                          itemBuilder: (context, pos) {
                            return Container(child:Center(child: Text(allCategories[pos].categoryNameEn),),
                              height: size.height * .2,
                              width: size.width * .4,
                              decoration: BoxDecoration(color: Colors.indigoAccent[100],
                                  borderRadius: BorderRadius.circular(10)),
                            );
                          })))),
        ],
      ),
    ));
  }
}
