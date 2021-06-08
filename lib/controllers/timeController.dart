import 'dart:async';

import 'package:get/state_manager.dart';

class TimeController extends GetxController{
  var startswatch=false.obs;
  var swatch=Stopwatch();
  var stoptimedisplay='00:00:00'.obs;
  starttime(){
    Timer(Duration(seconds: 1),keeprunning);

  }
  keeprunning(){
if(swatch.isRunning){
  starttime();
  stoptimedisplay.value=swatch.elapsed.inHours.toString().padLeft(2,"0")+":"+
   (   swatch.elapsed.inMinutes %60).toString().padLeft(2,"0")+":" +(   swatch.elapsed.inSeconds %60).toString().padLeft(2,"0");
}
update();
  }
  startjor(){
    startswatch.value=true;
    swatch.start();
    starttime();
update();
  }
  stopjor(){
    startswatch.value=false;
    swatch.stop();
    update();
  }
}

























