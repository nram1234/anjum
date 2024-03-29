import 'package:anjum/controllers/all_promotionsController.dart';
import 'package:anjum/network/jsonofnwetry/get_Fifth_step_json.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class PromotionList extends StatefulWidget {
  @override
  _PromotionListState createState() => _PromotionListState();
}

class _PromotionListState extends State<PromotionList> {
  List<String> titles = ["Promotion No","Promotion Name","Promotion Details"];
  All_PromotionsController _all_promotionsController =Get.find<All_PromotionsController>();
String serchword="";
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
                          'Promotion List',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                    Positioned(
                        left: size.width * .05,
                        top: size.height * .05,
                        child: GestureDetector(onTap:(){
                          Navigator.pop(context);
                        } ,
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 30,
                          ),
                        )),
                    Positioned(top: size.height*.06,right: size.width*.02,
                      child: Container(height: 75,width: 75,
                          child: Icon(Icons.home,color: Colors.white,size: 50,)
                      ),
                    )
                  ],
                )),
          ),
          Expanded(
            flex: 9,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
                  color: Color(0xffeeeeee)
              ),
              padding: EdgeInsets.only(top: 10),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15), color: Colors.blue[100]),
                          width: size.width * .9,
                          height: 50,
                          margin: EdgeInsets.only(top: 15),
                          padding: EdgeInsets.all(0.5),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15), color: Colors.white),
                            child: TextField(
                              onChanged: (v) {
                                if(!v.isEmpty||v!=null){
                                  serchword=v;
                                  setState(() {

                                  });
                                }
                              },
                              decoration: InputDecoration(
                                hintText: "Search",
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                prefixIcon: Icon(Icons.search,color: Color(0xffd3d3d3),),
                              ),
                            ),
                          ),
                        ),
                        ListView.builder(
                          itemCount: 3,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context,index){serchword;
if( _all_promotionsController.allPromotionss[index].id.contains(serchword)||_all_promotionsController.allPromotionss[index].name.contains(serchword)){
  return PRomotionListCardUI(allPromotions:  _all_promotionsController.allPromotionss[index]);
}else{return SizedBox();}

                        })
                      ],
                    ),
                  ),
                )
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget PRomotionListCardUI({required AllPromotions allPromotions}) {
    return Container(
      height: 150,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(child: Text(titles[0],style: TextStyle(color: Colors.black,fontSize: 17),)),
                Expanded(child: Text(allPromotions.id.toString(),style: TextStyle(color: Colors.black),)),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(child: Text(titles[1],style: TextStyle(color: Colors.black,fontSize: 17),)),
                Expanded(child: Text(allPromotions.name,style: TextStyle(color: Colors.black),)),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(child: Text(titles[2],style: TextStyle(color: Colors.black,fontSize: 17),)),
                Expanded(child: Text(allPromotions.description,style: TextStyle(color: Colors.black),)),
              ],
            ),
          ), Expanded(
            child: Row(
              children: [
                Expanded(child: Row(
                  children: [Icon(Icons.calendar_today),SizedBox(width: 4,),
                    Text(allPromotions.startDateTime.split(' ')[0].toString(),style: TextStyle(color: Colors.black ),),
                  ],
                )),
                Expanded(child: Row(
                  children: [Icon(Icons.calendar_today),SizedBox(width: 4,),
                    Text(allPromotions.endDateTime.split(' ')[0].toString(),style: TextStyle(color: Colors.black),textAlign: TextAlign.start,),
                  ],
                )),
              ],
            ),
          ),
       ],
      ),
    );
  }
}
