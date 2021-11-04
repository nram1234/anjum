
import 'package:anjum/network/jsonofnwetry/get_first_step_json.dart';
import 'package:anjum/network/newjosomnLast/get_second_step1_json.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'allCustomersControllers.dart';

class All_routesController extends GetxController {
  List<AllRoutes> allRoutes;
  Map<String, AllCustomers> mapOfCustomar = {};
  Map<int, AllRoutes> routMap = {};
  Map<int, AllRoutes> routMaptoshw = {};
List<int>routMaptoshwkeys=[];
var thisweek=0;
  void updateAllRoutes(List<AllRoutes> allroutes) {

   //  allRoutes.clear();
    mapOfCustomar.clear();
   //  routMap.clear();
     routMaptoshwkeys.clear();
     routMaptoshw.clear();


    this.allRoutes = allroutes;
    allCustomarInRouts();
    Get.find<AllCustomersControllers>().allCustomers.forEach((element) {
    print("66666666666666666666666666666666 $element");
      mapOfCustomar[element.id] = element;
    });
    mytryget();
    update();
  }

  @override
  void onInit() {
    super.onInit();


  }

  allCustomarInRouts() {
    DateTime time = DateTime.now();
    final DateFormat formatter = DateFormat('EEEE');
    List<AllCustomers> allCustomers = [];

    List<ListRoutesInfo> listRoutes = [];
    // for(int i=0;i<Get.find<AllCustomersControllers>().allCustomers.length;i++){
    //   for(int p=0;p<allRoutes.length){}
    // }

    for (int p = 0; p < allRoutes.length; p++) {
      routMap[p] = allRoutes[p];
print(allRoutes[p].name);

    }

    //دي الي عامله مشكله التكرار
    routMap.forEach((key, value) {

      value.listRoutesInfo.forEach((element) {
        print(element.schedule);
        Map<String, String> mapOfDay = {};
        mapOfDay["sunday"] = element.sunday;
        mapOfDay["monday"] = element.monday;
        mapOfDay["tuesday"] = element.tuesday;
        mapOfDay["wednesday"] = element.wednesday;
        mapOfDay["thursday"] = element.thursday;
        mapOfDay["saturday"] = element.saturday;
        mapOfDay["friday"] = element.friday;
        DateTime from =  DateTime.parse(element.startDate);
        DateTime todate =   DateTime.parse(element.endDate);
        // print( "${time.isAfter(from) && time.isBefore(todate)}    555555555555555555555555555555555555");
        // print(time.isAfter(from));
        // print(time.day);
        // print(mapOfDay[formatter.format(time).toLowerCase()] == "yes");
        if (time.isAfter(from) && time.isBefore(todate)) {
          // if (element.schedule.toLowerCase() == "weekly") {
          //
          //   if (mapOfDay[formatter.format(time).toLowerCase()] != "yes") {
          //     value.listRoutesInfo.remove(element);
          //  //   allCustomers.add(mapOfCustomar[element.customerId]);
          //   }
          // }

          if (mapOfDay[formatter.format(time).toLowerCase()] == "yes"&&element.schedule=="weekly") {
print("will add $element for key $key");
            if(!routMaptoshwkeys.contains(key)){
              print('routMaptoshwkeys            $key');
              routMaptoshwkeys.add(key);
            }
           // print('key  $key');
            if (routMaptoshw[key] != null) {
              routMaptoshw[key].listRoutesInfo.add(element);
            } else {

              routMaptoshw[key]  = value;
              routMaptoshw[key].listRoutesInfo=[];
              routMaptoshw[key].listRoutesInfo.add(element);
            }
          }
          if(element.schedule=="monthly"){


            Map<String, String> mapOfweek = {};
            mapOfweek["1st"] = element.s1st;
            mapOfweek["2nd"] = element.s2nd;
            mapOfweek["3rd"] = element.s3rd;
            mapOfweek["4th"] = element.s4th;
            mapOfweek["5th"] = element.s5th;

            mapOfweek.forEach((keye, valueee) {
              print('lllllllllllllllll');
print(valueee=="yes"&&int.parse(keye[0])==thisweek);
              if(valueee=="yes"&&int.parse(keye[0])==thisweek){

                print('1111111111111111111111111111111111111111111111111111111111111111111111');
                print(int.parse(keye[0])==thisweek);
                print(int.parse(keye[0]));
                print( thisweek);
                print('1111111111111111111111111111111111111111111111111111111111111111111111');
                //  if(!routMaptoshwkeys.contains(key )){
                //    print('routMaptoshwkeys            $key');
                //    routMaptoshwkeys.add( key  );
                //  }
                //  if (routMaptoshw[key] != null) {
                //    routMaptoshw[key].listRoutesInfo.add(element);
                //  } else {
                //
                //    routMaptoshw[key]  = value;
                //    routMaptoshw[key].listRoutesInfo=[];
                //    routMaptoshw[key].listRoutesInfo.add(element);
                //  }

                if (mapOfDay[formatter.format(time).toLowerCase()] == "yes") {

                  if(!routMaptoshwkeys.contains(key)){
                    print('routMaptoshwkeys            $key');
                    routMaptoshwkeys.add(key);
                  }
                  // print('key  $key');
                  if (routMaptoshw[key] != null) {
                    routMaptoshw[key].listRoutesInfo.add(element);
                  } else {

                    routMaptoshw[key]  = value;
                    routMaptoshw[key].listRoutesInfo=[];
                    routMaptoshw[key].listRoutesInfo.add(element);
                  }
                }




              }
            });



          }  }

      });
    });
    update();
    //  listCustomers.forEach((element) {
    //    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    //    DateTime from=DateTime.parse(element.);
    // if(time.isBefore(element.))
    //  });

    // listRoutes.forEach((element) {
    //   print('thursday    ${element.wednesday}' );
    //   print('customerId    ${element.customerId}' );
    //   print('element    ${formatter.format(time).toLowerCase()}' );
    //
    //   Map<String, String> mapOfDay = {};
    //   mapOfDay["sunday"] = element.sunday;
    //   mapOfDay["monday"] = element.monday;
    //   mapOfDay["tuesday"] = element.tuesday;
    //   mapOfDay["wednesday"] = element.wednesday;
    //   mapOfDay["thursday"] = element.thursday;
    //   mapOfDay["saturday"] = element.saturday;
    //   mapOfDay["friday"] = element.friday;
    //
    //   DateTime from = DateTime.parse(element.startDate);
    //   DateTime todate = DateTime.parse(element.endDate);
    //   if (time.isAfter(from) && time.isBefore(todate)) {
    //     if (element.schedule.toLowerCase() == "weekly") {
    //
    //       if (mapOfDay[formatter.format(time).toLowerCase()] == "yes") {
    //       print(mapOfCustomar);
    //          allCustomers.add(mapOfCustomar[element.customerId]);
    //       }
    //     }
    //   }
    // });
  }
  mytryget(){
    // Current date and time of system
    String date = DateTime.now().toString();

// This will generate the time and date for first day of month
    String firstDay = date.substring(0, 8) + '01' + date.substring(10);

// week day for the first day of the month
    int weekDay = DateTime.parse(firstDay).weekday;

    DateTime testDate = DateTime.now();

    int weekOfMonth;

//  If your calender starts from Monday
    weekDay--;
    weekOfMonth = ((testDate.day + weekDay) / 7).ceil();
    print('Week of the month: $weekOfMonth');
    weekDay++;

// If your calender starts from sunday
    if (weekDay == 7) {
      weekDay = 0;
    }
    weekOfMonth = ((testDate.day + weekDay) / 7).ceil();
    thisweek=weekOfMonth;
    print('Week of the month: $weekOfMonth');
    update(); }
}
