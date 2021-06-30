import 'dart:ffi';

import 'package:anjum/controllers/allCategoriesController.dart';
import 'package:anjum/network/json/get_employee_data_json.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Filter extends StatefulWidget {
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  AllCategoriesController bata = Get.put(AllCategoriesController()) ;

  var slide=RangeValues(0.5,50);

List<Widget>cat=[];
  List<Widget>subcat=[];
  List<AllCategories>allcat=[];
  List<SubCategories>allsubcat=[];
  @override
  void initState() {
    super.initState();
    // for(int i=0;i<bata.allCategories.length;i++){
    //   allcat.add(bata.allCategories[i]);
    //  // cat.add(items(data: bata.allCategories[i]));
    //   for(int o=0;o<bata.allCategories[i].subCategories.length;o++){
    //     allsubcat.add( bata.allCategories[i].subCategories[o]);
    //  //   subcat.add(subitems (data: bata.allCategories[i].subCategories[o] ));
    //   }
    // }
    // for(int i=0;i<allcat.length;i++){
    //   cat.add(items(data: allcat[i]));
    // }
    // for(int i=0;i<allsubcat.length;i++){
    //   subcat.add(subitems(data: allsubcat[i]));
    // }
  }
removefromcat(AllCategories categories){
//   allcat.remove(categories);
//   cat.clear();
//   subcat.clear();
//   for(int i=0;i<allcat.length;i++){
//     cat.add(items(data: allcat[i]));
//   }
//   for(int i=0;i<categories.subCategories.length;i++){
//     allsubcat.remove(categories.subCategories[i]);
//
//   }
//   for(int i=0;i<allsubcat.length;i++){
//     subcat.add(subitems(data: allsubcat[i]));
//   }
// setState(() {
//
// });
  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      top: true,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(onTap: () {}, child: Text('X')),
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
                    Text('Clear All'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  children: bata.allCategories.map((e) {
                    items(data: e);
                  }).toList(),
                ),
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
                child: Wrap(
                  children: subcat,
                ),
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
              ),    Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  children: cat,
                ),
              ),
              RangeSlider(   onChanged: (v){
                slide=v;
                setState(() {

                });
              },max: 100,min: 0,values: slide,  labels: RangeLabels(
                slide.start.round().toString(),
                slide.end.round().toString(),
              ), divisions: 20,)
            ],
          ),
        ),
      ),
    );
  }

  Widget items({AllCategories  data}) {
    return GestureDetector(onTap: (){
      removefromcat(  data);
    },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 80,
          height: 50,//data.categoryNameAr
          child: Center(child: Text(data.categoryNameEn)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: const Color(0xFFCBCED1)),
        ),
      ),
    );
  }
  Widget subitems({SubCategories  data}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 80,
        height: 50,//data.categoryNameAr
        child: Center(child: Text(data.subCategoryNameEn)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: const Color(0xFFCBCED1)),
      ),
    );
  }
}
