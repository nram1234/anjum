import 'package:anjum/SCR/new/supcategoriesitem.dart';
import 'package:anjum/network/jsonofnwetry/get_third_step_json.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SupCategories extends StatefulWidget {
  AllCategories categories;

  SupCategories(this.categories);

  @override
  _SupCategoriesState createState() => _SupCategoriesState();
}

class _SupCategoriesState extends State<SupCategories> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            widget.categories.categoryNameEn,
          )),
      body:GridView.builder(
          itemCount: widget.categories.subCategories.length,
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.3,
            //(itemWidth / itemHeight),
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemBuilder: (context, pos) {


              return InkWell(
                onTap: () {
                  Get.to(()=>SupCategoriesItem(widget.categories.subCategories[pos]));
                },
                child: Container( margin: EdgeInsets.all(4),width:size.width*.4 ,height: size.height * .25,decoration: BoxDecoration(
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
                      imageUrl:  widget.categories.subCategories[pos].categoryNameEn,//imageBuilder: (context, imageprovider) =>Container(),
                      placeholder: (context, url) => Center(
                        child: Text(". . . "),
                      ),
                    ),Positioned(bottom: 4,left: 0,right: 0,
                      child: Text(
                        Get.locale?.languageCode =="en" ? widget.categories.subCategories[pos].subCategoryNameEn:  widget.categories.subCategories[pos].subCategoryNameAr,textAlign: TextAlign.center,
                        style: TextStyle(backgroundColor: Colors.white.withOpacity(.5),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,color: Colors.black),
                      ),
                    ),],
                  ),
                ),
              );

          })
       ,
    );
  }
}

//
// ListView.builder(
// itemCount: widget.categories.subCategories.length,
// itemBuilder: (context, pos) {
// return InkWell(onTap: (){
// Get.to(()=>SupCategoriesItem(widget.categories.subCategories[pos]));
// },
// child: Container(  decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(10),
// topRight: Radius.circular(10),
// bottomLeft: Radius.circular(10),
// bottomRight: Radius.circular(10)
// ),
// boxShadow: [
// BoxShadow(
// color: Colors.grey.withOpacity(0.5),
// spreadRadius: 5,
// blurRadius: 7,
// offset: Offset(0, 3), // changes position of shadow
// ),
// ],
// ),
// padding: EdgeInsets.all(8),margin:EdgeInsets.all(8) ,
// height: size.height * .25,
// child: Row(crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Container( height: size.height * .25,
// width: size.width * .35,
// child:
// // Image.network(
// //   widget.categories.subCategories[pos].image,
// //
// // ),
// CachedNetworkImage(  height: 75,
// width: 75,
// imageUrl: widget.categories.subCategories[pos].categoryNameEn,//imageBuilder: (context, imageprovider) =>Container(),
// placeholder: (context, url) => Center(
// child: Text(". . . "),
// ),
// )),
// Expanded(
// flex: 1,
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: Column(crossAxisAlignment:   CrossAxisAlignment.end,
// children: [
// Text(
// " الاسم: ${widget.categories.subCategories[pos].subCategoryNameAr} ",textAlign: TextAlign.end,),
// const SizedBox(
// height: 10,
// ),
// Text(
// "${widget.categories.subCategories[pos].subCategoryNameEn}:Name"),
// ],
// ),
// ))
// ],
// ),
// ),
// );
// })