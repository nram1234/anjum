import 'package:location/location.dart';
var boxsizehigh=.008;
LocationData firesvisittlocation;
LocationData endvisittlocation;

LocationData firesjornytlocation;
LocationData endjornylocation;

bool startJourney=false;
DateTime jornystartTime;
DateTime jornyEndTime;



getMyLoction(LocationData locationData)async{

  Location location = new Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;


  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      return;
    }
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.DENIED) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.GRANTED) {
      return;
    }
  }

  location.getLocation().then((value) {
    locationData=value;
  });


}