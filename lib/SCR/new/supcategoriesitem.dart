import 'package:anjum/controllers/allItemsController.dart';
import 'package:anjum/network/jsonofnwetry/get_third_step_json.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SupCategoriesItem extends StatefulWidget {
  SubCategories subCategories;

  SupCategoriesItem(this.subCategories);

  @override
  _SupCategoriesItemState createState() => _SupCategoriesItemState();
}

class _SupCategoriesItemState extends State<SupCategoriesItem> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(appBar:AppBar(title: Text(widget.subCategories.subCategoryNameAr),centerTitle: true,),
            body: ListView.builder(
                itemCount: Get.find<AllItemsController>().allItems.length,
                itemBuilder: (context, pos) {
                  if (Get.find<AllItemsController>()
                          .allItems[pos]
                          .itemDetails[0]
                          .subCategoryId ==
                      widget.subCategories.id) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * .2,
                              child: CachedNetworkImage(
                                height:  MediaQuery.of(context).size.height * .2,
                                width:  MediaQuery.of(context).size.width * .4,
                                imageUrl: Get.find<AllItemsController>()
                          .allItems[pos]
                          .itemDetails[0].image,

                                placeholder: (context, url) => Center(
                                  child: Text(". . . "),
                                ),
                              ),
                            ),
                            Flexible(flex:1 ,
                              child: Column(crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(Get.find<AllItemsController>()
                                        .allItems[pos]
                                        .itemDetails[0]
                                        .itemNameEn),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(Get.find<AllItemsController>()
                                        .allItems[pos]
                                        .itemDetails[0]
                                        .itemNameAr),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(" السعر : ${Get.find<AllItemsController>()
                                        .allItems[pos]
                                        .itemDetails[0]
                                        .sellingPrice}"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(" اقل كمية : ${Get.find<AllItemsController>()
                                        .allItems[pos]
                                        .itemDetails[0]
                                        .minimumQuantity}"),
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.all(8.0),
                                  //   child: Text(Get.find<AllItemsController>()
                                  //       .allItems[pos]
                                  //       .itemDetails[0]
                                  //       .itemCost),
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                })));
  }
}
