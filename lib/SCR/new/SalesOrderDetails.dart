import 'package:flutter/material.dart';
class SalesOrderDetails extends StatefulWidget {
  @override
  _SalesOrderDetailsState createState() => _SalesOrderDetailsState();
}

class _SalesOrderDetailsState extends State<SalesOrderDetails> {
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
                          'Sales Order Details',
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
                  color: Colors.white
              ),
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 65,
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 25),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
                          color: Color(0xffeeeeee)
                      ),
                      child: Text("Sales Order"),
                    ),
                    ListView.builder(
                      itemCount: 10,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Text("Order No : "),
                              Spacer(),
                              Text("25"),
                            ],
                          ),
                        );
                    })
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
