import 'package:anjum/SCR/prodectsTestt.dart';
import 'package:anjum/SCR/products.dart';
import 'package:anjum/network/jsonofnwetry/get_fourth_step_json.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurenceController extends GetxController {
  Map<String, AllCurrencies> allCurrencie = {};
  late AllCurrencies defultCurrencies;


  setallCurrencie(List<AllCurrencies> list){
    list.forEach((element) {
      allCurrencie[element.currencyName]=element;
    });
    allCurrencie.forEach((key, value) {
      if(allCurrencie.length<2)
      {
      defultCurrencies = value;
      }
      if (value.currencySymbolFirst == '1') {
         // defultCurrencies = value;
      }
    });

    update();}

  showDio(context){
    List<Widget>action=[];
    defultCurrencies ;
    // allCurrencie
    //     .entries
    //     .map((e) {
    //     action.add(Row(
    //       mainAxisAlignment:
    //       MainAxisAlignment
    //           .spaceAround,
    //       children: [
    //         Padding(
    //           padding:
    //           const EdgeInsets.all(8.0),
    //           child:
    //           Text(
    //             e.value
    //                 .currencyName,
    //             style: TextStyle(
    //                 fontWeight: FontWeight.bold,
    //                 fontSize: 16),
    //           ),
    //         ),
    //         GetBuilder<
    //             CurenceController>(
    //           builder:
    //               (logic) {
    //             return Radio(
    //                 value: e.value,
    //                 groupValue: logic.defultCurrencies,
    //                 onChanged: (v) {
    //                   logic.setCurrencie( allCurrencies: v);
    //                   Get.to(ProductsScr());
    //                 });
    //           },
    //         )
    //       ],
    //     ));
    // });
    showDialog(
        context: context,
        builder:
            (cont ) =>
            AlertDialog(elevation: 8,
              title: Text(
                  'Select Currency'),
              actions:
                   allCurrencie
                  .entries
                  .map((e) {
                return Row(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .spaceAround,
                  children: [
                    Padding(
                      padding:
                      const EdgeInsets.all(8.0),
                      child:
                      Text(
                        e.value
                            .currencyName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    GetBuilder<
                        CurenceController>(
                      builder:
                          (logic) {
                        return Radio(
                            value: e.value,
                            groupValue: logic.defultCurrencies,
                            onChanged: (v) {
                              logic.setCurrencie(context: cont, allCurrencies: v!);
                              Navigator.pop(cont);
                              //Get.to(ProductsScr());
                              Get.to(ProdectTestt());
                            });
                      },
                    )
                  ],
                );
              }).toList(),
            ));
  }









  setCurrencie({required AllCurrencies allCurrencies, context}){
    defultCurrencies=allCurrencies;
    update();
    // Navigator.pop(context);
    // Get.to(() =>ProductsScr());
  }
  setCurrenciedropdowen({required AllCurrencies allCurrencies }){
    defultCurrencies=allCurrencies;
    update();
    // Navigator.pop(context);
    // Get.to(() =>ProductsScr());
  }






}