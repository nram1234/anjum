import 'dart:ffi';

import 'package:anjum/controllers/allCategoriesController.dart';
import 'package:anjum/network/jsonofnwetry/get_third_step_json.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Filter extends StatefulWidget {
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  AllCategoriesController bata = Get.find<AllCategoriesController>();
  bool tee = false;


// double maxRang=0;
//   double minRang=0;
//   double selectmaxRang=0;
//   double selectminRang=0;
  List<Widget> cat = [];
  List<Widget> subcat = [];
  List<AllCategories> allcat = [];
  List<SubCategories> allsubcat = [];
// TextEditingController maxRang=TextEditingController();
//   TextEditingController minRang=TextEditingController();
  @override
  void initState() {

    super.initState();

    // for(int i=0;i<allcat.length;i++){
    //   cat.add(items(data: allcat[i]));
    // }
    // for(int i=0;i<allsubcat.length;i++){
    //   subcat.add(subitems(data: allsubcat[i]));
    // }
    restcato();
    print('444444444444444444444444444444444444444444444444444444444');
  }

  restcato() {
    cat.clear();
    subcat.clear();
    for (int i = 0; i < bata.allCategories.length; i++) {
      allcat.add(bata.allCategories[i]);
      cat.add(items(data: bata.allCategories[i]));
      for (int o = 0; o < bata.allCategories[i].subCategories.length; o++) {
        print(bata.allCategories[i].subCategories[o].subCategoryNameEn);
        print(bata.allCategories[i].categoryNameEn);
        allsubcat.add(bata.allCategories[i].subCategories[o]);
        subcat.add(subitems(data: bata.allCategories[i].subCategories[o]));
      }
    }
  }

  removefromcat(AllCategories categories) {
    allcat.remove(categories);
    cat.clear();
    subcat.clear();
    for (int i = 0; i < allcat.length; i++) {
      cat.add(items(data: allcat[i]));
    }
    for (int i = 0; i < categories.subCategories.length; i++) {
      allsubcat.remove(categories.subCategories[i]);
    }
    for (int i = 0; i < allsubcat.length; i++) {
      subcat.add(subitems(data: allsubcat[i]));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(bata.allCategories.length);
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () {},
                      child: Text(
                        'X',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Filter'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Categories'),
                      InkWell(
                          onTap: () {
                            restcato();
                            setState(() {});
                          },
                          child: Text('Clear All')),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GetBuilder<AllCategoriesController>(builder: (logic) {
                    print(logic.filterCategories);
                    restcato();
                    return Wrap(children: cat

                        // bata.allCategories.map((e) {
                        //   items(data: e);
                        // }).toList(),
                        );
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Sub Categories'),
                      Text('Clear All'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GetBuilder<AllCategoriesController>(
                    builder: (logic) {
                      return Wrap(
                        children: subcat,
                      );
                    },
                  ),
                ),
                // GetBuilder<AllCategoriesController>(builder: (logic) {
                //   return RangeSlider(
                //     onChanged: (v) {
                //    logic.updataRangeVal(v)  ;
                //     //  setState(() {});
                //     },
                //     max: 100,
                //     min: 0,
                //     values: logic.slide,
                //     labels: RangeLabels(
                //       logic.    slide.start.round().toString(),
                //       logic.    slide.end.round().toString(),
                //     ),
                //     divisions: 20,
                //   );
                // }),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text("Price From",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                      Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(onChanged: (v){
                              if(v!=null||v.isEmpty){
                                bata.updataminRangVal(v);
                              }

                            },),
                          )),
                      Text("To",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),) ,
                      Flexible(flex: 1, child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(onChanged: (v){
                          if(v!=null||v.isEmpty){
                            bata.updatamaxRangVal(v);
                          }

                        },),
                      )),
                    ],
                  ),
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      bata.isflter.value=true;

                      bata.updatf();
                      Get.back();
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Color(0xff2C4B89),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Text(
                        'apply'.tr,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget items({AllCategories data}) {
    return GestureDetector(
      onTap: () {
        // removefromcat(  data);
        print("5555555555555555555555");
        bata.updatefilterCategories(data);
        print(bata.filterCategories);
        tee = true;
        setState(() {});
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 80,
          height: 50, //data.categoryNameAr
          child: Center(
              child: Text(
            Get.locale.languageCode == "en"
                ? data.categoryNameEn
                : data.categoryNameAr,
            textAlign: TextAlign.center,
          )),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: bata.filterCategories
                          .where((element) => element.id == data.id)
                          .length >
                      0
                  ? const Color(0xFF0078F3)
                  : const Color(0xFFCBCED1)),
        ),
      ),
    );
  }

  Widget subitems({SubCategories data}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          bata.updatefiltersubCategories(data);
        },
        child: Container(
          width: 80,
          height: 50, //data.categoryNameAr
          child: Center(
              child: Text(
            data.subCategoryNameEn,
            textAlign: TextAlign.center,
          )),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: bata.filtersubCategories
                          .where((element) => element.id == data.id)
                          .length >
                      0
                  ? const Color(0xFF0078F3)
                  : const Color(0xFFCBCED1)),
        ),
      ),
    );
  }
}
