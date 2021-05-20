import 'package:anjum/controllers/userAndpermissions.dart';
import 'package:anjum/network/json/customer_json.dart';
import 'package:anjum/network/networkReq.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dashboard.dart';

class All_customer_tap1 extends StatefulWidget {
  @override
  _All_customer_tap1State createState() => _All_customer_tap1State();
}

class _All_customer_tap1State extends State<All_customer_tap1> {
  AllNetworking _allNetworking=AllNetworking();
  UserAndPermissions _userAndPermissions=Get.put(UserAndPermissions());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder<Customer_json>(
        future: _allNetworking.customer(employee_id: _userAndPermissions.user.customerId,  ),
        builder: (context, snapshot) {
          return ListView.builder(
              itemCount: snapshot.data.customers.length,
              itemBuilder: (context, pos) {

                return InkWell(onTap: (){
                  Get.to(Dashboard(),arguments:  59);
                },child: item(size: size, ));
              });
        }
      ),
    );
  }

  Widget item({size,data}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(elevation: 8,
        child: Container(
          height: size.height * .2,
          child: Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [

              Column(crossAxisAlignment: CrossAxisAlignment.end,
                children: [SizedBox(height: 8,),
                  GestureDetector(onTap: (){

                    Get.to(Dashboard());


                  },child: Text('Customer-1')),SizedBox(height: 4,),
                  Row(
                    children: [ Text('Adan,street 123'),
                      Icon(Icons.wrong_location_rounded),

                    ],
                  ),Expanded(child: Container()),
                  Row(
                    children: [
                      Text('view map'),
                        Icon(Icons.map),SizedBox(width: size.width*.05,),
                      Text('Customer 1'),
                        Icon(Icons.wrong_location_rounded),    ],
                  ),   ],
              )
          ,  SizedBox(width: 8,), Container(
                width: size.width * .3,
                color: Colors.indigo,
              ),  ],
          ),
        ),
      ),
    );
  }
}
